+++
title = "Inspect Target Database"
date = 2020
weight = 7
chapter = false
pre = "<b>2.2.7. </b>"
+++

**Contents**
- [Inspect the Content of Target Database](#inspect-the-content-of-target-database)

---

#### Inspect the Content of Target Database

{{% notice tip %}}
If you disconnected from the EC2 instance, follow the instruction in [**Connect to the EC2 Instance**](../../1-conversion/1-connect-ec2/) section from the previous part to RDP to the instance.
{{% /notice %}}

1. Open **pgAdmin4** from within the **EC2 server**, and then connect to the **Target Aurora RDS (PostgreSQL) database** connection that you created earlier.
2. Inspect the migrated data, by querying one of the tables in the target database. For example, the following query should return a table with two rows:

```sql
SELECT *
FROM dms_sample.sport_type;
```

![Inspect](/images/2/43a.png?width=90pc)

{{% notice note %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
{{% /notice %}}

3. Now, use the following script to enable the foreign key constraints that we dropped earlier:

{{%attachments title="Add Constrant File" pattern=".*(sql)"/%}}

   1. Open [**AddConstraintsPostgreSQL.sql**](https://dms-immersionday.workshop.aws/code/AddConstraintsPostgreSQL.sql) in your favorite text editor.
   2. Copy the content of the file to the **Query Editor** in **pgAdmin 4**.
   3. **Execute** the script.

![Inspect](/images/2/43b.png?width=90pc)
