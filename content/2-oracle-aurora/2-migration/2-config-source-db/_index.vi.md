+++
title = "Cấu hình Database Nguồn"
date = 2020
weight = 2
chapter = false
pre = "<b>2.2.2. </b>"
+++

**Nội dung**
- [Cấu hình Database Nguồn](#cấu-hình-database-nguồn)

---

#### Cấu hình Database Nguồn

Để sử dụng Oracle làm nguồn cho AWS Database Migration Service (AWS DMS), trước tiên bạn phải cung cấp tài khoản người dùng (người dùng DMS) với các đặc quyền đọc và ghi trên cơ sở dữ liệu Oracle.

Bạn cũng cần đảm bảo rằng ARCHIVELOG MODE đang bật để cung cấp thông tin cho LogMiner. AWS DMS sử dụng LogMiner để đọc thông tin từ nhật ký lưu trữ để AWS DMS có thể nắm bắt các thay đổi.

Để AWS DMS đọc được thông tin này, hãy đảm bảo rằng các nhật ký lưu trữ được giữ lại trên máy chủ cơ sở dữ liệu khi AWS DMS yêu cầu chúng. Thông thường, lưu giữ nhật ký lưu trữ trong 24 giờ là đủ.

Để nắm bắt dữ liệu thay đổi, AWS DMS yêu cầu bật tính năng database-level supplemental logging trên cơ sở dữ liệu nguồn của bạn. Điều này đảm bảo rằng LogMiner có thông tin tối thiểu để hỗ trợ các cấu trúc bảng khác nhau, chẳng hạn như các bảng được tổ chức theo cluster và được tổ chức theo index.

Tương tự, bạn cần bật table-level supplemental logging cho từng bảng mà bạn muốn di chuyển.

1. Chọn vào biểu tượng **SQL Worksheet** trong **Oracle SQL Developer**, sau đó kết nối đến **CSDL Nguồn Oracle**.

![Source Database](/images/2/27.png?width=90pc)

2. Tiếp theo, thực hiện các câu lệnh dưới đây để cấp các đặc quyền sau cho **AWS DMS user** để truy cập **Oracle endpoint**:

```sql
GRANT SELECT ANY TABLE to DMS_USER;
GRANT SELECT on ALL_VIEWS to DMS_USER;
GRANT SELECT ANY TRANSACTION to DMS_USER;
GRANT SELECT on DBA_TABLESPACES to DMS_USER;
GRANT SELECT on ALL_TAB_PARTITIONS to DMS_USER;
GRANT SELECT on ALL_INDEXES to DMS_USER;
GRANT SELECT on ALL_OBJECTS to DMS_USER;
GRANT SELECT on ALL_TABLES to DMS_USER;
GRANT SELECT on ALL_USERS to DMS_USER;
GRANT SELECT on ALL_CATALOG to DMS_USER;
GRANT SELECT on ALL_CONSTRAINTS to DMS_USER;
GRANT SELECT on ALL_CONS_COLUMNS to DMS_USER;
GRANT SELECT on ALL_TAB_COLS to DMS_USER;
GRANT SELECT on ALL_IND_COLUMNS to DMS_USER;
GRANT SELECT on ALL_LOG_GROUPS to DMS_USER;
GRANT LOGMINING TO DMS_USER;
```

![Source Database](/images/2/28.png?width=90pc)

3. Ngoài ra, hãy chạy như sau:

```bash
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$ARCHIVED_LOG','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOG','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGFILE','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$DATABASE','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$THREAD','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$PARAMETER','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$NLS_PARAMETERS','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TIMEZONE_NAMES','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$TRANSACTION','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('DBA_REGISTRY','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('OBJ$','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('ALL_ENCRYPTED_COLUMNS','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_LOGS','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('V_$LOGMNR_CONTENTS','DMS_USER','SELECT');
exec rdsadmin.rdsadmin_util.grant_sys_object('DBMS_LOGMNR','DMS_USER','EXECUTE');
```

![Source Database](/images/2/29.png?width=90pc)

4. Chạy truy vấn sau để giữ lại nhật ký làm lại đã lưu trữ của phiên bản cơ sở dữ liệu Oracle nguồn trong 24 giờ:

```bash
exec rdsadmin.rdsadmin_util.set_configuration('archivelog retention hours',24);
```

5. Chạy truy vấn sau để bật database-level supplemental logging:

```bash
exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD');
```

6. Chạy truy vấn sau để bật ghi nhật ký PRIMARY KEY cho các bảng có khóa chính:

```bash
exec rdsadmin.rdsadmin_util.alter_supplemental_logging('ADD','PRIMARY KEY');
```

7. Chạy các truy vấn sau để thêm supplemental logging cho các bảng không có khóa chính:

```sql
alter table dms_sample.nfl_stadium_data add supplemental log data (ALL) columns;
alter table dms_sample.mlb_data add supplemental log data (ALL) columns;
alter table dms_sample.nfl_data add supplemental log data (ALL) columns;
```

![Source Database](/images/2/30.png?width=90pc)
