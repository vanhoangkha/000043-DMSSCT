+++
title = "Configure the Target DB"
date = 2020
weight = 3
chapter = false
pre = "<b>2.2.3. </b>"
+++

**Contents**
- [Configure the Target Database](#configure-the-target-database)

---

#### Configure the Target Database

{{% notice info %}}
During the full load process, AWS DMS does not load tables in any particular order, so it might load the child table data before parent table data. As a result, foreign key constraints might be violated if they are enabled. Also, if triggers are present on the target database, they might change data loaded by AWS DMS in unexpected ways. To overcome this, we drop the constraints on the target database.
{{% /notice %}}

1. Open **pgAdmin 4** from the **Taskbar** on the **EC2 server**.

![Target Database](/images/2/31.png?width=90pc)

2. You may be prompted to set a **Master Password**. Enter `pgadmin`, then click, **OK**.

![Target Database](/images/2/32.png?width=90pc)

3. Click on the **Add New Server** icon, and enter the following values. Then, press **Save**.

|            Parameter            |                Value               |
|:-------------------------------:|:----------------------------------:|
| General -> Name                 | Target Aurora RDS (PostgreSQL)     |
| Connection -> Host Name/Address | < TargetAuroraPostgreSQLEndpoint > |
| Connection -> Port              | 5432                               |
| Connection -> Username          | dbmaster                           |
| Connection -> Password          | dbmaster123                        |
| Connection -> Save Password     | Check                              |

![Target Database](/images/2/33a.png?width=90pc)
![Target Database](/images/2/33.png?width=90pc)

4. Right-click on **AuroraDB database** from left-hand menu, and then select **Query Tool**.

![Target Database](/images/2/34.png?width=90pc)

5. In this step you are going to drop the foreign key constraint from the target database:

{{%attachments title="Drop Key Constraint File" pattern=".*(sql)"/%}}

   1. Open [**DropConstraintsPostgreSQL.sql**](https://dms-immersionday.workshop.aws/code/DropConstraintsPostgreSQL.sql) in your favorite text editor.
   2. Copy the content of the file to the **Query Editor** in **pgAdmin 4**.
   3. **Execute** the script.

![Target Database](/images/2/35.png?width=90pc)
