---
title: "Migrate Data using DMS Serverless"
weight: 1
chapter: false
pre: "<b> 4.1. </b>"
---

This step-by-step guide demonstrates how you can use **AWS Database Migration Service (DMS)** to migrate data from SQL Server or Oracle database running on an **Amazon EC2**. Additionally, you will configure **AWS DMS** to capture data changes (CDC) on the source database and replicate them on the target database.

### Prerequisites

1. Setting up your AWS Console, Download EC2 Key Pair and Retrieve Environment parameters. ([Getting Started](../../1-Start/))

1. Configure your source database by selecting one of the following links:

    - [SQL Server as source](../../2-SelectSource/2.2-SqlSrv/)

    - [Oracle as source](../../2-SelectSource/2.1-Oracle/)

1. Create Source and Target endpoint creation:

    - [Aurora MySQL as Target](../../3-SelectTarget/3.1-AuroraMySQL/3.1.2-Migration/3.1.2.3-CreateEndpoint)

    - Aurora PostgreSQL as Target

Once you have configured your source database and created source and target endpoints. You can proceed to create a Serverless Replication task.