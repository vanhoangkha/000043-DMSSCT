---
title: "Resolution"
weight: 3
chapter: false
pre: "<b> 6.2.3. </b>"
---

Now when we know the root cause of failure, resolution is easy part in this scenario. To resolve the **duplicate key violation** so you can reload the data from source database, you will require to connect to target database and truncate all tables which are in the **Error** state.

```sql
truncate table dms_sample.sport_location;
truncate table dms_sample.sport_division;
truncate table dms_sample.sport_league;
truncate table dms_sample.sport_type;
truncate table dms_sample.sporting_event;
truncate table dms_sample.sporting_event_ticket;
truncate table dms_sample.sport_team;
truncate table dms_sample.seat_type;
truncate table dms_sample.seat;
truncate table dms_sample.player;
truncate table dms_sample.name_data;
```

Alternatively, you can also modify DMS task setting **TargetTablePrepMode** from **DO_NOTHING** to **TRUNCATE_BEFORE_LOAD**. This way, DMS can truncate the target table before loading the data.