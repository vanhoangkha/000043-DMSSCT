+++
title = "DMS Migration Task"
date = 2020
weight = 6
chapter = false
pre = "<b>2.2.6. </b>"
+++

**Contents**
- [Create a DMS Migration Task](#create-a-dms-migration-task)

---

#### Create a DMS Migration Task

AWS DMS uses **Database Migration Task** to migrate the data from the source to the target database. For this migration, you are going to create two Database Migration Tasks: one for migrating the existing data, and another for capturing data changes on the source database and replicating the changes to the target database.

1. Click on **Database migration tasks** on the left-hand menu, then click on the **Create task** button on the top right corner.

![Migration Task](/images/2/40.png?width=90pc)

2. Create a data migration task with the following values for migrating the `dms_sample` database.

|              Parameter             |         Value         |
|:----------------------------------:|:---------------------:|
| Task identifier                    | `oracle-migration-task` |
| Replication instance               | dmsreplication        |
| Source database endpoint           | oracle-source         |
| Target database endpoint           | aurora-target         |
| Migration type                     | Migrate existing data |
| Target table preparation mode      | Do nothing            |
| Include LOB columns in replication | Limited LOB mode      |
| Max LOB size (KB)                  | 32                    |
| Enable validation                  | Unchecked             |
| Enable CloudWatch logs             | Checked               |

3. Expand the **Table mappings** section, and select **Wizard** for the editing mode.
4. Click on **Add new selection rule** button and enter the following values in the form:

|  Parameter |    Value   |
|:----------:|:----------:|
| Schema     | DMS_SAMPLE |
| Table name | %          |
| Action     | Include    |

{{% notice note %}}
If the Create Task screen does not recognize any schemas, make sure to go back to the endpoints screen and click on your endpoint. Scroll to the bottom of the page and click on **Refresh Button (⟳)** in the **Schemas** section. If your schemas still do not show up on the Create Task screen, click on the Guided tab and manually select `DMS_SAMPLE` schema and all tables.
{{% /notice %}}

5. Next, expand the **Transformation rules** section, and click on **Add new transformation rule** using the following values:
   - **Rule 1:**
|  Parameter  |      Value     |
|:-----------:|:--------------:|
| Target      | Schema         |
| Schema Name | DMS_SAMPLE     |
| Action      | Make lowercase |

   - **Rule 2:**
|  Parameter  |      Value     |
|:-----------:|:--------------:|
| Target      | Table          |
| Schema Name | DMS_SAMPLE     |
| Table Name  | %              |
| Action      | Make lowercase |

   - **Rule 3:**
|  Parameter  |      Value     |
|:-----------:|:--------------:|
| Target      | Column         |
| Schema Name | DMS_SAMPLE     |
| Table Name  | %              |
| Column Name | %              |
| Action      | Make lowercase |

![Migration Task](/images/2/41.png?width=90pc)

6. After entering the values, make sure **Migration task startup configuration** is set to start **Automatically on create**, then click on **Create task**.
7. At this point, the task should start running and replicating data from the `DMS_SAMPLE` Oracle database to the Amazon Aurora RDS (PostgreSQL) instance.

![Migration Task](/images/2/42.png?width=90pc)

8. As the rows are being transferred, you can monitor the task progress:
   1. Click on your task (oracle-migration-task) and scroll to the Table statistics section to view the table statistics to see how many rows have been moved.
   2. If there is an error, the status color changes from green to red. Click on View logs link for the logs to debug.
