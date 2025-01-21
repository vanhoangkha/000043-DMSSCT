---
title: "Microsoft SQL Server target"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

In this page, you will inspect the target database after migration.

1. Open Microsoft SQL Server Management Studio from within the RDP-ed onto EC2 server.

1. Follow the instructions described earlier to connect to the Target RDS SQL Server instance.

1. Inspect the migrated RDS SQL database (dms_sample_target) content, and make sure the following tables have migrated over. You can do that by opening a New Query window to execute the following statement.

    ```sql
    use dms_sample_target
    SELECT *
    FROM dms_sample_target.INFORMATION_SCHEMA.TABLES;
    GO
    ```

1. For Oracle Source, this should show 15 dms_sample base tables and 1 DMS related apply exceptions table for a total of 16 tables created

1. For SQL Server Source, this should show 16 dms_sample base tables and 1 DMS related apply exceptions table for a total of 17 tables created

1. Next, execute the following query:

    ```sql
    use dms_sample_target
    SELECT * FROM dms_sample_target.sport_type;
    GO
    ```

    ![](/images/3/2/5/a/0001.png?width=80pc)

{{% notice info %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
{{% /notice %}}