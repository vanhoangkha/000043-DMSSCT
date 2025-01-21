---
title: "Cấu hình CSDL nguồn - MS SQL Server"
weight: 2
chapter: false
pre: "<b> 2.2.2. </b>"
---

{{% notice info %}}

Khi dịch chuyển cơ sở dữ liệu Microsoft SQL Server của bạn bằng AWS DMS, bạn có thể chọn chỉ di chuyển dữ liệu hiện có, di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra hoặc di chuyển dữ liệu hiện có và sử dụng chức năng sao lưu dữ liệu đang thay đổi (Change Data Capture - CDC) để sao chép các thay đổi đang diễn ra. Việc dịch chuyển dữ liệu đã có không yêu cầu bất kỳ cấu hình nào trên cơ sở dữ liệu SQL Server nguồn. Tuy nhiên, để di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra, bạn cần bật MS-REPLICATION hoặc MS-CDC.

{{% /notice %}}

1. Với SQL Server Managment studio, bạn sẽ thực thi một tập lệnh SQL sẽ cấu hình cơ sở dữ liệu SQL Server nguồn để sao chép. Trước tiên, hãy đảm bảo có cửa sổ truy vấn nếu không, hãy nhấp vào biểu tượng **New query** phía trên nút thực thi để mở cửa sổ truy vấn mới.

    ![New Query button](/images/2/2/2/0001.png?width=90pc)

1. Sao chép các lệnh SQL bên dưới bằng cách sử dụng nút sao chép ở góc trên bên phải của khối mã, sau đó dán vào trình soạn thảo truy vấn SQL Server Management Studio và thực thi toàn bộ khối mã (**Ctrl + A** đối với người dùng Windows để tô sáng toàn bộ khối) và nhấp vào nút **Execute** để thực thi.

{{% notice note %}}
Chúng tôi sẽ chạy bản sao lưu trên cơ sở dữ liệu cùng một số tập lệnh khác nên sẽ mất khoảng 5-12 phút để chạy từ đầu đến cuối. Sau khi bạn bắt đầu tập lệnh, vui lòng tiến hành bước tiếp theo và quay lại sau vài phút để đảm bảo hoàn tất. Bạn có thể vào tab tin nhắn để theo dõi tiến trình.
{{% /notice %}}

