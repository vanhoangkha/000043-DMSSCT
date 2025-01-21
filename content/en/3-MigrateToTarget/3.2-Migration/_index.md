---
title: "Data Migration"
weight: 2
chapter: false
pre: "<b> 3.2. </b>"
---

This section will demonstrate how you can use the AWS Database Migration Service to migrate data from the source database to the target Amazon Aurora (MySQL). Additionally, you will use AWS DMS to continually replicate database changes from the source database to the target database.

AWS DMS doesn't migrate your secondary indexes, sequences, default values, stored procedures, triggers, synonyms, views, and other schema objects that aren't specifically related to data migration. To migrate these objects to your Aurora MySQL target, we used the AWS Schema Conversion Tool in the previous section.

![Migrate MS SQL to Aurora MySQL](/images/3/2/0001.png?width=50pc)