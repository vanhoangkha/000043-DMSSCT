+++
title = "Replicate Data Changes"
date = 2020
weight = 8
chapter = false
pre = "<b>2.2.8. </b>"
+++

**Contents**
- [Replicate Data Changes](#replicate-data-changes)

---

#### Replicate Data Changes

Now you are going to simulate a transaction to the source database by updating the sport_type table. The Database Migration Service will automatically detect and replicate these changes to the target database.

1. Create another **Data Migration Task** with the following values for capturing data changes to the source Oracle database, and replicating the changes to the target Aurora RDS instance.

|              Parameter              |              Value             |
|:-----------------------------------:|:------------------------------:|
| Task identifier                     | oracle-replication-task        |
| Replication instance                | oracle-replication             |
| Source database endpoint            | oracle-source                  |
| Target database endpoint            | aurora-target                  |
| Migration type                      | Replicate data changes only    |
| CDC stop mode                       | Don’t use custom CDC stop mode |
| Target table preparation mode       | Do nothing                     |
| Stop task after full load completes | Don’t stop                     |
| Include LOB columns in replication  | Limited LOB mode               |
| Max LOB size (KB)                   | 32                             |
| Enable validation                   | Unchecked                      |
| Enable CloudWatch logs              | Checked                        |

2. Expand the **Table mappings** section, and select **Wizard** for the editing mode.
3. Add the same **Selection**, and **Transformation rules** as specified in [**Steps 4,5 - DMS Migration Task**](../6-migration-task/).

![Replicate](/images/2/44.png?width=90pc)

4. After entering the values, make sure **Migration task startup configuration** is set to start **Automatically on create**, then click on **Create task**.
5. At this point, the new migration task is ready to replicate ongoing data changes from the source Oracle RDS to the Amazon Aurora RDS (PostgreSQL) database.

![Replicate](/images/2/45.png?width=90pc)
Now you are going to simulate a transaction to the source database by updating the `sport_type` table. The Database Migration Service will automatically detect and replicate these changes to the target database.

6. Use **Oracle SQL Developer** connect to the source Oracle RDS.
7. Open a **New Query** window and **execute** the following statement to insert 5 new sports into the `sport_type` table:

```sql
INSERT ALL
INTO dms_sample.sport_type (name,description) VALUES ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick')
INTO dms_sample.sport_type (name,description) VALUES ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop')
INTO dms_sample.sport_type (name,description) VALUES ('soccer','A sport played with a spherical ball between two teams of eleven players')
INTO dms_sample.sport_type (name,description) VALUES ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court')
INTO dms_sample.sport_type (name,description) VALUES ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end')
SELECT * FROM dual; 
COMMIT;
SELECT * FROM dms_sample.sport_type; 
```

![Replicate](/images/2/46.png?width=90pc)

8. Repeat [**steps 1,2 - Inspect Target Database**](../7-inspect-content/) as described earlier to inspect the content of `sport_type` table in the target database.

![Replicate](/images/2/47.png?width=90pc)

{{% notice note %}}
The new records for that you added for basketball, cricket, hockey, soccer, volleyball to the `sports_type` table in the source database have been replicated to your `dms_sample` database. You can further investigate the number of inserts, deletes, updates, and DDLs by viewing the **Table statistics** of your **Database migration tasks** in AWS console.
{{% /notice %}}

{{% notice info %}}
The AWS DMS task keeps the target Aurora PostgreSQL database up to date with source database changes. AWS DMS keeps all the tables in the task up to date until it’s time to implement the application migration. The latency is close to zero, when the target has caught up to the source.
{{% /notice %}}
