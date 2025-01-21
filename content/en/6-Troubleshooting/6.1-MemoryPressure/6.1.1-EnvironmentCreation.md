---
title: "Environment Creation"
weight: 1
chapter: false
pre: "<b> 6.1.1. </b>"
---

As we mentioned earlier, memory pressure on DMS instance may happen when migration task put high load on the DMS instance and the allocated memory is not enough to handle the workload. Hence to recreate this scenario, we will put load via DMS task(s).

{{% notice info %}}
In this troubleshooting exercise, we are going to use resources (DMS task/RDS instances etc) created under [**_Oracle Source to Amazon Aurora (PostgreSQL) Target_**](../../3-SelectTarget/3.1-AuroraMySQL/) lab. However, if you are following any other lab with any other RDBMS source/target engine(s), feel free to continue using those resources.
{{% /notice %}}

1. Navigate to list of DMS task on AWS DMS console. Select the DMS full load migration task. From **Actions** dropdown menu, click on **Stop**.

    ![](/images/6/1/1/0001.png?width=80pc)

1. After the task status changes to **Stopped**, once again, open **Actions > Modify**.

    ![](/images/6/1/1/0002.png?width=80pc)

1. On the **Modify data migration task** page, scroll down to **Advanced task settings** section. Under **Full load tuning settings**, put **49** in text box for **Maximum number of tables to load in parallel** and **50000** in **Commit rate during full load** text box.

    ![](/images/6/1/1/0003.png?width=80pc)

1. Now scroll down to **Table mappings** section. Under **Selection Rules**, replace Schema name from **DMS_SAMPLE** to **%**. Now scroll down to bottom of the page and hit the **Save** button.

    ![](/images/6/1/1/0004.png?width=80pc)

1. Once task modification finish, go ahead and **RESTART** (not resume) the task.

    ![](/images/6/1/1/0005.png?width=80pc)
    ![](/images/6/1/1/0006.png?width=60pc)

1. Monitor DMS instance cloud watch metrics. When load on DMS instance memory increases, you may notice decrease in **Freeable Memory** and increase/fluctuations in **SwapUsage**. Also monitor DMS task status. After sometime, you will notice that DMS task status is changed to **Failed**.

    ![](/images/6/1/1/0007.png?width=80pc)

1. Navigate to failed DMS task, under **Overview details** tab, notice the **Last failure** message. If DMS task failed due to memory pressure on DMS instance, you will see the message **"Last Error Replication task out of memory. Stop Reason `FATAL_ERROR` Error Level `FATAL`."**

At this stage, we are able to successfully create the scenario where DMS task fails due to memory pressure on DMS instance!

{{% notice note %}}
If you notice task successfully completed even after adding more tables on task, you may add even more tables on the task. Alternatively you may also create separate task on same instance and run all tasks in parallel.
{{% /notice %}}