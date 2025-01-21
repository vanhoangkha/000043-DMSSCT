---
title: "Aurora (PostgresSQL compatible) target"
weight: 3
chapter: false
pre: "<b> c. </b>"
---

1. Mở pgAdmin từ trong thanh tác vụ máy chủ EC2 ở cuối màn hình (tìm con voi), và nhấp vào đó/mở nó. Đóng cảnh báo về phiên bản pgAdmin mới nếu nó bật lên. Lưu ý thứ tự các biểu tượng trên phiên bản của bạn có thể khác với hình ảnh bên dưới.

    ![](/images/3/2/1/c/0001.png?width=40pc)

1. Nhấp vào nút **Thêm máy chủ > Máy chủ mới** hoặc trên máy chủ Word trong ngăn bên trái, sau đó nhấp chuột phải và tô sáng Register, sau đó tô sáng Server và tạo kết nối cơ sở dữ liệu mới cho cơ sở dữ liệu Aurora PostgreSQL mục tiêu bằng các giá trị sau. Bạn sẽ cần hoàn thành tab General và tab Connection riêng biệt. Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần vào Secrets Manager và mở DMSDBSecret và hiển thị mật khẩu. Nó cũng nằm trên tab **Output** của Cloudformation Stack thuộc bài thực hành:

    ![](/images/3/2/1/c/0002.png?width=80pc)

    |  Tham số	 |  Giá trị  |
    |---------------|-------------|
    |  General -> Name	 |  Target Aurora RDS (PostgreSQL)  |
    |  Connection -> Host Name/Address	 |  < TargetAuroraPostgreSQLEndpoint > bạn có thể tìm thấy điều này trên **Cloudformation > stack > tab đầu ra** hoặc bạn có thể vào RDS trong bảng điều khiển AWS và tìm máy CSDL đích Postgresql  |
    |  Connection -> Port	 |  5432  |
    |  Connection -> Maintenance Database	 |  AuroraDB  |
    |  Connection -> Username	 |  dbadmin  |
    |  Connection -> Password	 |  See **Cloudformation Output** tab & **_DMSDBSecretP_** or look it up in AWS Secrets Manager for Postgresql  |
    |  Connection -> Save Password	 |  Check or **turn on/slide on**  |

    ![](/images/3/2/1/c/0003.png?width=80pc)

    ![](/images/3/2/1/c/0004.png?width=80pc)

    Sau đó, bạn có thể nhấp vào **Save** và nó sẽ kết nối bạn.

1. Nhấp chuột phải vào cơ sở dữ liệu **AuroraDB** từ menu bên trái, sau đó chọn **Query Tool** (Công cụ truy vấn). _**Lưu ý:** bạn có thể nhấp vào danh sách các đối tượng ở bên trái để xem các bảng đã chuyển đổi nếu muốn nhưng không bắt buộc._

    ![](/images/3/2/1/c/0005.png?width=80pc)

1. Trong bước này, bạn sẽ xóa ràng buộc khóa ngoại khỏi cơ sở dữ liệu mục tiêu để tải đầy đủ xảy ra vì DMS không nhận biết được các ràng buộc:

1. Trong bước này, bạn sẽ xóa ràng buộc khóa ngoại khỏi cơ sở dữ liệu mục tiêu. Bước này thay đổi tùy theo cơ sở dữ liệu nguồn, vì vậy hãy tìm cơ sở dữ liệu nguồn của bạn bên dưới và làm theo các bước một cách phù hợp. Lưu ý rằng bạn không cần chạy các tập lệnh cho các nguồn mà bạn không chọn trước đó:

    {{% expand "For Oracle Source expand this" %}}
Sao chép nội dung của mã sql bên dưới và dán vào trình chỉnh sửa truy vấn trong **pgAdmin** và thực thi tập lệnh. (lưu ý rằng có một nút sao chép ở góc bên phải để sao chép đoạn mã truy vấn)

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


    {{% expand "Mở phần này nếu bạn sử dụng nguồn dạng MS SQL Server" %}}
Trong PGAdmin, nhấp vào menu **Tools** (Công cụ) và chọn **Query Tool** (Công cụ truy vấn).

![](/images/3/2/1/c/0007a.png?width=80pc)

Tiếp theo, nhấp vào nút mở tệp như hiển thị bên dưới Nếu bạn sử dụng SCT cổ điển thì hãy dán nội dung tương tự như **"C:\Users\Administrator\AWS Schema Conversion Tool\Projects"** vào cửa sổ đường dẫn, nhấn enter/nhấp rồi chọn thư mục có tên bạn đã sử dụng cho dự án của mình khi thiết lập SCT như AWS Schema Conversion Tool SQL Server to Aurora PostgreSQL hoặc Project 1, sau đó chọn thư mục con Amazon Aurora rồi chọn tệp ràng buộc khóa ngoại thả tương tự như ảnh chụp màn hình bên dưới

![](/images/3/2/1/c/0007b.png?width=80pc)

Nếu bạn sử dụng SC trong bảng điều khiển để chuyển đổi lược đồ, bạn sẽ cần vào pgadmin và xóa thủ công các khóa ngoại khỏi các bảng sau theo cách thủ công - **_player, seat, sport_division, sport_league, sport_team, sporting_event, sporting_event_ticket & ticket_purchase_hist_**. Lý do cho việc này là SC tạo một khóa duy nhất ở cuối FK khi SQL Server là nguồn và PG là mục tiêu và SC không tạo tập lệnh xóa FK vào thời điểm này.

Tiếp theo, trong cửa sổ bật lên, bạn sẽ thấy danh sách các tệp tương tự như bước cuối cùng trong mô-đun Schema Convert nếu không thư mục dự án có thể cần được điều chỉnh, hãy chọn tệp ràng buộc khóa ngoại thả tương tự như ảnh chụp màn hình bên dưới

![](/images/3/2/1/c/0007c.png?width=80pc)

Tiếp theo, nếu cần Sao chép nội dung vào trình soạn thảo truy vấn pgAdmin và điều chỉnh cho tên lược đồ của bạn bằng lệnh tìm kiếm và thay thế.

Tiếp theo, thực thi tập lệnh. Bạn sẽ thấy ràng buộc alter table/drop thành công hoặc ràng buộc skipping không tồn tại, cả hai đều ổn. Lưu ý nếu muốn, bạn có thể kiểm tra một trong các bảng như player và xác nhận không có ràng buộc nào ở đó nhưng không bắt buộc.

![](/images/3/2/1/c/0007d.png?width=80pc)

    {{% /expand %}}