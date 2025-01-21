---
title: "Database Schema Conversion & Migration"
weight: 1
chapter: false
---

# Database Schema Conversion & Migration

### Schema Conversion

Converting the database schema and code objects is usually the most time-consuming operation in a heterogeneous database migration. By converting the schema properly, you can achieve a major milestone of the migration. The [AWS Schema Conversion Tool (SCT)](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Installing.html)  is an easy to use application that you can install on a local computer or an Amazon EC2 instance. At ReInvent 2023, AWS also added an in console experience in the Convert and Migrate section of the DMS service. Overtime we'll be switching to the in console experience.

SCT/Convert & Migrate in console helps simplify heterogeneous database migrations by examining your source database schema and automatically converting the majority of the database code objects, including views, stored procedures, and functions, to a format compatible with your new target database. Any objects that SCT cannot converted automatically is marked with detailed information that you can use to convert it manually.

![Schema Conversion](/images/0-home/0001.png?width=50pc)

### Data Migration

After you have completed the schema conversion, you'll need to move the data itself. In case of production databases, you may not be able to afford very little downtime during the migration. Moreover, you may want to keep the transactions from source and target database in sync until you switch your application to the new target.

The AWS Database Migration Service helps you migrate the data from the source database to the target database easily and securely. AWS DMS supports data migration to and from most widely used commercial and open-source databases. The source database can be located in your on-premises environment, running on an Amazon EC2 instance, or it can be an Amazon RDS database. The target can be a database on Amazon EC2 or Amazon RDS. The target can also be non-relational like S3, Stream like Kafka/Kinesis, DocumentDB or DynamoDB etc. Additionally, the source database remains fully operational during the migration, minimizing downtime to applications that rely on the database.

![Migration](/images/0-home/0002.png?width=50pc)