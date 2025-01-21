---
title: "Task Logs"
weight: 4
chapter: false
pre: "<b> 5.4. </b>"
---

AWS DMS integrated with **AWS CloudWatch Service** to log task information during the migration process. You have option to enable logging on each DMS task. Once it is enabled, logs are continuously published through cloudWatch logs.

1. To view DMS task logs, Go to the [**AWS DMS console**](https://console.aws.amazon.com/dms/v2/home#/dashboard) and click on **Replication Tasks** in the left side column. Click on the task from the list in right side. Once you are on **DMS task** page, look for button **View logs** on top right corner. You may also open task logs from **Overview details** tab on the same page.

    ![](/images/5/4/0001.png?width=80pc)

1. Once you click on **View logs**, it will open a new window under CloudWatch service. By default, you will see latest logs on the screen. On the bottom of the page, you will have a resume button. Once you click that, logs will auto scroll when new logs are generated.

    ![](/images/5/4/0002.png?width=80pc)

Sometimes you may require to filter the logs to search for specific message in the log. You can do it by using filtering pattern under the **Log events**.

{{% notice note %}}
It is recommended to always enable DMS task logging at the time of creation. You would require additional permissions on AWS CloudWatch service to view the DMS tasks.
{{% /notice %}}