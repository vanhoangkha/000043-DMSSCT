---
title: "Create DMS Source and Target Endpoints"
weight: 3
chapter: false
pre: "<b> 3.2.3. </b>"
---

Now that you have a replication instance, you need to create source and target endpoints for the sample database.

1. Click on the **Endpoints** link on the left, and then click on **Create endpoint** on the top right corner.

    ![Endpoint Console](/images/3/2/3/0000.png?width=80pc)

1. Enter the following information to create an endpoint for the source **dms_sample** database Please note the password is not provided below you need to goto Secrets Manager and open **DMSDBSecret** and reveal the SQL Server password (same as earlier if you've already done this). It is also on first Cloudformation Stack's output tab under password either SQL Server or Oracle depending on your source:

    #### Oracle source:

    {{% expand "Expand this if your source DB type is Oracle" %}}

|  Parameter	 |  Value  |
|----------------|-----------------------|
|  Endpoint Type	 |  Source endpoint  |
|  Select RDS DB instance	 |  Checked for Oracle others leave blank  |
|  RDS Instance	 |  <StackName>-SourceOracleDB  |
|  Endpoint Identifier	 |  `oracle-source` or take populated value  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Source Engine	 |  oracle  |
|  Access to Endpoint database Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  < SourceOracleEndpoint Should auto populate >  |
|  Port	 |  1521  |
|  SSL Mode	 |  none  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation **Output** tab & **DMSDBSecretP** or look it up in AWS Secrets Manager for Oracle  |
|  Database Name	 |  	`dms_sample_target`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  **cfn-DMSReplication** or **DMSReplication** or the one you created if it is ready  |

    {{% /expand %}}

    #### Microsoft SQL Server source:

    {{% expand "Expand this if your source DB type is Microsoft SQL Server" %}}

|  Parameter	 |  Value  |
|----------------|-----------------------|
|  Endpoint Type	 |  Source endpoint  |
|  Endpoint Identifier	 |  `sqlserver-source`  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Source Engine	 |  Microsoft SQL Server  |
|  Access to Endpoint database Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  < EC2 ip address/domain name > - Look it up in the **Output** tab of the CFn stack  |
|  Port	 |  1433  |
|  SSL Mode	 |  none  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation **Output** tab & **DMSDBSecretPSQLServer** or look it up in AWS Secrets Manager for SQL Server  |
|  Database Name	 |  	`dms_sample`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  **cfn-DMSReplication** or **DMSReplication** or the one you created if it is ready  |
|  Endpoint Settings  |  	unfold arrow, check "Use Endpoint connection attributes" then add setUpMsCdcForTables=true to the text box  |

    {{% /expand %}}

    ![Endpoint Console](/images/3/2/3/0002.png?width=80pc)
    ![Endpoint Console](/images/3/2/3/0003.png?width=80pc)
    ![Endpoint Console](/images/3/2/3/0004.png?width=80pc)

1. Once the information has been entered, select the existing DMS Replcation instance (the one without your initials) and click **Run Test**. When the status turns to successful, click **Create endpoint**.

    ![Endpoint Console](/images/3/2/3/0005.png?width=80pc)


1. Follow the same steps to create another endpoint for the Target Aurora RDS Database (**dms_sample_dbo** or **dms_sample** depending on your source db) using the following values Please note the password is not provided below you need to goto Secrets Manager and open DMSDBSecret and reveal the SQL Server password. It is also on first Cloudformation Stack's output tab under SQL Server password (yes this is mysql but the passwords are the same for sql server & mysql in this case) :

    #### Aurora (MySQL) target:

    {{% expand "Expand this if your target type is Aurora (MySQL)" %}}

|  Parameter	 |  Value  |
|----------------|-----------------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked for all DB targets  |
|  Select RDS DB instance	 |  <StackName>-AuroraMySQLInstance  |
|  Endpoint Identifier	 |  aurora-mysql-target  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Target Engine	 |  Amazon Aurora MySQL  |
|  Access to Endpoint database Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  `**TargetAuroraMySQLEndpoint**` or it should auto populate  |
|  Port	 |  3306  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  `**cfn-DMSReplication**` or `**DMSReplication**` or the one you created if it is ready  |

    {{% /expand %}}

    #### Aurora (PostgreSQL) target:

    {{% expand "Expand this if your target type is Aurora (PostgreSQL)" %}}

|  Parameter	 |  Value  |
|----------------|-----------------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked for all DB targets  |
|  Select RDS DB instance	 |  <StackName>-AuroraMySQLInstance  |
|  Endpoint Identifier	 |  `**aurora-postgresql-target**` or it should auto populate  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Target Engine	 |  Amazon Aurora PostgreSQL  |
|  Access to Endpoint database Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  `**TargetAuroraPostgreSQLEndpoint**` or it should auto populate  |
|  Port	 |  5432  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  `**cfn-DMSReplication**` or `**DMSReplication**` or the one you created if it is ready  |

    {{% /expand %}}

    #### RDS Microsoft SQL Server target:

    {{% expand "Expand this if your target type is RDS Microsoft SQL Server:" %}}

|  Parameter	 |  Value  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked for all DB targets  |
|  Select RDS DB instance	 |  <StackName>-TargetSQLServer  |
|  Endpoint Identifier	 |  `**sqlserver-target**` or use name that auto populates  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Target Engine	 |  Microsoft SQL Server  |
|  **Access to Endpoint database** Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  TargetSqlServerEndpoint (this should auto populate)  |
|  Port	 |  1433  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager that ends in RDSDBSecret  |
|  Database Name	 |  `**dms_sample_target**`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with **DMSVpc** in the name from Environment Setup Step>  |
|  Replication Instance	 |  `**cfn-dmsreplication**` or just `**dmsreplication**`  |

    {{% /expand %}}

    #### RDS Oracle target:

    {{% expand "Expand this if your target type is Oracle:" %}}

|  Parameter	 |  Value  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked all DB targets  |
|  Select RDS DB instance	 |  < StackName >-TargetOracleDB  |
|  Endpoint Identifier	 |  oracle-target or take the default that auto populates  |
|  Descriptive Amazon Resource Name (if there)	 |  leave blank  |
|  Target Engine	 |  oracle  |
|  **Access to Endpoint database** Radio Button	 |  Select/click **Provide access information Manually**  |
|  Server Name	 |  < TargetOracleEndpoint > should auto populate  |
|  Port	 |  1521  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  See **Cloudformation Output** tab & `**DMSDBSecretP**` or look it up in AWS Secrets Manager for Oracle  |
|  Database Name	 |  `**TARGETDB**`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with **DMSVpc** in the name from **Environment Setup** Step>  |
|  Replication Instance	 |  `**cfn-dmsreplication**` or just `**dmsreplication**`  |

    {{% /expand %}}

    #### Amazon S3 Target

    {{% expand "Expand this if your target type is Amazon S3:" %}}
|  Parameter	 |  Value  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Endpoint Identifier	 |  `**S3-target**`  |
|  Descriptive Amazon Resource Name	 |  leave blank  |
|  Target Engine	 |  Amazon S3  |
|  Server Name	 |  < ARN of the `**dms-migration-role**` >  |
|  Bucket Name	 |  < Name of Your S3 Bucket >  |
|  Bucket folder	 |  `**dmstargetfolder**`  |
    {{% /expand %}}

1. Once the information has been entered, select the existing DMS Replcation instance (the one without your initials) and click **Run Test**. When the status turns to successful, click **Create endpoint**.

    ![Endpoint Console](/images/3/2/3/0006.png?width=80pc)