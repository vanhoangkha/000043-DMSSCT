---
title: "Create a DMS Migration Task"
weight: 4
chapter: false
pre: "<b> 3.2.4. </b>"
---

AWS DMS uses **Database Migration Tasks** to migrate the data from source to the target database.

1. Click on **Database migration tasks** on the left-hand menu, then click on the **Create task** button on the top right corner.

    ![Create task](/images/3/2/4/0001.png?width=80pc)

1. Create a data migration task with the following values for migrating the `**dms_sample**` database.

    {{% expand "Expand this if your target type is Aurora (MySQL)" %}}

|  Parameter 	|  Value  |
|------------|---------------|
|  Task identifier		|  `source-to-AuroraMySQL-target`  |
|  Replication instance		|  `cfn-dmsreplication` or just `dmsreplication`  |
|  Source database endpoint		|  your source database (SQL Server, Oracle, etc.) from prior step  |
|  Target database endpoint		|  `aurora-target` or `cfn-auroramysqlinstance` or whatever you named it in prior step  |
|  Migration type		|  Migrate existing data and replicate ongoing changes  |
|  CDC stop mode		|  Don’t use custom CDC stop mode  |
|  Create recovery table on target DB		|  leave blank/unchecked  |
|  Target table preparation mode		|  Do nothing (not the default)  |
|  Stop task after full load completes		|  Don’t stop  |
|  LOB Column settings / Include LOB columns in replication		|  Limited LOB mode  |
|  Max LOB size (KB)		|  32  |
|  Data Validation		|  Unchecked  |
|  Task Logs / Enable CloudWatch logs		|  Check Enable CloudWatch logs (not the default)  |
|  Log Context		|  leave checked take default levels on logging  |
|  Batch-optimized apply if visible		|  **Turn on batched optimized apply** -> Unchecked  |

    {{% /expand %}}

    {{% expand "Expand this if your target type is Aurora (PostgreSQL)" %}}

|  Parameter 	|  Value  |
|------------|---------------|
|  Task identifier		|  `	source-to-aupg-migration-task`  |
|  Replication instance		|  `cfn-dmsreplication` or just `dmsreplication`  |
|  Source database endpoint		|  your source database (SQL Server, Oracle, etc.) from prior step  |
|  Target database endpoint		|  `aurora-target` or `cfn-aurorapostgresql*` or whatever you named it in prior step  |
|  Migration type		|  Migrate existing data and replicate ongoing changes  |
|  CDC stop mode		|  Don’t use custom CDC stop mode  |
|  Create recovery table on target DB		|  leave blank/unchecked  |
|  Target table preparation mode		|  Do nothing (not the default)  |
|  Stop task after full load completes		|  Don’t stop  |
|  LOB Column settings / Include LOB columns in replication		|  Limited LOB mode  |
|  Max LOB size (KB)		|  32  |
|  Data Validation		|  Unchecked  |
|  Task Logs / Enable CloudWatch logs		|  Check Enable CloudWatch logs (not the default)  |
|  Log Context		|  leave checked take default levels on logging  |
|  Batch-optimized apply if visible		|  **Turn on batched optimized apply** -> Unchecked  |

    {{% /expand %}}

    {{% expand "Expand this if your target type is RDS Microsoft SQL Server:" %}}

|  Parameter 	|  Value  |
|------------|---------------|
|  Task identifier		|  `source-to-sqlserver-target`  |
|  Replication instance		|  `cfn-dmsreplication` or just `dmsreplication`  |
|  Source database endpoint		|  your source database SQL Server or Oracle etc from prior step  |
|  Target database endpoint		|  `sqlserver-target` or whatever you named it in prior step  |
|  Migration type		|  Migrate existing data and replicate ongoing changes  |
|  CDC stop mode		|  Don’t use custom CDC stop mode  |
|  Create recovery table on target DB		|  leave blank/unchecked  |
|  Target table preparation mode		|  Do nothing (not the default)  |
|  Stop task after full load completes		|  Don’t stop  |
|  LOB Column settings / Include LOB columns in replication		|  Limited LOB mode  |
|  Max LOB size (KB)		|  32  |
|  Data Validation		|  Unchecked  |
|  Task Logs / Enable CloudWatch logs		|  Check Enable CloudWatch logs (not the default)  |
|  Log Context		|  leave checked take default levels on logging  |
|  Batch-optimized apply if visible		|  **Turn on batched optimized apply** -> Unchecked  |

    {{% /expand %}}


    {{% expand "Expand this if your target type is Oracle:" %}}
    
