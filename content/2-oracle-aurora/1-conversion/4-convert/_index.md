+++
title = "Convert the Schema"
date = 2020
weight = 4
chapter = false
pre = "<b>2.1.4. </b>"
+++

**Contents**
- [Convert the Schema](#convert-the-schema)

---

#### Convert the Schema

1. Right-click on the `DMS_SAMPLE` schema from Oracle source and select **Convert Schema** to generate the data definition language (DDL) statements for the target database.

You can view the generated DDL in the project console, and edit it before applying it to the target database. You can also choose to save it as an .sql file for application later.

{{% notice warning %}}
You may be prompted with a dialog box **"Object may already exist in the target database, replace?"** Select **Yes** and conversion will start.
{{% /notice %}}

![Convert](/images/2/14.png?width=90pc)
AWS SCT analyses the schema and creates a database migration assessment report for the conversion to PostgreSQL. Items with a red exclamation mark next to them cannot be directly translated from the source to the target. This includes Stored Procedures, and Packages.

2. Click on the **View** button, and choose **Assessment Report view**.

![Convert](/images/2/15.png?width=90pc)

3. Next, navigate to the **Action Items** tab in the report to see the items that the tool could not convert, and find out how much manual changes you need to make.

![Convert](/images/2/16.png?width=90pc)
Check each of the issues listed and compare the contents under the source Oracle panel and the target Aurora PostgreSQL panel. Are the issues resolved? And how?

AWS SCT analyses the source Oracle database and creates a database migration assessment report for the conversion to Autora PostgreSQL. Items with a red exclamation mark next to them cannot be automatically converted by the AWS SCT. This includes Stored Procedures, and Packages. You need to manually modify these objects to make them compatible with the target database. You can complete one of the following actions to fix the issue:

```text
1. Modify the objects on the source Oracle database so that AWS SCT can convert the objects to the target Aurora PostgreSQL database.\
2. Instead of modifying the source Oracle database object, modify scripts that AWS SCT generates before applying the scripts on the target Aurora PostgreSQL database.
```

For the sake of time, we skip modifying all the objects that AWS SCT has marked that it could not be automatically converted. Instead, as an example, we will manually modify the `GENERATESEATS`, and the `GENERATE_TICKETS` stored procedures from within SCT to make them compatible with the target database.

If you click on the `GENERATESEATS`, and the `GENERATE_TICKETS` stored procedures, you will see that SCT is unable to automatically convert code as APPEND Hint is not supported in PostgreSQL.

4. Click on the `GENERATESEATS` procedure and remove `/*+ APPEND */` from the `INSERT` statement.

![Convert](/images/2/17.png?width=90pc)

5. Similarly, click on `GENERATE_TICKETS` procedure and remove `/*+ APPEND */` from the `INSERT` statement.
6. Right click on the `dms_sample` schema in the left-hand panel, and click **Create report**.

![Convert](/images/2/18.png?width=90pc)

7. Notice that all both modified objects are now compatible with the target database dialect.

![Convert](/images/2/19.png?width=90pc)

8. Click on the `dms_sample` schema in the left-hand panel, and click **Convert Schema**.

![Convert](/images/2/20.png?width=90pc)

9. You may be prompted with a dialog box **"Object may already exist in the target database, replace?"**. Select **Yes**.

![Convert](/images/2/21.png?width=90pc)

10. Right click on the `dms_sample` schema in the right-hand panel, and click **Apply to database**.

![Convert](/images/2/22.png?width=90pc)

11. When prompted if you want to apply the schema to the database, click **Yes**.

![Convert](/images/2/23.png?width=90pc)

12. At this point, the schema has been applied to the target database. Expand the `dms_sample` schema to see the tables.

![Convert](/images/2/24.png?width=90pc)

{{% notice note %}}
You may see an exclamation mark on certain database objects such as indexes, and foreign key constraints. In the next section we will drop foreign key target database.
{{% /notice %}}

You have successfully converted the database schema and object from Oracle to the format compatible with Amazon Aurora (PostgreSQL).

This part demonstrated how easy it is to migrate the schema of an Oracle database into Amazon Aurora (PostgreSQL) using the AWS Schema Conversion Tool. Similarly, you learned how the Schema Conversion Tool highlights the differences between different database engine dialects, and provides you with tips on how you can successfully modify the code when needed to migrate procedure and other database objects.

The same steps can be followed to migrate SQL Server and Oracle workloads to other RDS engines including PostgreSQL and MySQL.

The next section describes the steps required to move the actual data using AWS DMS.