```sql
--Set master database context
use [master]
GO
--Add the awssct login to the sysadmin server role - required for replication
ALTER SERVER ROLE [sysadmin] ADD MEMBER [dbadmin]
GO
--Set the recovery model to full for dms_sample - required for replication
ALTER DATABASE [dms_sample] SET RECOVERY FULL WITH NO_WAIT
GO
BACKUP DATABASE dms_sample
TO DISK = 'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\Backup\dms_sample-fullbkup.bak'
WITH FORMAT, COMPRESSION,  STATS = 5;
GO
--Configure this SQL Server as its own distributor
exec sp_adddistributor @distributor = @@SERVERNAME, @password = N'Password1'
exec sp_adddistributiondb @database = N'distribution', @data_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA', @log_folder = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA', @log_file_size = 2, @min_distretention = 0, @max_distretention = 72, @history_retention = 48, @security_mode = 1
GO
RECONFIGURE
go 
--Change context to the distribution database
use [distribution] 
GO
--Configure replication
if (not exists (select * from sysobjects where name = 'UIProperties' and type = 'U ')) 
    create table UIProperties(id int) 
if (exists (select * from ::fn_listextendedproperty('SnapshotFolder', 'user', 'dbo', 'table', 'UIProperties', null, null))) 
    EXEC sp_updateextendedproperty N'SnapshotFolder', N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\repldata', 'user', dbo, 'table', 'UIProperties' 
else 
    EXEC sp_addextendedproperty N'SnapshotFolder', N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\repldata', 'user', dbo, 'table', 'UIProperties'
GO
RECONFIGURE
go 
exec sp_adddistpublisher @publisher = @@SERVERNAME, @distribution_db = N'distribution', @security_mode = 1, @working_directory = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\repldata', @trusted = N'false', @thirdparty_flag = 0, @publisher_type = N'MSSQLSERVER'
GO
/*  Oct 2024 temp script additional ******
Temporary Script to create publication and add articles for purpose of Full Load and CDC DMS task to address issue with SQL Server 2022 CU2+ Oct-2024
hopefully by end of 2024 we can remove it 

INSTRUCTIONS FOR USE
1. Set the session context to the DB you wish to migrate.
2. If you wish to exclude specific user tables that would normally be included, these table names can be added in the field marked by the string "ExplicitlyExcludedTables". The script contains logic to automatically exclude tables without Primary Keys, system tables and DMS related tables.
*/
use [dms_sample] 
go 

--- Phase 1: Create Publication
--- Declare variables
DECLARE @db_name NVARCHAR(255);
SET @db_name = DB_NAME(); 
--Set DB for Replication
IF not exists
(
SELECT 1 FROM sysdatabases d where d.dbid=db_id() and (category & 1)<>0
)
BEGIN
EXEC sp_replicationdboption @dbname = @db_name, @optname = 'publish', @value = 'true'
END
---Declare variables
DECLARE @database_id INT;
DECLARE @publication_name NVARCHAR(255);
DECLARE @publication_description NVARCHAR(MAX);
DECLARE @sql_sp_addarticle NVARCHAR(MAX);
DECLARE @sql_sp_articlefilter NVARCHAR(MAX);
DECLARE @article_name NVARCHAR(255);
DECLARE @article_filter_name NVARCHAR(255);
DECLARE @schema_name NVARCHAR(128);
DECLARE @table_name NVARCHAR(128);
DECLARE @object_id NVARCHAR(128);
DECLARE @instance_name NVARCHAR(255);
SET @instance_name = @@servername;
SET @database_id = (SELECT DB_ID());
IF @database_id<10
    BEGIN
    SET @publication_name = CONCAT('AR_PUBLICATION_0000',@database_id);
    SET @article_name = CONCAT('AR_ARTICLE_0000',@database_id);
    SET @article_filter_name = CONCAT('AR_ARTICLE_0000',@database_id);
    END
ELSE IF @database_id>=10 and @database_id<100
    BEGIN
    SET @publication_name = CONCAT ('AR_PUBLICATION_000',@database_id);
    SET @article_name = CONCAT('AR_ARTICLE_000',@database_id);
    SET @article_filter_name = CONCAT('AR_ARTICLE_000',@database_id);
    END
ELSE IF @database_id>=100 and @database_id<1000
    BEGIN
    SET @publication_name = CONCAT ('AR_PUBLICATION_00',@database_id);
    SET @article_name = CONCAT('AR_ARTICLE_00',@database_id);
    SET @article_filter_name = CONCAT('AR_ARTICLE_00',@database_id);
    END
ELSE IF @database_id>=1000 and @database_id<10000
    BEGIN
    SET @publication_name = CONCAT ('AR_PUBLICATION_0',@database_id);
    SET @article_name = CONCAT('AR_ARTICLE_0',@database_id);
    SET @article_filter_name = CONCAT('AR_ARTICLE_0',@database_id);
    END
ELSE
    BEGIN
    SET @publication_name = CONCAT ('AR_PUBLICATION_',@database_id);
    SET @article_name = CONCAT('AR_ARTICLE_',@database_id);
    SET @article_filter_name = CONCAT('AR_ARTICLE_',@database_id);
    END;
SET @publication_description = CONCAT('AWS Schema Conversion Tool DMS Agent: Anonymous Transactional publication for Database: ', @db_name,' from Publisher: ', @instance_name,'.');
if not exists (select name from syspublications where name=@publication_name)
exec sp_addpublication
@publication = @publication_name,
@description = @publication_description,
@sync_method = N'native',
@retention = 1,
@allow_push = N'true',
@allow_pull = N'true',
@allow_anonymous = N'true',
@enabled_for_internet = N'false',
@snapshot_in_defaultfolder = N'true',
@compress_snapshot = N'false',
@ftp_port = 21,
@ftp_login = N'anonymous',
@allow_subscription_copy = N'false',
@add_to_active_directory = N'false',
@repl_freq = N'continuous',
@status = N'active',
@independent_agent = N'true',
@immediate_sync = N'true',
@allow_sync_tran = N'false',
@autogen_sync_procs = N'false',
@allow_queued_tran = N'false',
@allow_dts = N'false',
@replicate_ddl = 1,
@allow_initialize_from_backup = N'false',
@enabled_for_p2p = N'false',
@enabled_for_het_sub = N'false';
--- Phase 2 : Add articles to Publication
-- Create a Temporary table that has all the tables from sql server and exclude any system related tables pertaining to DMS, as well as user defined exclusions.
select
SCHEMA_NAME(uid) as TABLE_SCHEMA,
name as TABLE_NAME
into #entire_list
from sys.sysobjects
where
type in ('U')
and (category=0 or category = 32)
and objectproperty(id, 'TableHasPrimaryKey') =1
and objectproperty( id , 'IsSystemTable' ) =0
and name not like 'awsdms_changes%' and name not like 'awsdms_apply%' and name not like 'awsdms_truncation%' and name not like 'awsdms_cdc_%awsdms_full_load_exceptions%'
and name not in ('awsdms_audit_table','awsdms_status','awsdms_suspended_tables','awsdms_history','awsdms_validation_failure') 
and name not in ('') --ExplicitlyExcludedTables
order by TABLE_SCHEMA,TABLE_NAME
--- Tạo bảng tạm chứa tất cả các bảng đã nằm trong bản công bố SQL Server
select A.source_owner as TABLE_SCHEMA, A.source_object as TABLE_NAME
INTO #All_published
FROM distribution.dbo.MsArticles AS A
INNER JOIN distribution.dbo.MSpublications AS P
ON A.publication_id=P.publication_id
and P.publication =@publication_name
order by TABLE_SCHEMA,TABLE_NAME
--- Tìm bảng trong csdl nhưng không thêm vào quá trình công bố các giao dịch
select A.TABLE_SCHEMA, A.TABLE_NAME into #filtered_list FROM
(
select TABLE_SCHEMA,TABLE_NAME from #entire_list
EXCEPT
select TABLE_SCHEMA, TABLE_NAME from #All_published
) A
--- Khai báo con trỏ
DECLARE add_article_publication CURSOR FOR
select obj.name AS TABLE_NAME, obj.object_id as OBEJCT_ID,sch.name AS SCHEMA_NAME from sys.objects obj, sys.schemas sch
where sch.schema_id = obj.schema_id and sch.name in (select TABLE_SCHEMA from #filtered_list)
and obj.name in (select TABLE_NAME from #filtered_list)
--- Mở con trỏ và thêm article vào publication
OPEN add_article_publication;
FETCH NEXT FROM add_article_publication INTO @table_name, @object_id, @schema_name;
WHILE @@FETCH_STATUS = 0
BEGIN

    SET @sql_sp_addarticle ='exec sys.sp_addarticle @publication = N''' + @publication_name + ''', @article = N''' + @article_name
    + '_' + @object_id + ''', @source_owner = N''' + @schema_name + ''', @source_object = N''' + @table_name +
''', @type = N''logbased'', @creation_script = N'''', @description = N'''',
@schema_option = 0x050D3, @pre_creation_cmd = N''drop'', @identityrangemanagementoption = N''none''
,@status = 16, @vertical_partition = N''false'', @ins_cmd = N''CALL [sp_MSins_' + @table_name + ']'',@del_cmd = N''CALL [sp_MSdel_' +@table_name + ']'',@upd_cmd = N''MCALL [sp_MSupd_'
+ @table_name + ']'',@filter_clause = N''(1=0)'''
    EXEC sp_executesql @sql_sp_addarticle
    SET @sql_sp_articlefilter = 'exec sys.sp_articlefilter @publication = N'''+ @publication_name + '''
, @article = N'''+ @article_name + '_' + @object_id + '''
, @filter_name = N''' + @article_filter_name + '_' + @object_id + '''
, @filter_clause = N''(1=0)'', @force_invalidate_snapshot = 1, @force_reinit_subscription = 1
'
    EXEC sp_executesql @sql_sp_articlefilter
    FETCH NEXT FROM add_article_publication INTO @table_name, @object_id, @schema_name;
END
--- Dọn dẹp - xóa bảng tạm và con trỏ
CLOSE add_article_publication;
DEALLOCATE add_article_publication;
DROP TABLE #filtered_list
DROP TABLE #All_published
DROP TABLE #entire_list
```

3. Execute the script above

    ![Query Result](/images/2/2/2/0002.png?width=90pc)

### Summary

Bài thực hành này trình bày các bước để thiết lập cơ sở dữ liệu SQL Server làm nguồn cho Việc dịch chuyển cơ sở dữ liệu. Các bước tiếp theo là chọn mục tiêu của bạn và làm theo các bước để di chuyển dữ liệu SQL Server của bạn đến mục tiêu đó trong phần đó.