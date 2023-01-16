+++
title = "Chuyển đổi Schema"
date = 2020
weight = 4
chapter = false
pre = "<b>2.1.4. </b>"
+++

**Nội dung**
- [Chuyển đổi Schema](#chuyển-đổi-schema)

---

#### Chuyển đổi Schema

1. Chọn chuột phải vào schema `DMS_SAMPLE` ở nguồn Oracle, sau đó chọn **Convert Schema** để sinh ra các data definition language (DDL) statement cho CSDL đích.

Bạn có thể xem các DDL được sinh ra từ cửa sổ Project, và thay đổi chúng trước khi áp dụng lên CSDL đích. Bạn cũng có thể chọn lưu lại chúng dưới dạng .sql cho các ứng dụng sau này.

{{% notice warning %}}
Bạn có thể sẽ nhận được hộp thoại thông báo **"Object may already exist in the target database, replace?"**. Chọn **Yes** và quá trình chuyển đổi sẽ được chạy. 
{{% /notice %}}

![Convert](/images/2/14.png?width=90pc)
![Convert](/images/2/14a.png?width=90pc)
AWS SCT phân tích schema và tạo báo cáo đánh giá di chuyển cơ sở dữ liệu cho việc chuyển đổi sang PostgreSQL. Các mục có dấu chấm than màu đỏ bên cạnh không thể được dịch trực tiếp từ nguồn sang đích. Điều này bao gồm Procedure, và Package đang lưu trữ.

2. Chọn vào **Main View** và chọn **Assessment Report view**.

![Convert](/images/2/15.png?width=90pc)

3. Đi đến mục **Action Items** trong báo cáo để xem các mục mà công cụ không thể chuyển đổi và tìm hiểu mức độ thay đổi thủ công bạn cần thực hiện.

![Convert](/images/2/16.png?width=90pc)
Kiểm tra từng vấn đề được liệt kê và so sánh nội dung trong bảng Oracle nguồn và bảng Aurora PostgreSQL đích. Các vấn đề đã được giải quyết chưa? Và làm thế nào?

AWS SCT phân tích schema và tạo báo cáo đánh giá di chuyển cơ sở dữ liệu cho việc chuyển đổi sang PostgreSQL. Các mục có dấu chấm than màu đỏ bên cạnh không thể được dịch trực tiếp từ nguồn sang đích. Điều này bao gồm Procedure, và Package đang lưu trữ. Bạn cần sửa đổi thủ công các đối tượng này để làm cho chúng tương thích với cơ sở dữ liệu đích. Bạn có thể hoàn thành một trong các tác vụ sau để khắc phục sự cố:

```text
1. Sửa đổi các đối tượng trên cơ sở dữ liệu Oracle nguồn để AWS SCT có thể chuyển đổi các đối tượng sang cơ sở dữ liệu Aurora PostgreSQL đích.\
2. Thay vì sửa đổi đối tượng cơ sở dữ liệu Oracle nguồn, hãy sửa đổi các tập lệnh mà AWS SCT tạo trước khi áp dụng các tập lệnh trên cơ sở dữ liệu Aurora PostgreSQL đích.
```

Vì thời gian, chúng ta bỏ qua việc sửa đổi tất cả các đối tượng mà AWS SCT đã đánh dấu là không thể tự động chuyển đổi. Thay vào đó, để làm ví dụ, chúng ta sẽ sửa đổi thủ công procedure `GENERATESEATS` và `GENERATE_TICKETS`  trong SCT để làm cho chúng tương thích với cơ sở dữ liệu mục tiêu.

Nếu bạn chọn vào procedure `GENERATESEATS` và `GENERATE_TICKETS`, bạn sẽ thấy rằng SCT không thể tự động chuyển đổi mã vì **APPEND Hint** không được hỗ trợ trong PostgreSQL.

4. Chọn vào procedure `GENERATESEATS` và xóa đi `/*+ APPEND */` ở lệnh `INSERT`.

![Convert](/images/2/17.png?width=90pc)

5. Tương tự với procedure `GENERATE_TICKETS` và xóa đi `/*+ APPEND */` ở lệnh `INSERT`.

![Convert](/images/2/17a.png?width=90pc)

6. Chọn chuột phải vào schema `dms_sample` ở bảng bên trái và chọn **Create report**.

![Convert](/images/2/18.png?width=90pc)

7. Lưu ý rằng tất cả các đối tượng đã sửa đổi bây giờ đều tương thích với ngôn ngữ cơ sở dữ liệu đích.

![Convert](/images/2/19.png?width=90pc)

8. Chọn chuột phải vào schema `dms_sample` ở bảng bên trái và chọn **Convert Schema**.

![Convert](/images/2/20.png?width=90pc)

9. Bạn có thể được thông báo bằng một hộp thoại **"Object may already exist in the target database, replace?"**. Chọn **Yes**.

![Convert](/images/2/21.png?width=90pc)

10. Chọn chuột phải vào schema `dms_sample` ở bảng bên phải và chọn **Apply to database**.

![Convert](/images/2/22.png?width=90pc)

11. Khi được nhắc nếu bạn muốn áp dụng schema cho cơ sở dữ liệu, hãy bấm **Yes**.

![Convert](/images/2/23.png?width=90pc)

12. Lúc này, schema đã được áp dụng cho cơ sở dữ liệu đích. Mở rộng schema `dms_sample` để thấy các bảng.

![Convert](/images/2/24.png?width=90pc)

{{% notice note %}}
Bạn có thể thấy dấu chấm than trên các đối tượng cơ sở dữ liệu nhất định như indexes, và foreign key constraints. Trong phần tiếp theo, chúng ta sẽ xóa bỏ các khóa ngoại ở cơ sở dữ liệu đích.
{{% /notice %}}

Bạn đã chuyển đổi thành công schema cơ sở dữ liệu và đối tượng từ Oracle sang định dạng tương thích với Amazon Aurora (PostgreSQL).

Phần này cho thấy việc di chuyển schema của cơ sở dữ liệu Oracle sang Amazon Aurora (PostgreSQL) dễ dàng như thế nào bằng cách sử dụng AWS Schema Conversion Tool. Tương tự, bạn đã học cách AWS Schema Conversion Tool nêu bật sự khác biệt giữa các ngôn ngữ của database engine khác nhau và cung cấp cho bạn các mẹo về cách bạn có thể sửa đổi mã khi cần để di chuyển procedure và các đối tượng cơ sở dữ liệu khác.

Các bước tương tự có thể được thực hiện để di chuyển SQL Server và Oracle sang các database engine RDS khác bao gồm PostgreSQL và MySQL.

Phần tiếp theo mô tả các bước cần thiết để di chuyển dữ liệu thực tế bằng AWS DMS.
