---
title: "Convert the Schema"
weight: 3
chapter: false
pre: "<b> 3.1.3. </b>"
---

Now that you have created a new Database Migration Project, the next step is to convert the schema of the source database to the Amazon Aurora MYSQL.

1. Click on **_DMS_SAMPLE_** schema from source on the left hand side of screen

    {{% expand ">> For Oracle Source expand here" %}}

![Oracle assessment](/images/3/1/3/0001.png?width=80pc)

    {{% /expand %}}

    {{% expand ">> For SQL Server Source expand here" %}}

![Oracle assessment](/images/3/1/3/0002.png?width=80pc)

    {{% /expand %}}

    AWS SCT analyses the schema and creates a database migration assessment report for the conversion to PostgreSQL. Items with a red exclamation mark next to them cannot be directly translated from the source to the target. This includes Stored Procedures, and Packages.

1. Click on the View button, and choose **Assessment Report** view.

    For Oracle source it will look like

    ![Oracle assessment](/images/3/1/3/0002-1.png?width=80pc)

    SQL Server will look similar just with SQL Server source on left side of the screen and an SQL Server database hierachy instead of Oracle. You'll want to click on dms_sample in MS SQL Server

1. Next, navigate to the **Action Items** tab in the report to see the items that the tool could not convert, and find out how much manual changes you need to make.

    For MS SQL Server source, it should look like:

    ![Oracle Action](/images/3/1/3/0002.png?width=80pc)

    For Oracle source, it should look like:

    ![MSSQL Action](/images/3/1/3/0003.png?width=80pc)

    AWS SCT analyzes the schema and creates a database migration assessment report for the conversion to Aurora MySQL. Items with a blue mark next to them cannot be directly translated from the source to the target. Items in green will be translated over from source to target. In this case, this includes the stored procedures. For each conversion issue, you can complete one of the following actions:

    1. Modify the objects on the source database so that AWS SCT can convert the objects to the target Aurora MySQL database.
    
    2. Instead of modifying the source schema, modify scripts that AWS SCT generates before applying the scripts on the target Aurora MySQL database.

    However, for the sake of time, we skip modifying all the objects that could not be automatically converted. Instead, as an example, you will manually modify one of the stored procedures from within SCT to make it compatible with the target database. 
    
    This is demonstrated in [this subsection](./ModifyCode).


1. Click on the `**dms_sample**` for Oracle or dbo for sql server schema in the left-hand panel, and click **Convert Schema**.
For Oracle it will look like below and for other databases similar except that database name at the top and its hierarchy on the left

    ![MSSQL Action](/images/3/1/3/0004.png?width=80pc)

1. You may be prompted with a dialog box **“Object may already exist in the target database, replace?”** Select **Yes**.

    ![MSSQL Action](/images/3/1/3/0005.png?width=80pc)


1. Right click on the **_dms_sample_dbo_** (SQL Sever) or **dms_sample** (other DBs) schema in the right-hand panel, and click **Apply to database**.

    {{% expand ">> For Oracle Source expand here" %}}

![MSSQL Action](/images/3/1/3/0006-a.png?width=80pc)

    {{% /expand %}}

    {{% expand ">> For SQL Server Source expand here" %}}

![MSSQL Action](/images/3/1/3/0006-b.png?width=80pc)

    {{% /expand %}}


1. When prompted if you want to apply the schema to the database, click **Yes**.

    {{% notice note %}}
You may see an exclamation mark on certain database objects such as indexes, and foreign key constraints. In the next section we will drop foreign key target database.
    {{% /notice %}}

1. At this point, the schema has been applied to the target database. Expand the **_dms_sample_dbo_** or **_dms_sample_** schema on the right hand pane to see the tables, views, procedures, etc. Note please expand per source below as some have extra steps specifically SQL Server requires additional steps.

    {{% expand ">> For SQL Server Source expand here" %}}

1. In preparation for future steps we will need to generate sql script for the constraints we just added to the target. To do this, we first want to change the project settings from the **Settings** menu at top and selecting **Project settings** as shown below.
    ![MSSQL Extra](/images/3/1/3/0007.png?width=80pc)

2. Select **Save scripts** from the menu on left then Select **Aurora Postgresql** from top drop down for **Vendor** and select **Single file** for each **Stage** in the second drop down as shown below.

    ![MSSQL Extra](/images/3/1/3/0008.png?width=80pc)

3. Now Click on Aurora Postgresql target right side of your screen so **_dms_sample_dbo_** is highlighted and right click so the pop up menu shows and select **Save as SQL** as shown below.

    ![MSSQL Extra](/images/3/1/3/0009.png?width=80pc)

4. Select the project folder and save the files. Leave this window open as you'll need to come back to it later. It should look similar to below but note things change fairly fast here so if it isn't an exact match that's okay.

    ![MSSQL Extra](/images/3/1/3/0010.png?width=80pc)

    {{% /expand %}}


You have sucessfully converted the database schema and object from source to Amazon Aurora.

This part demonstrated how easy it is to migrate the schema of a source database into Amazon Aurora PostgreSQL using the AWS Schema Conversion Tool. Similarly, you learned how the Schema Conversion Tool highlights the differences between different database engine dialects, and provides you with tips on how you can successfully modify the code when needed to migrate procedure and other database objects.

The same steps can be followed to migrate SQL Server and Oracle workloads to other RDS/Aurora engines including PostgreSQL and MySQL.