|  Parameter 	|  Value  |
|------------|---------------|
|  Task identifier		|  `source-to-oracle-target`  |
|  Replication instance		|  `cfn-dmsreplication` or just `dmsreplication`  |
|  Source database endpoint		|  your source database SQL Server or Oracle etc from prior step  |
|  Target database endpoint		|  `oracle-target` or whatever you named it in prior step  |
|  Migration type		|  Migrate existing data and replicate ongoing changes  |
|  CDC stop mode		|  Don’t use custom CDC stop mode  |
|  Create recovery table on target DB		|  leave blank/unchecked  |
|  Target table preparation mode		|  Do nothing (not the default)  |
|  Stop task after full load completes		|  Don’t stop  |
|  LOB Column settings / Include LOB columns in replication		|  Limited LOB mode  |
|  Max LOB size (KB)		|  32  |
|  Data Validation		|  Unchecked  |
|  Task Logs / Enable CloudWatch logs		|  Check Enable CloudWatch logs (not the default)  |
|  Log Context		|  leave checked take default levels on logging  |
|  Batch-optimized apply if visible		|  **Turn on batched optimized apply** -> Unchecked  |

    {{% /expand %}}

    {{% expand "Expand this if your target type is Amazon S3:" %}}
|  Parameter 	|  Value  |
|------------|---------------|
|  Task identifier		|  `source-to-s3-target`  |
|  Replication instance		|  `cfn-dmsreplication` or just `dmsreplication`  |
|  Source database endpoint		|  your source database SQL Server or Oracle etc from prior step  |
|  Target database endpoint		|  `s3-target` or whatever you named it in prior step  |
|  Migration type		|  Migrate existing data and replicate ongoing changes  |
|  CDC stop mode		|  Don’t use custom CDC stop mode  |
|  Create recovery table on target DB		|  leave blank/unchecked  |
|  Target table preparation mode		|  Do nothing (not the default)  |
|  Stop task after full load completes		|  Don’t stop  |
|  LOB Column settings / Include LOB columns in replication		|  Limited LOB mode  |
|  Max LOB size (KB)		|  32  |
|  Data Validation		|  Unchecked  |
|  Task Logs / Enable CloudWatch logs		|  Check Enable CloudWatch logs (not the default)  |
|  Log Context		|  leave checked take default levels on logging  |
|  Batch-optimized apply if visible		|  Turn on batched optimized apply Unchecked  |
    {{% /expand %}}

    ![Create task](/images/3/2/4/0002.png?width=80pc)

    ![Create task](/images/3/2/4/0003.png?width=80pc)

1. Expand the **Table mappings** section, and select **Wizard** for the editing mode.

    ![Create task](/images/3/2/4/0004.png?width=80pc)

1. Click on **Add new selection rule** button and enter the following values in the form:

    - For Oracle source, use:

    |  Parameter	 |  Value  |
    |------------|---------------|
    |  Schema	 |  DMS_SAMPLE%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |

    - For SQL Server source, use:

    |  Parameter	 |  Value  |
    |----------|------------|
    |  Schema	 |  dbo%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |
    
{{% notice tip %}}

If the **Create Task** screen does not recognize any schemas, make sure to go back to endpoints screen and click on your endpoint. Scroll to the bottom of the page and click on Refresh Button **(⟳)** in the **Schemas** section. If your schemas still do not show up on the **Create Task** screen, click on the Guided tab and manually select `**dbo**` schema and all tables.

{{% /notice %}}

5. Next, expand the Transformation rules section, and click on Add new transformation rule using the following values:

    - For Oracle source, use:

        - Rule 1:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Action	 |  Make lowercase  |

        - Rule 2:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Table  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Table Name	 |  %  |
        |  Action	 |  Make lowercase  |

        - Rule 3:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Column  |
        |  Schema Name	 |  `DMS_SAMPLE`  |
        |  Table Name	 |  `%`  |
        |  Column Name	 |  `%`  |
        |  Action	 |  Make lowercase  |

    - For SQL Server Source, use:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  `%` (if Microsoft SQL is used) or `%dbo`  |
        |  Action	 |  Rename to: `dms_sample_dbo` or `dms_sample_target`  |

1. Uncheck **Turn on premigration assessment** this should collapse this section for our workshop this part there isn't time for and it isn't required.

1. After entering the values, make sure **Migration task startup configuration** is set to start **Automatically on create**, then click on **Create task**.

    ![Create task](/images/3/2/4/0005.png?width=80pc)

1. At this point, the task should start running and replicating data from the `**dms_sample**` database running on your source to the Amazon Aurora RDS (PostgreSQL) instance. Note the DMS task will take a moment to create (**Status=creating**), then it will transition into **Status=Ready**, followed by **Status=Starting**, and then **Status=Running**. You can use the circular arrow refresh button to update the status for the task.

    ![Create task](/images/3/2/4/0006.png?width=80pc)