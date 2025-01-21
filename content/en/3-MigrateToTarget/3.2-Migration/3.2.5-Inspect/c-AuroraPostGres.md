---
title: "Aurora (PostgresSQL compatible) target"
weight: 3
chapter: false
pre: "<b> c. </b>"
---

In this page, you will inspect the target database after migration.

1. Open **pgAdmin4** from within the EC2 server, and then connect to the Target Aurora RDS (PostgreSQL) database connection that you created earlier.

1. Inspect the migrated data, by querying one of the tables in the target database. For example, the following query should return a table with two rows:

    {{% expand "For Oracle Source expand this" %}}
```sql
SELECT *
FROM dms_sample.sport_type;
```

![](/images/3/2/5/c/0001.png?width=80pc)
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

1. Now, use the following script to enable the foreign key constraints that we dropped earlier. Copy the content of the file to the Query Editor in pgAdmin 4 then Execute the script. (note there's a copy button to right hand corner to copy the code block)

    {{% expand "For Oracle Source expand this" %}}
```sql
ALTER TABLE dms_sample.player
ADD CONSTRAINT sport_team_fk 
FOREIGN KEY (sport_team_id) 
REFERENCES dms_sample.sport_team(id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.seat
ADD CONSTRAINT seat_type_fk 
FOREIGN KEY (seat_type) 
REFERENCES dms_sample.seat_type(name)
ON DELETE CASCADE;

/*
 Skipping because of long wait time for the query to complete

 ALTER TABLE dms_sample.seat
 ALTER COLUMN sport_location_id TYPE numeric;

 ALTER TABLE dms_sample.seat
 ADD CONSTRAINT s_sport_location_fk 
 FOREIGN KEY (sport_location_id)
 REFERENCES dms_sample.sport_location(id)
 ON DELETE CASCADE;
*/

ALTER TABLE dms_sample.sport_division
ADD CONSTRAINT sd_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_division
ADD CONSTRAINT sd_sport_league_fk
FOREIGN KEY (sport_league_short_name) 
REFERENCES dms_sample.sport_league (short_name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_league
ADD CONSTRAINT sl_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name);

ALTER TABLE dms_sample.sport_team
ADD CONSTRAINT st_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sport_team
ADD CONSTRAINT home_field_fk 
FOREIGN KEY (home_field_id) 
REFERENCES dms_sample.sport_location (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample.sport_type (name);

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_away_team_id_fk 
FOREIGN KEY (away_team_id) 
REFERENCES dms_sample.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event
ADD CONSTRAINT se_home_team_id_fk 
FOREIGN KEY (home_team_id) 
REFERENCES dms_sample.sport_team (id);

ALTER TABLE dms_sample.sporting_event_ticket
ADD  CONSTRAINT set_person_id 
FOREIGN KEY(ticketholder_id)
REFERENCES dms_sample.person (ID)
ON DELETE CASCADE;

ALTER TABLE dms_sample.sporting_event_ticket
ADD CONSTRAINT set_sporting_event_fk 
FOREIGN KEY (sporting_event_id) 
REFERENCES dms_sample.sporting_event (id)
ON DELETE CASCADE;

/*
Skipping because of long wait time for the query to complete

ALTER TABLE dms_sample.sporting_event_ticket
ALTER COLUMN sport_location_id TYPE numeric;

ALTER TABLE dms_sample.sporting_event_ticket
ADD CONSTRAINT set_seat_fk 
FOREIGN KEY (sport_location_id, seat_level, seat_section, seat_row, seat) 
REFERENCES dms_sample.seat (sport_location_id, seat_level, seat_section, seat_row, seat);
*/

ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_sport_event_tic_id 
FOREIGN KEY (sporting_event_ticket_id) 
REFERENCES dms_sample.sporting_event_ticket (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_ticketholder_id 
FOREIGN KEY (purchased_by_id) 
REFERENCES dms_sample.person (ID);

ALTER TABLE dms_sample.ticket_purchase_hist
ADD CONSTRAINT tph_transfer_from_id 
FOREIGN KEY (transferred_from_id) 
REFERENCES dms_sample.person (ID);
```
    {{% /expand %}}

    {{% expand "For SQL Server Source expand this" %}}
```sql
ALTER TABLE dms_sample_dbo.player
ADD CONSTRAINT sport_team_fk 
FOREIGN KEY (sport_team_id) 
REFERENCES dms_sample_dbo.sport_team(id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.seat
ADD CONSTRAINT seat_type_fk 
FOREIGN KEY (seat_type) 
REFERENCES dms_sample_dbo.seat_type(name)
ON DELETE CASCADE;

/*
 Skipping because of long wait time for the query to complete

 ALTER TABLE dms_sample_dbo.seat
 ALTER COLUMN sport_location_id TYPE numeric;

 ALTER TABLE dms_sample_dbo.seat
 ADD CONSTRAINT s_sport_location_fk 
 FOREIGN KEY (sport_location_id)
 REFERENCES dms_sample_dbo.sport_location(id)
 ON DELETE CASCADE;
*/

ALTER TABLE dms_sample_dbo.sport_division
ADD CONSTRAINT sd_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_division
ADD CONSTRAINT sd_sport_league_fk
FOREIGN KEY (sport_league_short_name) 
REFERENCES dms_sample_dbo.sport_league (short_name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_league
ADD CONSTRAINT sl_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name);

ALTER TABLE dms_sample_dbo.sport_team
ADD CONSTRAINT st_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sport_team
ADD CONSTRAINT home_field_fk 
FOREIGN KEY (home_field_id) 
REFERENCES dms_sample_dbo.sport_location (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_sport_type_fk 
FOREIGN KEY (sport_type_name) 
REFERENCES dms_sample_dbo.sport_type (name);

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_away_team_id_fk 
FOREIGN KEY (away_team_id) 
REFERENCES dms_sample_dbo.sport_team (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event
ADD CONSTRAINT se_home_team_id_fk 
FOREIGN KEY (home_team_id) 
REFERENCES dms_sample_dbo.sport_team (id);

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD  CONSTRAINT set_person_id 
FOREIGN KEY(ticketholder_id)
REFERENCES dms_sample_dbo.person (ID)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD CONSTRAINT set_sporting_event_fk 
FOREIGN KEY (sporting_event_id) 
REFERENCES dms_sample_dbo.sporting_event (id)
ON DELETE CASCADE;

/*
Skipping because of long wait time for the query to complete

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ALTER COLUMN sport_location_id TYPE numeric;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
ADD CONSTRAINT set_seat_fk 
FOREIGN KEY (sport_location_id, seat_level, seat_section, seat_row, seat) 
REFERENCES dms_sample_dbo.seat (sport_location_id, seat_level, seat_section, seat_row, seat);
*/

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_sport_event_tic_id 
FOREIGN KEY (sporting_event_ticket_id) 
REFERENCES dms_sample_dbo.sporting_event_ticket (id)
ON DELETE CASCADE;

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_ticketholder_id 
FOREIGN KEY (purchased_by_id) 
REFERENCES dms_sample_dbo.person (ID);

ALTER TABLE dms_sample_dbo.ticket_purchase_hist
ADD CONSTRAINT tph_transfer_from_id 
FOREIGN KEY (transferred_from_id) 
REFERENCES dms_sample_dbo.person (ID);
```
    {{% /expand %}}

1. You should see a query returned successfully window

{{% notice info %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
{{% /notice %}}