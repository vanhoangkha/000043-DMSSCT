---
title: "Event Notifications"
weight: 2
chapter: false
pre: "<b> 5.2. </b>"
---

AWS DMS generates various events at DMS instance & task level which you can subscribe. AWS DMS uses Amazon Simple Notification Service (Amazon SNS) to provide notifications when an AWS DMS event occurs.

1. To create a **DMS event notification**, first you have to create **event subscriptions**. To create DMS event subscriptions, Go to the [**AWS DMS console**](https://console.aws.amazon.com/dms/v2/home#dashboard) and click on **Event Subscriptions** in the left side column. Click on **Create event subscription** button.

    ![](/images/5/2/0001.png?width=80pc)

1. On **create event subscription** page, provide name of subscription. Then choose **target** for notification. For this lab we will use email topic. Enter topic name and email address. Please make sure that you/your team have access to email address provided here. AWS DMS/SNS will push notifications to given email. Optionally, if you already have a topic created, you can choose option ****Existing topics**** and select the topic from the list.

    ![](/images/5/2/0002.png?width=80pc)

1. For event source, you can either select **replication-instance** or **replication-task**. For this lab, we will select **replication-task**. From **Event categories** we will choose **All event categories** and from **replication instances** we will choose **All taks**. Then submit event creation by clicking on button **Create event subscription**.

    ![](/images/5/2/0003.png?width=80pc)

1. Once event subscription is created, check the status and verify that subscription is **Active**.

    ![](/images/5/2/0004.png?width=80pc)

1. Once event subscription is created, navigate to [**AWS SNS subscriptions console**](https://console.aws.amazon.com/sns/v3/home#/subscriptions). Now select the subscription created by AWS DMS by verifying **topic** column. **AWS Simple Notification Service (SNS)** will send a email with confirmation link to the email address you provided in step 2. Status of subscription will stay in **pending confirmation**.

1. At this point, you will require to access email sent by AWS SNS and **Confirm subscription**.

    ![](/images/5/2/0005.png?width=80pc)

1. As soon as the confirmation is received, status of AWS SNS subscription will change to **confirmed**. Now you are all set to receive email notifications for AWS DMS events.

1. To test event notifications, lets go ahead and perform some action on DMS replication instance. For example, create new replication instance/ reboot instance/ change replication instance class etc. To verify DMS events created for these activities, on DMS console, select **Events** from left side column. As in this lab, we have created event notifications at **replication-instance** level, you should receive email for all events for type **replication-instance**.

Here is an example of a **DMS event notification email**. If you are using personal email address but don’t see email coming to inbox, check if emails are sent to spam folder. When you are using company email address, make sure that firewall is not blocking these notifications.

You may repeat above steps to create another event subscription for getting notifications on **DMS task events**.