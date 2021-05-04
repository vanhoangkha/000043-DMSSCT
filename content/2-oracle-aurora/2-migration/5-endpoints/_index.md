+++
title = "Source & Target Endpoints"
date = 2020
weight = 5
chapter = false
pre = "<b>2.2.5. </b>"
+++

**Contents**
- [Create DMS Source and Target Endpoints](#create-dms-source-and-target-endpoints)

---

#### Create DMS Source and Target Endpoints

Now that you have a replication instance, you need to create source and target endpoints for the sample database.

1. Click on the **Endpoints** link on the left, and then click on **Create endpoint** on the top right corner.
![Endpoints](/images/2/37.png?width=90pc)

2. Enter the following information to create an endpoint for the source `dms_sample` database:
|            Parameter            |                  Value                 |
|:-------------------------------:|:--------------------------------------:|
| Endpoint Type                   | Source endpoint                        |
| Select RDS DB instance          | Check                                  |
| RDS Instance                    | **< StackName >-SourceOracleDB**           |
| Endpoint Identifier             | `oracle-source`                          |
| Source Engine                   | oracle                                 |
| Access to endpoint database     | Provide access information manually    |
| Server Name                     | **< SourceOracleEndpoint >**               |
| Port                            | `1521`                                   |
| SSL Mode                        | none                                   |
| User Name                       | `dbmaster`                               |
| Password                        | `dbmaster123`                            |
| SID/Service Name                | `ORACLEDB`                               |
| Test endpoint connection -> VPC | **< VPC ID from Environment Setup Step >** |
| Replication Instance            | oracle-replication                     |

![Endpoints](/images/2/38.png?width=90pc)

3. Once the information has been entered, click **Run Test**. When the status turns to **successful**, click **Create endpoint**.
4. Follow the same steps to create another endpoint for the **Target Aurora RDS Database** using the following values:
|            Parameter            |                  Value                 |
|:-------------------------------:|:--------------------------------------:|
| Endpoint Type                   | Target endpoint                        |
| Select RDS DB instance          | **< StackName >-AuroraPostgreSQLInstance** |
| Endpoint Identifier             | `aurora-target`                          |
| Target Engine                   | aurora-postgresql                      |
| Access to endpoint database     | Provide access information manually    |
| Server Name                     | **< TargetAuroraPostgreSQLEndpoint >**     |
| Port                            | `5432`                                   |
| SSL Mode                        | none                                   |
| User Name                       | `dbmaster`                               |
| Password                        | `dbmaster123`                            |
| Database Name                   | `AuroraDB`                               |
| Test endpoint connection -> VPC | **< VPC ID from Environment Setup Step >** |
| Replication Instance            | oracle-replication                     |

![Endpoints](/images/2/39.png?width=90pc)

5. Once the information has been entered, click **Run Test**. When the status turns to **successful**, click **Create endpoint**.

![Endpoints](/images/2/39a.png?width=90pc)
