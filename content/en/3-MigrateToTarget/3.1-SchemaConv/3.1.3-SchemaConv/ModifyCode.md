---
title: "Modify the Procedural Code"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

In this part, we support modifying the procedural code for SQL Server that Schema Conversion Tool could not automatically convert for the target database dialect.

{{% notice info %}}
The first three steps is for SQL Server source only. If you use the Oracle source, you can skip to step 4.
{{% /notice %}}

1. From the left panel, uncheck the items with the exclamation mark except for the generateTransferActivity procedure.

    ![Procedural code change](/images/3/1/3/a/0001.png?width=80pc)

1. Next, click on the **generateTransferActivity** procedure. Observe how the SCT highlights the issue, stating that MySQL does not support the **PRINT** procedure. To fix this, you need to replace the three highlighted **PRINT** statements with SELECT statement as demonstrated in the following example: 

    _**Note:** suggest you use -- in front of current PRINT line to comment it out then copy and paste the correct syntax for the first 2 occurences then copy the last correct syntax for the last one. You'll need to do this all in 1 edit session so arrow down after going to the firt line_

    MS SQL Server syntax:

    ```sql
    PRINT (concat('max t: ',@max_tik_id,' min t: ', @min_tik_id, 'max p: ',@max_p_id,' min p: ', @min_p_id));
    ```

    MySQL syntax:

     ```sql
    --first 2 use line below
    SELECT concat('max t: ',@max_tik_id,' min t: ', @min_tik_id, 'max p: ',@max_p_id,' min p: ', @min_p_id); 
    --third one use 
    SELECT ('Sorry, no tickets are available for transfer.');
    ```

1. After you make the modification, right-click on the **dbo** schema, and choose **Create Report**. Observe that the schema of the source database is now fully compatible with the target database.

    _**Note:** For non-SQL Server sources (e.g. Oracle), it says step 4. However, this is really your first step on this page. Thanks for your understanding!!_

    ![Procedural code change](/images/3/1/3/a/0002.png?width=80pc)

1. Right click on the **dms_sample** database in the left panel and select **Convert Schema** to generate the data definition language (DDL) statements for the target database.

    ![Procedural code change](/images/3/1/3/a/0003.png?width=80pc)

1. When warned that objects may already exist in database, click **Yes**.

    {{% notice note %}}
You may be presented with a different message stating **“The operation will be partially performed”** and only 3 of the 8 objects will be converted. Click **OK**.
    {{% /notice %}}

    ![Procedural code change](/images/3/1/3/a/0004.png?width=80pc)

1. Right click on the **dms_sample > dbo (SQL Server source)** or **dms_sample (other sources)** schema in the right-hand panel, and click **Apply to database**.

    ![Procedural code change](/images/3/1/3/a/0005.png?width=80pc)

1. When prompted if you want to apply the schema to the database, click **Yes**.

    ![Procedural code change](/images/3/1/3/a/0006.png?width=80pc)

1. At this point, the schema has been applied to the target database. Expand the **dms_sample_dbo** or **dms_sample** schema on the right hand panel to see the tables, views, store procedures etc.

    ![Procedural code change](/images/3/1/3/a/0007.png?width=80pc)

You have sucessfully converted the database schema and object from source to the format compatible with Amazon Aurora (MySQL).

This part demonstrated how easy it is to migrate the schema of a source database into Amazon Aurora (MySQL) using the AWS Schema Conversion Tool. Similarly, you learned how the Schema Conversion Tool highlights the differences between different database engine dialects, and provides you with tips on how you can successfully modify the code when needed to migrate procedure and other database objects.

The same steps can be followed to migrate SQL Server and Oracle workloads to other RDS engines including PostgreSQL and MySQL.

The next section describes the steps required to move the actual data using AWS DMS. Read on to learn more...