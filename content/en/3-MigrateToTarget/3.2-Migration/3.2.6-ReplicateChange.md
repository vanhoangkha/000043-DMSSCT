---
title: "Replicate Data Changes"
weight: 6
chapter: false
pre: "<b> 3.2.6. </b>"
---

Now you are going to simulate a transaction to the source database by updating the sport_type table. The Database Migration Service will automatically detect and replicate these changes to the target database.

For Oracle Source:

{{% expand "Expand this if your source DB type is Oracle" %}}

1. On the EC2 instance you RDP-ed into, use **Oracle SQL Developer** connect to the source Oracle RDS.

1. Open a **New Query** window and execute the following statement to insert 5 new sports into the **sport_type** table:

    ```sql
    INSERT ALL

    INTO dms_sample.sport_type (name,description) VALUES ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick')

    INTO dms_sample.sport_type (name,description) VALUES ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop')

    INTO dms_sample.sport_type (name,description) VALUES ('soccer','A sport played with a spherical ball between two teams of eleven players')

    INTO dms_sample.sport_type (name,description) VALUES ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court')

    INTO dms_sample.sport_type (name,description) VALUES ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end')

    SELECT * FROM dual; 

    COMMIT;

    SELECT * FROM dms_sample.sport_type; 
    ```

![](/images/3/2/6/0001.png?width=80pc)

{{% /expand %}}

{{% expand "Expand this if your source DB type is Microsoft SQL Server" %}}

For SQL Server Source:

1. Use **Microsoft SQL Server Management Studio** to connect to the Source SQL Server on the EC2 instance.

1. Open a **New Query** window and execute the following statement to insert 5 new sports into the **sport_type** table:

    ```sql
    USE [dms_sample]
    GO

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('soccer','A sport played with a spherical ball between two teams of eleven players');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
                ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end');

    GO
    ```
{{% /expand %}}

![](/images/3/2/6/0003.png?width=80pc)

Repeat steps [from prior screen](../3.1.2.4-CreateTask.md) that selected the contents of **sport_type** table in the target database.

{{% notice info %}}
The new records for that you added for basketball, cricket, hockey, soccer, volleyball to the sports_type table in the source database have been replicated to your dms_sample database. You can further investigate the number of inserts, deletes, updates, and DDLs by viewing the Table statistics of your Database migration tasks in AWS console.
{{% /notice %}}