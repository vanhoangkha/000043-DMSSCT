---
title: "Troubleshooting Steps"
weight: 2
chapter: false
pre: "<b> 6.1.2. </b>"
---

Regardless of cause of failures, troubleshooting should follow below steps:

1. Refresh the **DMS task** page & verify DMS task status. If task is in **Failed** status, that means, DMS has stopped processing of task and it is stopped with failures.

    ![](/images/6/1/2/0000.png?width=80pc)

2. When task is in **Failed** state, verify if there is any message sent by the DMS task. You can view this under Last failure message on the **DMS task** page. In this scenario, it is very clear that task is failed due to out of memory issue.

3. Now, to troubleshoot out of memory issue, navigate to **DMS replication instance** page and switch to **CloudWatch metrics** tab. Review metrics specific to **Memory & Swap Usage**.

    In above screenshots, we can clearly notice drop in freeable memory & increase in swap usage around the time of task failures. CloudWatch metrics are averaged to 60 seconds. Hence you may not see memory going down completely to zero.

    ![](/images/6/1/2/0001.png?width=80pc)
    ![](/images/6/1/2/0002.png?width=80pc)
    ![](/images/6/1/2/0003.png?width=80pc)

4. When a DMS task stop cleanly, you may notice below message in DMS task logs:

    ```
    2021-11-10T23:58:14 [AT_GLOBAL       ]I:  Closing log file at Wed Nov 10 23:58:14 2021  (at_logger.c:2548)
    ```

    However, when task fails due to memory pressure, DMS doesn’t get time to cleanly stop the task and write logs. Hence if you refer to DMS task logs in these scenarios, you might not find any useful information for troubleshooting.

5. In case of memory pressure on **DMS replication instance**, you may also want to verify how many DMS tasks are running on specific instance. To verify this, navigate to **DMS replication instances** page where on top right you will notice section called Associated migration tasks. To get a list of all DMS task running on that instance, switch to Migration tasks tab. At this section, you can review list of task with their status.
