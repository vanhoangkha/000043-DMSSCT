---
title: "Cấu hình CSDL nguồn"
weight: 2
chapter: false
pre: "<b> 2.1.2. </b>"
---

Để sử dụng Oracle làm nguồn cho **AWS Database Migration Service (AWS DMS)**, trước tiên bạn phải cung cấp quyền đọc và ghi trên cơ sở dữ liệu Oracle cho một tài khoản người dùng DMS.

Bạn cũng cần đảm bảo rằng chế độ **ArchiveLog** được bật để cung cấp thông tin cho **_LogMiner_**. AWS DMS sử dụng LogMiner để đọc thông tin từ log lưu trữ để AWS DMS có thể ghi lại các thay đổi.

Để AWS DMS đọc được thông tin này, hãy đảm bảo rằng log lưu trữ được lưu giữ trên máy chủ cơ sở dữ liệu miễn là AWS DMS yêu cầu. Việc lưu giữ log lưu trữ trong 24 giờ thường là đủ.

Để ghi lại dữ liệu thay đổi, AWS DMS yêu cầu bật ghi log bổ sung cấp cơ sở dữ liệu trên cơ sở dữ liệu nguồn của bạn. Việc này đảm bảo rằng LogMiner có thông tin tối thiểu để hỗ trợ nhiều cấu trúc bảng khác nhau như bảng được nhóm lại và được sắp xếp theo chỉ mục.

Tương tự như vậy, bạn cần bật ghi log bổ sung cấp bảng cho mỗi bảng mà bạn muốn di chuyển.

1. Nhấp vào biểu tượng Bảng tính SQL trong Oracle SQL Developer, sau đó kết nối với cơ sở dữ liệu Oracle nguồn.

2. Tiếp theo, chép, dán và thực thi các câu lệnh bên dưới để cấp các đặc quyền sau cho người dùng AWS DMS để truy cập điểm cuối Oracle nguồn:

    ```sql
    GRANT CREATE SESSION to DMS_USER;
    GRANT SELECT ANY TABLE to DMS_USER;
    GRANT SELECT ANY TRANSACTION to DMS_USER;
    GRANT SELECT on DBA_TABLESPACES to DMS_USER;
    --GRANT SELECT ON any-replicated-table to DMS_USER; ---has issues
    GRANT EXECUTE on rdsadmin.rdsadmin_util to DMS_USER;
    -- For Oracle 12c only:
    GRANT LOGMINING to DMS_USER;
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_VIEWS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_PARTITIONS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_INDEXES', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_OBJECTS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_TABLES', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_USERS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_CATALOG', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONSTRAINTS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_CONS_COLUMNS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_TAB_COLS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_IND_COLUMNS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_LOG_GROUPS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$CONTAINERS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('OBJ$', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS', 'DMS_USER', 'SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','DMS_USER','SELECT');
    exec rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR', 'DMS_USER', 'EXECUTE');
    -- (as of Oracle versions 12.1 and later)
    exec rdsadmin.rdsadmin_util.grant_sys_object('REGISTRY$SQLPATCH', 'DMS_USER', 'SELECT');
    -- (for Amazon RDS Active Dataguard Standby (ADG))
    exec rdsadmin.rdsadmin_util.grant_sys_object('V_$STANDBY_LOG', 'DMS_USER', 'SELECT'); 
    -- (for transparent data encryption (TDE))
    exec rdsadmin.rdsadmin_util.grant_sys_object('ENC$', 'DMS_USER', 'SELECT'); 
    -- (for validation with LOB columns)
    exec rdsadmin.rdsadmin_util.grant_sys_object('DBMS_CRYPTO', 'DMS_USER', 'EXECUTE');
    -- (for binary reader)
    exec rdsadmin.rdsadmin_util.grant_sys_object('DBA_DIRECTORIES','DMS_USER','SELECT');  

    ---archive log & supplement log for cdc 
    exec rdsadmin.rdsadmin_util.set_configuration('archivelog retention hours',24);
    exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD');
    exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD','PRIMARY KEY');
    alter table dms_sample.nfl_stadium_data add supplemental log data (ALL) columns;
    alter table dms_sample.mlb_data add supplemental log data (ALL) columns;
    alter table dms_sample.nfl_data add supplemental log data (ALL) columns;
    ```
![](/images/2/1/2/0001.png?width=90pc)

### Tóm lại

Bài thực hành này trình bày các bước để thiết lập cơ sở dữ liệu Oracle làm cơ sở dữ liệu nguồn cho quá trình dịch chuyển. Các bước tiếp theo bao gồm chọn và làm theo các bước để dịch chuyển dữ liệu Oracle của bạn đến CSDL đích.