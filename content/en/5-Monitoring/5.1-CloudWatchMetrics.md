---
title: "CloudWatch Metrics"
weight: 1
chapter: false
pre: "<b> 5.1. </b>"
---

AWS DMS provides you ability to monitor performance of your **DMS migration** via **CloudWatch metrics**. There are different metrics available at **replication instance & task level**.

{{% notice info %}}
CloudWatch metrics for DMS Replication instance can be helpful in identifying resource consumption on DMS replication instance. **CPU utilization, Freeable memory, Free Storage Space,** etc. are few key metrics you may want to put monitoring on. CloudWatch metrics for DMS tasks can be helpful in identifying performance. DMS provides different metrics for Full Load, CDC, Validation & Impact on replication instance. Please refer AWS DMS Monitoring documentation  for details on each metric.
{{% /notice %}}

To view CloudWatch metrics for DMS replication instance, Go to the [**AWS DMS console**](https://console.aws.amazon.com/dms/v2/home#dashboard) and click on **Replication instances** in the left side column. Select the replication instance and then navigate to **CloudWatch metrics** tab.

To view CloudWatch metrics for DMS tasks, Go to the [**AWS DMS console**](https://console.aws.amazon.com/dms/v2/home#dashboard) and click on **Database Migration Task** in the left side column. Click on your DMS task from the list of tasks.

Once you are on **DMS task** page, navigate to **Monitoring** tab.

![](/images/5/1/0001.png?width=90pc)

Next, we will learn about AWS DMS events and how to setup notifications for those events.