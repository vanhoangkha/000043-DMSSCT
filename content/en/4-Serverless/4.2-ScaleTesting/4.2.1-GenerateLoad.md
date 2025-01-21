---
title: "Generate Load on the Source Database"
weight: 1
chapter: false
pre: "<b> 4.2.1. </b>"
---

### Stop and Modify DMS Serverless Task

Before generating load on the Source database, first **stop the currently running DMS serverless data migration task** in order for us to change some settings of DMS Serverless task

1. **Stop the running task:**

    Click on **Actions**, and then select **Stop**.

    ![](/images/4/2/1/0001.png?width=80pc)

2. **Modify the task settings:**

    Once the task status changes from "Stopping" to "Stopped", select the task again and click on the **Modify** button to change the memory, max DCU and CW Logs settings

    ![](/images/4/2/1/0002.png?width=80pc)

    2.1. **Update memory settings to handle increased load:**

    To ensure the replication task can manage the increased load, update the memory settings. Without these updates, you may encounter the **"Reading from source paused"** error.

    2.2. Switch to JSON View under Settings. Look for the `**ChangeProcessingTuning**` tag and change the following:

    - `MemoryKeepTime`: Set to **600** (fron 60).

    - `MemoryLimitTotal`: Set to **10240** (from 1024).

    ![](/images/4/2/1/0003.png?width=80pc)

{{% notice warning %}}
If you do not change these settings, the DMS task will throttle when `MemoryLimitTotal` is reached and you may not see scaling operation. These settings ensure that the task can handle increased load efficiently. Refer to Change processing tuning settings  for more information on these parameters
{{% /notice %}}

*   2.3. **Remove CloudWatch log tags:**

    Delete the "CloudWatchLogGroup" and "CloudWatchLogStream" tags.

    - Before:

    ![](/images/4/2/1/0004.png?width=80pc)

    - After:

    ![](/images/4/2/1/0005.png?width=80pc)

*   2.4. Increase Max DMS capacity units so that the task can scale up when load on source server increases:

    - Under **Compute Settings**, change the **Maximum DMS Capacity Units (DCU)** to **16**.

    ![](/images/4/2/1/0006.png?width=80pc)

3. **Save changes and resume the task:**

    - Resume the task once the changes are saved and status changes from **"Modifying"** to **"Stopped"** state.

    ![](/images/4/2/1/0007.png?width=80pc)
    
### Generate Load on Source database

1. Lets simulate a bustling social media site by creating 3 tables and a stored procedure to generate thousands of posts, users, and votes at random intervals, mimicking the unpredictable traffic of a live social media platform.

    _**Note:** expand only for the source in your scenario. You can skip other sources._

#### For SQL Server as Source:

2. **Run SQL load script:**

    - Open a new remote desktop session to your bastion host and connect to SQL Server source database using **SQL Server Management Studio (SSMS)**.

    ![](/images/4/2/1/0010.png?width=80pc)

    - Once connected, click on **New Query** in SSMS.

    - In the query window, copy and paste the contents of the provided [mssql_load_script.sql](/workloads/mssql_load_script.sql) and click **Execute**.

    ![](/images/4/2/1/0011.png?width=80pc)

    - This will create three tables: **Post**, **Users**, and **Votes**, along with the necessary data generation stored procedures.

3. **Simulate heavy load on the source database:**

    - Run the following code directly in the command prompt to start 10 parallel sessions:

    ```bash
    for /L %i in (1,1,10) do start cmd /k sqlcmd -S localhost -U <<Enter Username>> -P <<Enter Password>> -Q "USE dms_sample; EXEC usp_RandomQ 100000;"
    ```

    - This will open 10 simultaneous sessions, each generating load on your source SQL Server database.

    ![](/images/4/2/1/0012.png?width=80pc)

#### For Oracle as Source:

2. **Run SQL load script:**

    - Open a new remote desktop session to your bastion host and connect to your Oracle database using **SQL Developer**.

    - Click on the **SQL Worksheet icon** within **Oracle SQL Developer**, then connect to the **Source Oracle database.**

    ![](/images/4/2/1/0008.png?width=80pc)

    - In the query window, copy and paste the contents provided from [oracle_load_script.sql](/workloads/oracle_load_script.sql) and click **Execute**.

    - This will create three tables: **Post**, **Users**, and **Votes**, along with the necessary data generation stored procedures.

3. **Simulate heavy load on the source database:**

    - Run the following code directly in a new **SQL Worksheet** window to generate load on your source Oracle database:

    ```sql
    EXEC usp_RandomQ(100000);
    ```

    ![](/images/4/2/1/0009.png?width=80pc)

We have generated the load, and now we will monitor the CPU utilization as it **approaches the 80% threshold**, which will trigger a scaling event to increase the current DCUs **from 4 to 8**. This process may take approximately **20 to 30 minutes**. Please proceed to the next section to learn how to monitor the data migration task and observe the scaling event.
