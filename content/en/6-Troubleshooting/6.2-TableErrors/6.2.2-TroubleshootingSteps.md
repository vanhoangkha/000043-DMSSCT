---
title: "Troubleshooting Steps"
weight: 2
chapter: false
pre: "<b> 6.2.2. </b>"
---

1. When you investigate any DMS migration issues, start your investigation by reviewing current status of task. To review task status, navigate to the [**AWS DMS console**](https://console.aws.amazon.com/dms/v2/) and select the DMS task from the list. You will notice status of each task in the list.

    ![](/images/6/2/2/0002.png?width=80pc)

2. DMS task status **Running with errors** or **Error** means one or more tables in the task is moved to error state. When DMS mark any table in error state, by default, that table get suspended from the migration and DMS stop migration for that table but continue migration for other tables in scope. Whenever table error occur, DMS log warnings and related messages in DMS task logs. Hence to troubleshoot the issue further, open DMS task logs.

    ![](/images/6/2/2/0001.png?width=80pc)

3. By default, you will see latest messages in DMS task logs and if you have enabled debug logging on the task, it may become difficult to find exact messages related to table error. In that case you may want to use filtering on DMS task log to filter out related messages. Once you filter for the specific messages for tables in error, you will notice log messages something similar to below log snipped:

    ![](/images/6/2/2/0003.png?width=80pc)

{{% notice note %}}
There can be several reasons where DMS suspend a table from processing. In many cases, you might not find enough information from DMS task logs to troubleshoot the issue further. In those cases, best next step would be to enable debug logging on the task and reload  the suspended table. Once DMS reprocess the table and put that again in suspended mode, review new DMS task logs which will have more detailed logs.
{{% /notice %}}

    In our scenario, from DMS task logs you may notice (a) DMS throwing error when trying to load data into **"DMS_SAMPLE"."SPORTING_EVENT_TICKET"**. (b) DMS suspended table due to failure in loading the data to target table. However, DMS logs were not conclusive to identify exact cause of failure and why data loading on target table failed. However, please do note the timestamp when the table was marked as suspended.

4. Now, to troubleshoot the issue further and identify cause of failure in data loading on target table, we will investigate target database logs. Navigate to the [RDS console](https://console.aws.amazon.com/rds/). From left side column, select **Databases** and then click on the target database. In this scenario we are using **Aurora PostgreSQL** database as target, hence we will select writer instance of Aurora cluster. Navigate to **Logs & events** tab.


    You may notice many log files generated under the **Logs** section of target database. Please review timestamp we noted from previous step and select the right database log file around that time. In same cases you might require to review more than one log file to identify events in database logs. To open Aurora PostgreSQL database log, select the log file from the list and click on the **View** button.


    Once you have database logs open, filter events in log related to table in error state. You may notice events related to load failure due to **duplicate key violation** as we can see in below log snipped:

    From the database logs, now it is very clear why the DMS task error out loading the table. When we first created the DMS task, it already loaded data from source to target database. To create this scenario, when we restarted the task, DMS tried to load same data from source to target again. However, target table have primary key which prevented duplicate records to get loaded and hence rejected the records which eventually failed the **copy** commanded used by DMS for loading data into Aurora PostgreSQL database. Due to failure of this **copy** command, DMS suspended loading that table and turned task status as **Error**.