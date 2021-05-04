+++
title = "DMS Replication Instance"
date = 2020
weight = 4
chapter = false
pre = "<b>2.2.4. </b>"
+++

**Contents**
- [Create a DMS Replication Instance](#create-a-dms-replication-instance)

---

#### Create a DMS Replication Instance

The following illustration shows a high-level view of the migration process.

![Replication Instance](/images/2/OracleDms12.png?width=40pc)

{{% notice info %}}
An AWS DMS replication instance performs the actual data migration between source and target. The replication instance also caches the transaction logs during the migration. The amount of CPU and memory capacity of a replication instance influences the overall time that is required for the migration.
{{% /notice %}}

1. Navigate to the **Database Migration Service (DMS) console**.
2. On the left-hand menu click on **Replication Instances**. This will launch the Replication instance screen.
3. Click on the **Create replication instance** button on the top right side.

![Replication Instance](/images/2/36a.png?width=90pc)

4. Enter the following information for the Replication Instance. Then, click on the **Create** button.
|             Parameter             |                   Value                   |
|:---------------------------------:|:-----------------------------------------:|
| Name                              | `DMSReplication`                            |
| Description                       | `Replication server for Database Migration` |
| Instance Class                    | dms.c5.xlarge                             |
| Engine version                    | Leave the default value                   |
| Allocated storage (GB)            | `50`                                        |
| VPC                               | **< VPC ID from Environment Setup Step >**    |
| Multi-AZ                          | No                                        |
| Publicly accessible               | No                                        |
| Advanced -> VPC Security Group(s) | default                                   |

![Replication Instance](/images/2/36b.png?width=90pc)

{{% notice note %}}
Creating replication instance will take **several minutes**. While waiting for the replication instance to be created, you can specify the source and target database endpoints in the next steps. However, test connectivity only after the replication instance has been created, because the replication instance is used in the connection.
{{% /notice %}}

![Replication Instance](/images/2/36c.png?width=90pc)
