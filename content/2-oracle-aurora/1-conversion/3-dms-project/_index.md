+++
title = "Database Migration Project"
date = 2020
weight = 3
chapter = false
pre = "<b>2.1.3. </b>"
+++

**Contents**
- [Create a Database Migration Project](#create-a-database-migration-project)

---

#### Create a Database Migration Project

Now that you have installed the AWS Schema Conversion Tool, the next step is to create a Database Migration Project using the tool.

1. Within the Schema Conversion Tool, enter the following values into the form and then click Next.

|        Parameter       |                             Value                            |
|:----------------------:|:------------------------------------------------------------:|
| Project Name           | AWS Schema Conversion Tool Oracle to Aurora PostgreSQL       |
| Location               | C:\Users\Administrator\AWS Schema Conversion Tool\Projects   |
| Database Type          | Transactional Database (OLTP)                                |
| Source Database Engine | Oracle / I want to switch engines and optimize for the cloud |

![Project](/images/2/8.png?width=90pc)

2. Specify the source database configurations in the form, and click **Test Connection**. Once the connection is successfully tested, click **Next**.

|      Parameter     |                            Value                            |
|:------------------:|:-----------------------------------------------------------:|
| Type               | SID                                                         |
| Server Name        | < SourceOracleEndpoint >                                    |
| Server Port        | 1521                                                        |
| Oracle SID         | ORACLEDB                                                    |
| User Name          | dbmaster                                                    |
| Password           | dbmaster123                                                 |
| Use SSL            | Unchecked                                                   |
| Store Password     | Checked                                                     |
| Oracle Driver Path | C:\Users\Administrator\Desktop\DMS Workshop\JDBC\ojdbc8.jar |

![Project](/images/2/9.png?width=90pc)

{{% notice note %}}
You may see a security warning prompt to use SSL. Click on **"Accept the risk and continue"** button.
{{% /notice %}}

3. Select the `DMS_SAMPLE` database, then click **Next**.

![Project](/images/2/10.png?width=90pc)

{{% notice note %}}
After hitting **Next** and loading metadata, you may get a warning message saying: **Metadata loading was interrupted because of data fetching issues.** You can ignore this message as it doesn’t affect us in this workshop.
{{% /notice %}}

4. Review the **Database Migration Assessment Report**.

![Project](/images/2/11.png?width=90pc)
SCT will examine in detail all of the objects in the schema of source database. It will convert as much as possible automatically and provides detailed information about items it could not convert.

![Project](/images/2/12.png?width=90pc)
Generally, packages, procedures, and functions are more likely to have some issues to resolve because they contain the most custom or proprietary SQL code. AWS SCT specifies how much manual change is needed to convert each object type. It also provides hints about how to adapt these objects to the target schema successfully.

5. After you are done reviewing the database migration assessment report, click **Next**.
6. Specify the target database configurations in the form, and then click **Test Connection**. Once the connection is successfully tested, click **Finish**.

|         Parameter         |                                  Value                                 |
|:-------------------------:|:----------------------------------------------------------------------:|
| Target Database Engine    | Amazon Aurora (PostgreSQL compatible)                                  |
| Server Name               | < TargetAuroraPostgreSQLEndpoint >                                     |
| Server Port               | 5432                                                                   |
| Database Name             | AuroraDB                                                               |
| User Name                 | dbmaster                                                               |
| Password                  | dbmaster123                                                            |
| Use SSL                   | Unchecked                                                              |
| Store Password            | Checked                                                                |
| Amazon Aurora Driver Path | C:\Users\Administrator\Desktop\DMS Workshop\JDBC\postgresql-42.2.9.jar |

![Project](/images/2/13.png?width=90pc)

{{% notice note %}}
You may see a warning message saying database version that you connected to is **11.7** which is less than the recommended **PostgreSQL 12.0**. You can ignore the warning.
![Project](/images/2/13a.png?width=90pc)
{{% /notice %}}
