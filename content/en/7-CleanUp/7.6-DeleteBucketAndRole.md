---
title: "Delete S3 Bucket and IAM Roles"
weight: 6
chapter: false
pre: "<b> 7.6. </b>"
---

{{% notice info %}}
This section should be completed only if you did the Amazon S3 target lab. You can STOP reading now if you completed any of the other labs in the Database Migration Workshop because you have completed removing the resources for those labs at this stage.
{{% /notice %}}

1. Navigate to Amazon S3 console  and go to the bucket that you created as part of this lab.

1. Click on the checkbox left to the `**dmstargetfolder**`. Click on the Actions button, and select **Empty**.

1. Get back to the bucket list and click on the checkbox next to the S3 bucket you created earlier. Click on **Delete**.

1. Type in the name of your bucket, then click on **Delete**.

    ![](/images/7/5/0001.png?width=85pc)

1. The lab uses the `**DMS-VPC-ROLE**` which is needed for DMS to work in general. We would recommend leaving this role in place as there is no cost for IAM Roles and DMS will need this role if it doesn't exist. If you have any questions or concerns please reach out to your AWS contacts or support.

1. Now, you need to delete the IAM policy that you created earlier. Note: you could leave it as there's no cost for an IAM policy but the bucket used has been deleted. It is up to you. If you want to keep it you are done with this section. If you want to delete it, go to the IAM console , and then go to Policies from the navigation pane. In the search bar, type in `**DMS-LAB-S3-Access-Policy**`.

1. Click on the checkbox next to the `**DMS-LAB-S3-Access-Policy**`. Then, click on **Policy actions** and select **Delete**.

1. Select **Delete** on the new prompt.

You have completed removing the AWS resources that you created earlier in your account.