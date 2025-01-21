---
title: "Oracle source"
weight: 1
chapter: false
pre: "<b> 2.1. </b>"
---

Now that you have completed setting up the Getting Started, you are ready to migrate a sample data base.

This step-by-step guide demonstrates how you can use **AWS Database Migration Service (DMS)** to migrate data from an Oracle database which in this case is running on an **Amazon RDS** but it is the same process as Oracle running on prem or anywhere else. Additionally, you will configure AWS DMS to capture data changes (CDC) on the source database and replicate them on the target database.

The environment for this lab consists of:

- An EC2 instance that hosts the tools used in this lab such as Oracle SQL Developer.

- An Amazon RDS Oracle instance used to host the source Oracle database.

- A DMS target

![Infra Architecture](/images/2/1/0001.png?width=80pc)