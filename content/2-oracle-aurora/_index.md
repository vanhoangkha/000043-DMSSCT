+++
title = "Oracle to Amazon Aurora (PostgreSQL)"
date = 2020
weight = 2
chapter = false
pre = "<b>2. </b>"
+++

**Oracle to Amazon Aurora (PostgreSQL)**

Now that you have completed setting up the [**workshop enviornment**](../1-prerequisites/), you are ready to migrate a sample data base.

This step-by-step guide demonstrates how you can use [**AWS Database Migration Service (DMS)**](https://aws.amazon.com/dms/) and [**AWS Schema Conversion Tool (AWS SCT)**](https://aws.amazon.com/dms/schema-conversion-tool/?nc=sn&loc=2) to migrate data from an Oracle database to [**Amazon Aurora (PostgreSQL)**](https://aws.amazon.com/rds/aurora/). Additionally, you will use AWS DMS to continually replicate database changes from the source database to the target database.

The environment for this lab consists of:
- An Amazon EC2 instance used to run the AWS Schema Conversion Tool (SCT) as well as other applications needed to complete the lab.
- An Amazon RDS instance used to host the source Oracle database.
- An Amazon RDS Aurora (PostgreSQL) instance used as the target database.

![Diagram](/images/2/OracleDmsDiagram.png?width=40pc)

{{% notice note %}}
Before proceeding further, make sure you have completed the instructions in the [**Pre-requisites**](../1-prerequisites/) section that preceeded this chapter.
{{% /notice %}}


#### Contents
1. [Schema Conversion](1-conversion/)
2. [Data Migration](2-migration/)
3. [Summary](3-summary/)