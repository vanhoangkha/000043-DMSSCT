+++
title = "Data Migration"
date = 2020
weight = 2
chapter = false
pre = "<b>2.2. </b>"
+++

**Data Migration**

{{% notice note %}}
Please note that you need to complete the steps described in [**Schema Conversion**](../1-conversion/) section as a pre-requisite for this part.
{{% /notice %}}

This section will demonstrate how you can use the AWS Database Migration Service to migrate data from an Oracle database to an Amazon Aurora (PostgreSQL) instance. Additionally, you will use AWS DMS to continually replicate database changes from the source database to the target database. We do this in two steps:

First, you perform a full load migration of source oracle database to target Aurora PostgreSQL database using AWS DMS.

Next, you capture data changes (CDC) from the Oracle database, and replicate them automatically to Aurora PostgreSQL instance using AWS DMS.

AWS DMS doesn’t migrate your secondary indexes, sequences, default values, stored procedures, triggers, synonyms, views, and other schema objects that aren’t specifically related to data migration. To migrate these objects to your Aurora (PostgreSQL) target, we used the AWS Schema Conversion Tool in the previous section.

![Diagram](/images/2/OracleDms00.png?width=40pc)

In this exercise, you perform the following tasks:

#### Contents:
1. [Connect To The Source Oracle Database](1-connect-source-db/)
2. [Configure the Source Database](2-config-source-db/)
3. [Configure the Target Database](3-config-target-db/)
4. [Create a DMS Replication Instance](4-dms-replication/)
5. [Create DMS Source and Target Endpoints](5-endpoints/)
6. [Create a DMS Migration Task](6-migration-task/)
7. [Inspect the Content of Target Database](7-inspect-content/)
8. [Replicate Data Changes](8-replicate-changes/)
