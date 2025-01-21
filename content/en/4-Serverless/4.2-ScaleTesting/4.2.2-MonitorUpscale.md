---
title: "Monitor CloudWatch Dashboard for upscale event"
weight: 2
chapter: false
pre: "<b> 4.2.2. </b>"
---

As the DML load is generated on the source database, monitor the AWS DMS console and CloudWatch dashboard for DMS capacity usage. Once the load exceeds **80%**, You will see Scale-up event being triggered.

### Capacity Utilization Graph

1. To access CloudWatch metrics for DMS Serverless Replication, navigate to the AWS DMS console, select **"Serverless replications"** in the left sidebar, choose your serverless replication, and look for the **Capacity Utilization** graph under the **Monitoring** tab.

    You can look into more detail by clicking on **Maximizing Capacity Utilization**.

    ![](/images/4/2/2/0001.png?width=80pc)

2. Once the load exceeds **80%**, you can check the logs after 10 minutes to confirm that the event has triggered the scaling up of the DCU.

This concludes our DMS Serverless Scale-up lab. Please proceed to the next lab to learn how to monitor the scaling-down event.