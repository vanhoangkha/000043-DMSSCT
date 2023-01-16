+++
title = "Cấu hình Database Đích"
date = 2020
weight = 3
chapter = false
pre = "<b>2.2.3. </b>"
+++

**Nội dung**
- [Cấu hình Database Đích](#cấu-hình-database-đích)

---

#### Cấu hình Database Đích

{{% notice info %}}
Trong quá trình chạy full load, AWS DMS không tải bảng theo bất kỳ thứ tự cụ thể nào, vì vậy nó có thể tải dữ liệu bảng con trước dữ liệu bảng mẹ. Do đó, các ràng buộc khóa ngoại có thể bị vi phạm nếu chúng được kích hoạt. Ngoài ra, nếu trình kích hoạt xuất hiện trên cơ sở dữ liệu đích, chúng có thể thay đổi dữ liệu được AWS DMS tải theo những cách không mong muốn. Để khắc phục điều này, chúng ta nên loại bỏ các ràng buộc trên cơ sở dữ liệu đích.
{{% /notice %}}

1. Mở **pgAdmin 4** từ **Taskbar** trên **máy chủ EC2**.

![Target Database](/images/2/31.png?width=90pc)

2. Bạn có thể được nhắc đặt một **Master Password**. Nhập `pgadmin`, và chọn **OK**.

![Target Database](/images/2/32.png?width=90pc)

3. Chọn vào **Add New Server** và nhập các giá trị sau. Sau đó chọn **Save**.

|            Thông số             |               Giá trị              |
|:-------------------------------:|:----------------------------------:|
| General -> Name                 | Target Aurora RDS (PostgreSQL)     |
| Connection -> Host Name/Address | < TargetAuroraPostgreSQLEndpoint > |
| Connection -> Port              | 5432                               |
| Connection -> Username          | dbmaster                           |
| Connection -> Password          | dbmaster123                        |
| Connection -> Save Password     | Check                              |

![Target Database](/images/2/33a.png?width=90pc)
![Target Database](/images/2/33.png?width=90pc)

4. Chuột phải vào **CSDL AuroraDB** ở menu bên trái, và chọn **Query Tool**.

![Target Database](/images/2/34.png?width=90pc)

5. Trong bước này, bạn sẽ loại bỏ ràng buộc khóa ngoại khỏi cơ sở dữ liệu đích:

{{%attachments title="Tập tin SQL" pattern=".*(sql)"/%}}

   1. Mở tập tin [**DropConstraintsPostgreSQL.sql**](https://dms-immersionday.workshop.aws/code/DropConstraintsPostgreSQL.sql) bằng trình soạn thảo văn bản.
   2. Sao chép nội dung của tập tin vào **Query Editor** trong **pgAdmin 4**.
   3. **Thực thi** lệnh.

![Target Database](/images/2/35.png?width=90pc)
