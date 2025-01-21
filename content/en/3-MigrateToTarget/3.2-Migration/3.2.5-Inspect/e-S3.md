---
title: "Amazon S3 Target"
weight: 5
chapter: false
pre: "<b> e. </b>"
---

1. Go to your target S3 bucket and click on dmstargetfolder. Click on **_dms_sample_dbo_** or **_dms_sample_** subfolder. Here you will find all the tables that were migrated from the source database.

    ![](/images/3/2/5/e/0001.png?width=80pc)

1. Go to the **_sport_type_** folder. Click the checkbox on the left of the .CSV object and download the file.

    ![](/images/3/2/5/e/0002.png?width=80pc)

1. Open the CSV file on your computer and note that baseball and football are the only two sports that are currently listed in this table.

    ![](/images/3/2/5/e/0003.png?width=80pc)

In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target S3 bucket.