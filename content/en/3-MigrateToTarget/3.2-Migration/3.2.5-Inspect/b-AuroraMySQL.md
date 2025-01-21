---
title: "Aurora (MySQL compatible) target"
weight: 2
chapter: false
pre: "<b> b. </b>"
---

In this page, you will inspect the target database after migration.

1. Open **MySQL Workbench 8.0 CE** from within the EC2 server, and click on Target Aurora RDS (MySQL) database connection that you created earlier.

1. Inspect the migrated data, by querying one of the tables in the target database. For example, the following query should return a table with two rows:

    _**Note:** expand only for the source in your scenario you can skip the other sources._

    {{% expand "For Oracle Source expand this" %}}
```sql
SELECT *
FROM dms_sample.sport_type;
```

![](/images/3/2/5/b/0001.png?width=80pc)

    {{% /expand %}}

    {{% expand "For SQL Server Source expand this" %}}
```sql
SELECT *
FROM dms_sample_dbo.sport_type;
```
    {{% /expand %}}

    {{% notice info %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
    {{% /notice %}}

1. Before running the next script block we will need to change preferences in MySQL Workbench. Go to Edit from menu then Preferences then SQL Editor and increase DBMS Connection read and timeout settings to 600 vs. defaults like below


1. Now, disconnect your MySql workbench & reconnect to ensure the preference changes take effect. To do this click the X on the MySQL Target tab besides the home icon upper left then double click on the MySQL Target connection box to reconnect

1. Use the following script that matches your source database selected to enable the foreign key constraints that we dropped earlier. Within MySQL Workbench, copy and paste the sql below and execute it.

    _**Note:** this will take a long time to complete you can move onto the next step while it is running. If errors occur they can be ignored or resolved later._

    {{% expand "For Oracle Source expand this" %}}
```sql
USE dms_sample;

ALTER TABLE dms_sample.player
ADD CONSTRAINT sport_team_fk FOREIGN KEY (sport_team_id) 
REFERENCES dms_sample.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.seat
ADD CONSTRAINT seat_type_fk FOREIGN KEY (seat_type) 
REFERENCES dms_sample.seat_type (name)
ON DELETE CASCADE;

/*  FK is incompatible in Oracle 
ALTER TABLE dms_sample.seat
ADD CONSTRAINT s_sport_location_fk FOREIGN KEY (sport_location_id) 
REFERENCES dms_sample.sport_location (id)
ON DELETE CASCADE;
*/ 
ALTER TABLE dms_sample.sport_division
ADD CONSTRAINT sd_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_division
ADD CONSTRAINT sd_sport_league_fk FOREIGN KEY (sport_league_short_name) 
REFERENCES dms_sample.sport_league (short_name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_league
ADD CONSTRAINT sl_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name);

ALTER TABLE dms_sample.sport_team
ADD CONSTRAINT st_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_team
ADD CONSTRAINT home_field_fk FOREIGN KEY (home_field_id) 
REFERENCES dms_sample.sport_location (id)
ON DELETE CASCADE;
/*   table is too big for our lab time to add constraints back 
ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name);

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_away_team_id_fk FOREIGN KEY (away_team_id) 
REFERENCES dms_sample.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_home_team_id_fk FOREIGN KEY (home_team_id) 
REFERENCES dms_sample.sport_team (id);

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_location_id_fk FOREIGN KEY (location_id) 
REFERENCES dms_sample.sport_location (id);

ALTER TABLE dms_sample.sporting_event_ticket
ADD  CONSTRAINT set_person_id FOREIGN KEY(ticketholder_id)
REFERENCES dms_sample.person (ID)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event_ticket
ADD CONSTRAINT set_sporting_event_fk FOREIGN KEY (sporting_event_id) 
REFERENCES dms_sample.sporting_event (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event_ticket
ADD CONSTRAINT set_seat_fk FOREIGN KEY (sport_location_id, seat_level, seat_section, seat_row, seat) 
REFERENCES dms_sample.seat (sport_location_id, seat_level, seat_section, seat_row, seat);
*/
ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_sport_event_tic_id FOREIGN KEY (sporting_event_ticket_id) 
REFERENCES dms_sample.sporting_event_ticket (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_ticketholder_id FOREIGN KEY (purchased_by_id) 
REFERENCES dms_sample.person (ID);

ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_transfer_from_id FOREIGN KEY (transferred_from_id) 
REFERENCES dms_sample.person (ID);

/*
--- these will time out in mysql workbench unless you select Edit > Preferences > SQL Editor
---     and change DBS timeout settings to all be 600 seconds vs. 30 / 60 
---     Note these aren't required but here for reference since we dropped them for load speed
---create index set_ev_id_tkholder_id_idx on dms_sample_dbo.sporting_event_ticket (sporting_event_id,ticketholder_id);
---create index set_seat_idx on dms_sample_dbo.sporting_event_ticket (sport_location_id,seat_level,seat_section,seat_row,seat);
---create index set_ticketholder_idx on dms_sample_dbo.sporting_event_ticket (ticketholder_id); 
---CREATE INDEX set_sporting_event_idx ON dms_sample_dbo.sporting_event_ticket (sporting_event_id);
*/

```
    {{% /expand %}}

    {{% expand "For SQL Server Source expand this" %}}
```sql
USE dms_sample_dbo;

ALTER TABLE dms_sample_dbo.player
ADD CONSTRAINT sport_team_fk FOREIGN KEY (sport_team_id) 
REFERENCES dms_sample_dbo.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.seat
ADD CONSTRAINT seat_type_fk FOREIGN KEY (seat_type) 
REFERENCES dms_sample_dbo.seat_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.seat
ADD CONSTRAINT s_sport_location_fk FOREIGN KEY (sport_location_id) 
REFERENCES dms_sample_dbo.sport_location (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_division
ADD CONSTRAINT sd_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_division
ADD CONSTRAINT sd_sport_league_fk FOREIGN KEY (sport_league_short_name) 
REFERENCES dms_sample_dbo.sport_league (short_name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_league
ADD CONSTRAINT sl_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name);

ALTER TABLE dms_sample_dbo.sport_team
ADD CONSTRAINT st_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_team
ADD CONSTRAINT home_field_fk FOREIGN KEY (home_field_id) 
REFERENCES dms_sample_dbo.sport_location (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_sport_type_fk FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name);

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_away_team_id_fk FOREIGN KEY (away_team_id) 
REFERENCES dms_sample_dbo.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_home_team_id_fk FOREIGN KEY (home_team_id) 
REFERENCES dms_sample_dbo.sport_team (id);

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_location_id_fk FOREIGN KEY (location_id) 
REFERENCES dms_sample_dbo.sport_location (id);

/*    commenting these out as they take too long to perform during our workshop 
--- these will time out in mysql workbench unless you select Edit > Preferences > SQL Editor
---     and change DBS timeout settings to all be 600 seconds vs. 30 / 60 
---     Note these aren't required but here for reference since we dropped them for load speed

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD  CONSTRAINT set_person_id FOREIGN KEY(ticketholder_id)
REFERENCES dms_sample_dbo.person (ID)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD CONSTRAINT set_sporting_event_fk FOREIGN KEY (sporting_event_id) 
REFERENCES dms_sample_dbo.sporting_event (id)
ON DELETE CASCADE;
*/

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD CONSTRAINT set_seat_fk FOREIGN KEY (sport_location_id, seat_level, seat_section, seat_row, seat) 
REFERENCES dms_sample_dbo.seat (sport_location_id, seat_level, seat_section, seat_row, seat);

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_sport_event_tic_id FOREIGN KEY (sporting_event_ticket_id) 
REFERENCES dms_sample_dbo.sporting_event_ticket (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_ticketholder_id FOREIGN KEY (purchased_by_id) 
REFERENCES dms_sample_dbo.person (ID);

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_transfer_from_id FOREIGN KEY (transferred_from_id) 
REFERENCES dms_sample_dbo.person (ID);
/*
--- these will time out in mysql workbench unless you select Edit > Preferences > SQL Editor
---     and change DBS timeout settings to all be 600 seconds vs. 30 / 60 
---     Note these aren't required but here for reference since we dropped them for load speed
---create index set_ev_id_tkholder_id_idx on dms_sample_dbo.sporting_event_ticket (sporting_event_id,ticketholder_id);
---create index set_seat_idx on dms_sample_dbo.sporting_event_ticket (sport_location_id,seat_level,seat_section,seat_row,seat);
---create index set_ticketholder_idx on dms_sample_dbo.sporting_event_ticket (ticketholder_id); 
---CREATE INDEX set_sporting_event_idx ON dms_sample_dbo.sporting_event_ticket (sporting_event_id);
*/
```
    {{% /expand %}}


1. Execute the script above for the source you selected

{{% notice info %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
{{% /notice %}}