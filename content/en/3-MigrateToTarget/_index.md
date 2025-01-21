---
title: "Select your DMS Target"
weight: 3
chapter: false
pre: "<b> 3. </b>"
---

Now that you have completed setting up the Getting Started and picking your source database, you are ready to migrate a sample data base.

This step-by-step guide demonstrates how you can use the **AWS Schema Conversion Tool (AWS SCT)** and **AWS Database Migration Service (DMS)** to convert schema and migrate data to **Amazon Aurora (MySQL/PostgreSQL)**. Additionally, you will use AWS DMS to continually replicate database changes from the source database to the target database.

The environment for this lab consists of:

- A data source like SQL Server or Oracle.

- An **EC2 instance** with **Schema Conversion Tool** and other database gui tools, as the source database.

- An **Amazon Aurora/RDS** instance used as the target database.

- An **S3 Bucket** if you choose S3 as your target

![Infrastructure](/images/3/0001.png?width=80pc)