---
title: "Aurora (PostgresSQL compatible) target"
weight: 3
chapter: false
pre: "<b> c. </b>"
---

1. Open pgAdmin from within the EC2 server task bar at the bottom of the screen (look for elephant), and click on that/open it. Close the warning about a new version of pgAdmin if it pops up. Note the order of icons on your instance maybe different than image below.

    ![](/images/3/2/1/c/0001.png?width=40pc)

1. Click on **Add Server > New server** button or on word Servers in the left pane then right Click and highlight Register then highlight Server and create a new database connection for the target Aurora PostgreSQL database using the following values. You will need to complete General tab and Connection tab separately. Please note the password is not provided below you need to goto Secrets Manager and open DMSDBSecret and reveal the password. It is also on the lab's Cloudformation Stack's **Output** tab:

    ![](/images/3/2/1/c/0002.png?width=80pc)

    |  Parameter	 |  Value  |
    |---------------|-------------|
    |  General -> Name	 |  Target Aurora RDS (PostgreSQL)  |
    |  Connection -> Host Name/Address	 |  < TargetAuroraPostgreSQLEndpoint > you can find this on **Cloudformation > stack > output tab** or you can goto RDS in the AWS console and find your Postgresql Target instance  |
    |  Connection -> Port	 |  5432  |
    |  Connection -> Maintenance Database	 |  AuroraDB  |
    |  Connection -> Username	 |  dbadmin  |
    |  Connection -> Password	 |  See **Cloudformation Output** tab & **_DMSDBSecretP_** or look it up in AWS Secrets Manager for Postgresql  |
    |  Connection -> Save Password	 |  Check or **turn on/slide on**  |

    ![](/images/3/2/1/c/0003.png?width=80pc)

    ![](/images/3/2/1/c/0004.png?width=80pc)

    After that, you can click **Save** and it will connect you.

1. Right-click on the **AuroraDB** database from left-hand menu, and then select **Query Tool**. _**Note:** you can click through the list of objects on the left to see your converted tables if you'd like but not required._

    ![](/images/3/2/1/c/0005.png?width=80pc)

1. In this step you are going to drop the foreign key constraint from the target database for full load to occur since DMS isn't aware of constraints:

1. In this step you are going to drop the foreign key constraint from the target database. This step varies by source database so find your source database below and follow the steps appropriately. Note you do not need to run scripts for sources that you didn't select earlier:

    {{% expand "For Oracle Source expand this" %}}
Copy the content of the sql code below and paste it into the Query Editor in **pgAdmin** and Execute the script. (note that there's a copy button to right hand corner to copy the code block)

```sql
ALTER TABLE dms_sample.player
DROP CONSTRAINT IF EXISTS sport_team_fk;

ALTER TABLE dms_sample.seat
DROP CONSTRAINT IF EXISTS s_sport_location_fk;

ALTER TABLE dms_sample.seat
DROP CONSTRAINT IF EXISTS seat_type_fk;

ALTER TABLE dms_sample.sport_division
DROP CONSTRAINT IF EXISTS sd_sport_type_fk;

ALTER TABLE dms_sample.sport_division 
DROP CONSTRAINT IF EXISTS sd_sport_league_fk;

ALTER TABLE dms_sample.sport_league 
DROP CONSTRAINT IF EXISTS sl_sport_type_fk;

ALTER TABLE dms_sample.sport_team 
DROP CONSTRAINT IF EXISTS st_sport_type_fk;

ALTER TABLE dms_sample.sport_team 
DROP CONSTRAINT IF EXISTS home_field_fk;

ALTER TABLE dms_sample.sporting_event
DROP CONSTRAINT IF EXISTS se_sport_type_fk;

ALTER TABLE dms_sample.sporting_event 
DROP CONSTRAINT IF EXISTS se_away_team_id_fk;

ALTER TABLE dms_sample.sporting_event 
DROP CONSTRAINT IF EXISTS se_home_team_id_fk;

ALTER TABLE dms_sample.sporting_event
DROP CONSTRAINT IF EXISTS se_location_id_fk;

ALTER TABLE dms_sample.sporting_event_ticket 
DROP CONSTRAINT IF EXISTS set_person_id;

ALTER TABLE dms_sample.sporting_event_ticket 
DROP CONSTRAINT IF EXISTS set_sporting_event_fk;

ALTER TABLE dms_sample.sporting_event_ticket 
DROP CONSTRAINT IF EXISTS set_seat_fk;

ALTER TABLE dms_sample.ticket_purchase_hist 
DROP CONSTRAINT IF EXISTS tph_sport_event_tic_id;

ALTER TABLE dms_sample.ticket_purchase_hist 
DROP CONSTRAINT IF EXISTS tph_ticketholder_id;

ALTER TABLE dms_sample.ticket_purchase_hist 
DROP CONSTRAINT IF EXISTS tph_transfer_from_id;
```

![](/images/3/2/1/c/0006a.png?width=80pc)

    {{% /expand %}}


    {{% expand "For SQL Server Source expand this" %}}
Within PGAdmin, click on the **Tools** menu, and choose **Query Tool**. 

![](/images/3/2/1/c/0007a.png?width=80pc)

Next, click the open file button as shown below If you used classic SCT then paste something like **"C:\Users\Administrator\AWS Schema Conversion Tool\Projects"** into the path window hit enter/click then select the folder with the name you used for your project when setting up SCT such as AWS Schema Conversion Tool SQL Server to Aurora PostgreSQL or Project 1, then select Amazon Aurora sub folder then select the drop foreign key constraints file similar to the screen shot below

![](/images/3/2/1/c/0007b.png?width=80pc)

If you used the in console SC to convert schema, you'll need to go in pgadmin and manually drop the foreign keys from the following tables manually - **_player, seat, sport_division, sport_league, sport_team, sporting_event, sporting_event_ticket & ticket_purchase_hist_**. The reason for this is SC generates a unique key on the end of FK when SQL Server is source and PG is target and SC doesn't generate the drop FK script as of this time.

Next, in the popup window, you should see a list of files similar to the last step in the Schema Convert module if not the project folder may need to be adjusted, select the drop foreign key constraints file similar to screen shot below

![](/images/3/2/1/c/0007c.png?width=80pc)

Next, if necessary Copy the content to pgAdmin query editor and adjust for your schema name with a search and replace.

Next, execute the script. You should see either a successful alter table/drop constraint or skipping constraint doesn't exist both are fine. Note if you'd like you can go check one of the tables like player and confirm there are not any constraints there but not required.

![](/images/3/2/1/c/0007d.png?width=80pc)

    {{% /expand %}}