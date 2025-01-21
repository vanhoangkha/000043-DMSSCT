---
title: "Granting permissions in the target database"
weight: 1
chapter: false
pre: "<b> 3.1.1. </b>"
---

{{% notice info %}}
1. This section is only for the Aurora (MySQL compatible) target. If you are migrating to a different target, you can skip this page.
\
2. Aurora MySQL will need some additional permissions before we run SCT, so make your you did the following steps before proceeding to the next section.
{{% /notice %}}


{{%expand "Expand to see this section if your migration target schema is Aurora MySQL" %}}

1. Open **MySQL Workbench 8.0 CE** from within the EC2 server, and create a new database connection for the target Aurora database using the following values. Please note the password is not provided below you need to go to **Secrets Manager** and open **DMSDBSecret** and reveal the SQL Server password. It is also on first Cloudformation Stack's output tab under SQL Server password (yes this is mysql but the passwords are the same for sql server & mysql in this case):

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0000.png?width=75pc)

    |  Parameter	 |  Value  |
    |-------------|---------------------------|
    |  Connection Name	 | ` Target Aurora RDS (MySQL)`  |
    |  Host Name	 |  <TargetAuroraMySQLEndpoint> - you can find this on **Cloudformation > cfn > output tab** or you can goto RDS in the AWS console and find your Aurora MySQL Target instance  |
    |  Port	 |  3306  |
    |  Username	 |  `dbadmin`  |
    |  Password (Enter after clicking **Test Connection**)	 |  See **Cloudformation Output** tab & **_DMSDBSecretP_** or look it up in AWS Secrets Manager for SQL Server  |
    |  Default Schema	 |  leave blank  |

1. Click **Test Connection** button and enter the password. After you receive a message stating **“Successfully made the MySQL connection”**, click **OK**.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0002.png?width=75pc)

1. Click on the Target Aurora RDS (MySQL) from the list of MySQL Connections in SQL Workbench to connect to the target database.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0003.png?width=75pc)

1. Copy the following permission sql statements and execute them in the workbench tool (Lighting icon is execute/run icon).

    ```sql
    GRANT CREATE ON *.* TO 'dbadmin';
    GRANT ALTER ON *.* TO 'dbadmin';
    GRANT DROP ON *.* TO 'dbadmin';
    GRANT INDEX ON *.* TO 'dbadmin';
    GRANT REFERENCES ON *.* TO 'dbadmin';
    GRANT SELECT ON *.* TO 'dbadmin';
    GRANT CREATE VIEW ON *.* TO 'dbadmin';
    GRANT SHOW VIEW ON *.* TO 'dbadmin';
    GRANT TRIGGER ON *.* TO 'dbadmin';
    GRANT CREATE ROUTINE ON *.* TO 'dbadmin';
    GRANT ALTER ROUTINE ON *.* TO 'dbadmin';
    GRANT EXECUTE ON *.* TO 'dbadmin';
    -- only for MySQL <8.0 GRANT SELECT ON mysql.proc TO 'awssct';
    GRANT INSERT, UPDATE ON AWS_SQLSERVER_EXT.* TO 'dbadmin';
    GRANT INSERT, UPDATE, DELETE ON AWS_SQLSERVER_EXT_DATA.* TO 'dbadmin';
    GRANT CREATE TEMPORARY TABLES ON AWS_SQLSERVER_EXT_DATA.* TO 'dbadmin';
    GRANT CREATE TEMPORARY TABLES ON *.* TO 'dbadmin';
    -- MySQL <8 code GRANT INVOKE LAMBDA ON *.* TO 'awssct';
    GRANT AWS_LAMBDA_ACCESS TO 'dbadmin'; 
    GRANT INSERT, UPDATE ON AWS_ORACLE_EXT.* TO 'dbadmin';
    GRANT INSERT, UPDATE, DELETE ON AWS_ORACLE_EXT_DATA.* TO 'dbadmin';
    grant INSERT ON aws_sqlserver_ext.* to 'dbadmin';
    grant UPDATE ON aws_sqlserver_ext.* to 'dbadmin';
    ```

    After execution, the output should look something like the image below. We suggest you keep MySQL workbench open as you'll come back to it later in the DMS section.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0004.png?width=75pc)

You can now change the EC2 instance you are RDP-ed into back to the Schema conversion tool and click **Next** below.
{{% /expand%}}