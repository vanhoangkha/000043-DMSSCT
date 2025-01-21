---
title: "Configure The Source Oracle Database"
weight: 2
chapter: false
pre: "<b> 2.1.2. </b>"
---

To use Oracle as a source for **AWS Database Migration Service (AWS DMS)**, you must first provide a DMS user account with read and write privileges on the Oracle database.

You also need to ensure that **ArchiveLog Mode** is on to provide information to **_LogMiner_**. AWS DMS uses LogMiner to read information from the archive logs so that AWS DMS can capture changes.

For AWS DMS to read this information, make sure the archive logs are retained on the database server as long as AWS DMS requires them. Retaining archive logs for 24 hours is usually sufficient.

To capture change data, AWS DMS requires database-level supplemental logging to be enabled on your source database. Doing this ensures that the LogMiner has the minimal information to support various table structures such as clustered and index-organized tables.

Similarly, you need to enable table-level supplemental logging for each table that you want to migrate.

1. Click on the SQL Worksheet icon within Oracle SQL Developer, then connect to the Source Oracle database.

2. Next, copy, paste and execute the below statements to grant the following privileges to the AWS DMS user to access the source Oracle endpoint:

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

### Summary

This lab demonstrated steps for setting Oracle database as a source for Database Migration. The next steps are to select your target and follow the steps to move your Oracle data to it.