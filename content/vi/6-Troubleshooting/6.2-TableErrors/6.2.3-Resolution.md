---
title: "Giải pháp"
weight: 3
chapter: false
pre: "<b> 6.2.3. </b>"
---

Bây giờ khi chúng ta biết nguyên nhân gốc rễ của lỗi, giải pháp là phần dễ dàng trong tình huống này. Để giải quyết **duplicate key violation (vi phạm khóa trùng lặp)** để bạn có thể tải lại dữ liệu từ cơ sở dữ liệu nguồn, bạn sẽ cần kết nối với cơ sở dữ liệu đích và cắt bớt tất cả các bảng đang ở trạng thái **Lỗi**.

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

Ngoài ra, bạn cũng có thể sửa đổi cài đặt tác vụ DMS **TargetTablePrepMode** từ **DO_NOTHING** thành **TRUNCATE_BEFORE_LOAD**. Theo cách này, DMS có thể cắt bớt bảng mục tiêu trước khi tải dữ liệu.