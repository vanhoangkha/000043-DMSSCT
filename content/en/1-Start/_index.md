---
title: "Getting Started"
weight: 1
chapter: false
pre: "<b> 1. </b>"
---

If you're using your own AWS account, or you are advised by AWS staff to configure the workshop environment, you need to setup some resources on AWS that we will use to perfrom the migration. This section describes the steps to provision the AWS resources that are required for this database migration walkthrough.

We use **AWS CloudFormation** to simplify the provisioning of the infrastructure, so we can concentrate on tasks related to data migration.

The CFN Template creates a basic network topology that includes **Amazon Virtual Private Cloud (Amazon VPC)**  with 3 public subnets to deploy the **AWS Database Migration Service (AWS DMS)** replicaiton instance, as well as **Amazon Relational Database Service (Amazon RDS)** instance for the target database. Additionally, it provisions an **Amazon Elastic Compute Cloud (EC2)** instance to host the tools that we use in this migration, including the **AWS Schema Conversion Tool (AWS SCT)**. Likewise, in the Microsoft SQL Server migration workshop, we use this EC2 instance to simulate our source database.