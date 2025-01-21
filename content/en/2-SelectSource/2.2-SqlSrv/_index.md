---
title: "SQL Server source"
weight: 2
chapter: false
pre: "<b> 2.2. </b>"
---

Now that you have completed setting up the Getting Started, you are ready to migrate a sample data base.

This step-by-step guide demonstrates how you can use AWS Database Migration Service (DMS) to migrate data to SQL Server database running on an Amazon EC2. Additionally, you will configure AWS DMS to capture data changes (CDC) on the source database and replicate them on the target database.

The environment for this lab consists of:

- An EC2 instance that hosts the tools used in this lab such as **SQL Server Management Studio (SSMS)** or **Oracle SQL Developer**.

- A SQL Server database running on EC2 instance you'll RDP into

- A DMS target

In this exercise you perform the following tasks:

- Connect to the EC2 Instance

- Open SQL Server Management Studio

- Configure the Source Database

- Summary

![Infrastructure](/images/3/1/0001.png?width=80pc)