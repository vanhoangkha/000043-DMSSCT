---
title: "Configure the Target Database (Local Microsoft SQL Server to RDS Microsoft SQL Server)"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

{{% notice info %}}

This guide is only for migration to RDS Microsoft SQL Server target. If your target database uses another schema, you can skip this page.

{{% /notice %}}

1. Now on our EC2 instance we've been connecting to via RDP, we are going to connect to our SQL Server RDS target database, from within SQL Server Management Studio, select SQL Server Authentication and connect to the SQL Server RDS instance using the following parameters Please note the password is not provided below you need to goto Secrets Manager and open DMSDBSecret and reveal the SQL Server password. It is also on first Cloudformation Stack's **Output** tab under SQL Server password :

    then use information below to populate the login window

    |  Parameter	 |  Value  |
    |-------------|-------------------|
    |  Server Type	 |  Database Engine  |
    |  Server Name	 |  < TargetSQLServerEndpoint (you can find this in Cloudformation **Output** tab or goto RDS service in console and pick your RDS SQL Server instance>  |
    |  Login	 |  dbadmin  |
    |  Password	 |  See Cloudformation **Output** tab & see value in DMSDBSecretP or look up password in AWS Secrets Manager for secret ending in RDSDBSecret  |
    |  **Remeber Password** check box	 |  checked  |

    it should look similar to

1. Open a **New Query** window if one doesn't open.

1. Run the following script to create a target database **dms_sample_target** on RDS SQL Server.

    ```sql
    use master
    GO

    CREATE DATABASE dms_sample_target
    GO
    ```

    ![Procedural code change](/images/3/2/1/a/0001.png?width=80pc)

The target database (**dms_sample_target**) has now been created. You can return to the **AWS Management Console**.
