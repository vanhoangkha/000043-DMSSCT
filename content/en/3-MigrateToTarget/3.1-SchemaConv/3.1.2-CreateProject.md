---
title: "Create a Schema Conversion Project"
weight: 2
chapter: false
pre: "<b> 3.1.2. </b>"
---

Now that you have installed the AWS Schema Conversion Tool, the next step is to create a Database Migration Project using the tool.

### Specify the source database

1. Within the Schema Conversion Tool, if the new project wizard doesn't start please start it by going to **File > New Project Wizard** top left corner. Once in **Project wizard** mode, please enter the following values into the form note you'll need to adjust for the source database you selected in the text below and then click **Next**.

    |  Parameter 	|  Value  |
    |----------------|------------------------|
    |  Project Name		|  AWS Schema Conversion Tool Source DB to Aurora MySQL (or Aurora PostgresSQL)  |
    |  Location		|  C:\Users\Administrator\AWS Schema Conversion Tool  |
    |  Type Radio Button		|  Click/Select SQL Database  |
    |  Source Database Engine		|  Microsoft SQL Server, Oracle or Source you selected earlier in this session  |
    |  **"I want to"** Radio Button		|  Click/Select **I want to switch engines and optimize for the cloud**  |

    ![New Project Wizard](/images/3/1/2/0001.png?width=80pc)

    ![New Project Wizard](/images/3/1/2/0002.png?width=80pc)

1. Specify the source database configurations in the form, Please note the password is not provided below you need to goto Secrets Manager and open DMSDBSecret and reveal the SQLServer password value. It is also on first Cloudformation Stack's output tab (SQLServerPassword) and click Test Connection. Once the connection is successfully tested, click **Next**.

    Depending on your source database, choose one of the following routes to follow the steps.

    #### Oracle Source Information
    {{%expand "Expand to see" %}}

|  Parameter	 |  Value  |
|----------------|---------------|
|  Connection Name (if there)	 |  Oracle Source  |
|  Type	 |  SID  |
|  Server Name	 |  < SourceOracleEndpoint (you can find this in Cloudformation Output tab or goto RDS service in |  console and pick your RDS Oracle Target instance)>  |
|  Server Port	 |  1521  |
|  Oracle SID	 |  ORACLEDB  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager for Oracle  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  Oracle Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\ojdbc11.jar  |

    {{% /expand %}}

    #### MS SQL Server Source Information
    {{%expand "Expand to see" %}}

|  Parameter	 |  Value  |
|----------------|---------------|
|  Connection Name (if there)	 |  SQL Server Source  |
|  Project Name	 |  localhost  |
|  Server Port	 |  1433  |
|  Instance Name	 |  localhost  |
|  Authentication	 |  SQL Server Authentication  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretPSQLSERVER or look it up in AWS Secrets Manager for SQL Server  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  Microsoft SQL Server Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\mssql-jdbc-12.6.1.jre11.jar  |

    {{% /expand %}}

    ![New Project Wizard](/images/3/1/2/0003.png?width=80pc)

1. Select the **dms_sample** database, then click **Next**. (Note: once you click on database gray/blue bar highlight should appear & **Next** button will be enabled)

    ![New Project Wizard](/images/3/1/2/0004.png?width=80pc)

### Review the Database Migration Assessment Report.

1. SCT will examine in detail all of the objects in the schema of source database. It will convert as much as possible automatically and provides detailed information about items it could not convert. If you scroll down on the report you'll see specific target databases like below for SQL Server to Aurora MySQL.

    Generally, packages, procedures, and functions are more likely to have some issues to resolve because they contain the most custom or proprietary SQL code. AWS SCT specifies how much manual change is needed to convert each object type. It also provides hints about how to adapt these objects to the target schema successfully.

1. After you are done reviewing the database migration assessment report, click **Next**.

    ![New Project Wizard](/images/3/1/2/0005.png?width=80pc)

### Specify the target database

Specify the target database configurations in the form, Please note the password is not provided below you need to go to **Secrets Manager** and open **DMSDBSecret** and reveal the password. It is also on first Cloudformation Stack's output tab see the SQLSever password (same as above) and then click **Test Connection**. Once the connection is successfully tested, click **Finish**.

{{%expand "Expand if you are convert to Amazon Aurora (MySQL compatible)" %}}

|  Parameter	 |  Value  |
|-----------------|--------------------|
|  Target Database Engine	 |  Amazon Aurora (MySQL compatible) not the default  |
|  Connection Name (if there)	 |  Aurora MySQL Target  |
|  Server Name	 |  TargetAuroraMySQLEndpoint - you can find this on Cloudformation > cfn > output tab or you can goto RDS in the AWS console and find your MySQLTarget instance  |
|  Server Port	 |  3306  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager.  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  MySQL Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\mysql-connector-j-8.3.0.jar  |

{{% /expand %}}

{{%expand "Expand if you are convert to Amazon Aurora (PostgreSQL compatible)" %}}

|  Parameter 	|  Value  |
|-----------------|--------------------|
|  Target Database Engine		|  Amazon Aurora (PostgreSQL compatible) not the default  |
|  Connection Name (if there)		|  Postgresql Target  |
|  Server Name		|  **TargetAuroraPostgreSQLEndpoint** - you can find this on Cloudformation > cfn > output tab or you can goto RDS in the AWS console and find your Postgresql Target instance  |
|  Server Port		|  `**5432**`  |
|  Database Name		|  AuroraDB case sensitive  |
|  User Name		|  `**dbadmin**`  |
|  Password		|  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager for Postgresql  |
|  Use SSL		|  Unchecked  |
|  Store Password		|  Checked  |
|  Amazon Aurora Driver Path		|  `**C:\Users\Administrator\Desktop\DMS Workshop\JDBC\postgresql-42.7.3.jar**` If copy and paste isn't working use the browse button to the DMS Workshop JDBC folder on the desktop  |

{{% /expand %}}

![New Project Wizard](/images/3/1/2/0006.png?width=80pc)

![New Project Wizard](/images/3/1/2/0007.png?width=80pc)

{{% notice info %}}
After hitting **Next** and loading metadata, you may get a warning message saying: Metadata loading was intrupted because of data fetching issues. You can ignore this message as it doesn't affect us in this workshop. Note it will take a few minutes for SCT to analyze the database objects
{{% /notice %}}