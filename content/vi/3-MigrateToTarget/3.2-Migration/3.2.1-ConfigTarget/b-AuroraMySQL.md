---
title: "Aurora (MySQL compatible) target"
weight: 2
chapter: false
pre: "<b> b. </b>"
---

1. Mở MySQL Workbench 8.0 CE đã sử dụng trước đó để thêm các quyền cần thiết cho Aurora MySQL làm mục tiêu DMS.

    ![](/images/3/2/1/b/0001.png?width=80pc)

1. Trong bước này, bạn sẽ xóa ràng buộc khóa ngoại khỏi cơ sở dữ liệu đích:

1. Từ bên trong MySQL Workbench, mở cửa sổ truy vấn và sao chép và dán mã bên dưới vào cửa sổ truy vấn rồi thực thi.

    _**Lưu ý:** Bạn chỉ cần mở rộng các phần hướng dẫn cho CSDL nguồn bạn đã chọn và có thể bỏ qua các phần cho CSDL khác._

    {{% expand "Mở phần này nếu CSDL nguồn của bạn là Oracle" %}}
```sql
drop index set_seat_idx on dms_sample.sporting_event_ticket;
drop index set_ticketholder_idx on dms_sample.sporting_event_ticket;
drop index set_sporting_event_idx on  dms_sample.sporting_event_ticket;
```
    {{% /expand %}}


    {{% expand "Mở phần này nếu CSDL nguồn của bạn là  Microsoft SQL Server" %}}
```sql
ALTER TABLE dms_sample_dbo.player
DROP FOREIGN KEY sport_team_fk;

ALTER TABLE dms_sample_dbo.seat
DROP FOREIGN KEY seat_type_fk;

ALTER TABLE dms_sample_dbo.seat
DROP FOREIGN KEY s_sport_location_fk;

ALTER TABLE dms_sample_dbo.sport_division
DROP FOREIGN KEY sd_sport_type_fk;

ALTER TABLE dms_sample_dbo.sport_division 
DROP FOREIGN KEY sd_sport_league_fk;

ALTER TABLE dms_sample_dbo.sport_league
DROP FOREIGN KEY sl_sport_type_fk;

ALTER TABLE dms_sample_dbo.sport_team 
DROP FOREIGN KEY st_sport_type_fk;

ALTER TABLE dms_sample_dbo.sport_team 
DROP FOREIGN KEY home_field_fk;

ALTER TABLE dms_sample_dbo.sporting_event
DROP FOREIGN KEY se_sport_type_fk;

ALTER TABLE dms_sample_dbo.sporting_event 
DROP FOREIGN KEY se_away_team_id_fk;

ALTER TABLE dms_sample_dbo.sporting_event 
DROP FOREIGN KEY se_home_team_id_fk;

ALTER TABLE dms_sample_dbo.sporting_event
DROP FOREIGN KEY se_location_id_fk;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
DROP FOREIGN KEY set_person_id;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
DROP FOREIGN KEY set_sporting_event_fk;

ALTER TABLE dms_sample_dbo.sporting_event_ticket
DROP FOREIGN KEY set_seat_fk;

ALTER TABLE dms_sample_dbo.ticket_purchase_hist 
DROP FOREIGN KEY tph_sport_event_tic_id;

ALTER TABLE dms_sample_dbo.ticket_purchase_hist 
DROP FOREIGN KEY tph_ticketholder_id;

ALTER TABLE dms_sample_dbo.ticket_purchase_hist 
DROP FOREIGN KEY tph_transfer_from_id;

drop index set_ev_id_tkholder_id_idx on dms_sample_dbo.sporting_event_ticket;
drop index set_seat_idx on dms_sample_dbo.sporting_event_ticket;
drop index set_ticketholder_idx on dms_sample_dbo.sporting_event_ticket;
drop index set_sporting_event_idx on  dms_sample_dbo.sporting_event_ticket;
```
    {{% /expand %}}

1. **Thực thi** tập lệnh truy vấn (nhấp vào biểu tượng tia sét). Kết quả sẽ trông tương tự như cửa sổ bên dưới.

    ![](/images/3/2/1/b/0002.png?width=80pc)
