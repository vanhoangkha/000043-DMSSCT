---
title: "Chuyển đổi lược đồ"
weight: 3
chapter: false
pre: "<b> 3.1.3. </b>"
---

Bây giờ bạn đã tạo một Dự án di chuyển cơ sở dữ liệu mới, bước tiếp theo là chuyển đổi lược đồ của cơ sở dữ liệu nguồn sang Amazon Aurora MYSQL.

1. Nhấp vào lược đồ **_DMS_SAMPLE_** từ nguồn ở phía bên trái màn hình

    {{% expand ">> Đối với nguồn Oracle, mở phần này" %}}

![Đánh giá Oracle](/images/3/1/3/0001.png?width=80pc)

    {{% /expand %}}

    {{% expand ">> Đối với nguồn SQL Server, mở phần này" %}}

![Đánh giá Oracle](/images/3/1/3/0002.png?width=80pc)

    {{% /expand %}}

AWS SCT phân tích lược đồ và tạo báo cáo đánh giá di chuyển cơ sở dữ liệu để chuyển đổi sang PostgreSQL. Các mục có dấu chấm than màu đỏ bên cạnh không thể được dịch trực tiếp từ nguồn sang đích. Điều này bao gồm Quy trình được lưu trữ và Gói.

1. Nhấp vào nút View và chọn chế độ xem **Assessment Report**.

Đối với nguồn Oracle, nó sẽ trông như thế này

![Oracle evaluation](/images/3/1/3/0002-1.png?width=80pc)

SQL Server sẽ trông tương tự chỉ với SQL Server source ở bên trái màn hình và hệ thống phân cấp cơ sở dữ liệu SQL Server thay vì Oracle. Bạn sẽ muốn nhấp vào dms_sample trong MS SQL Server

1. Tiếp theo, điều hướng đến tab **Action Items** trong báo cáo để xem các mục mà công cụ không thể chuyển đổi và tìm hiểu xem bạn cần thực hiện bao nhiêu thay đổi thủ công.

Đối với nguồn MS SQL Server, nó sẽ trông như sau:

![Oracle Action](/images/3/1/3/0002.png?width=80pc)

Đối với nguồn Oracle, nó sẽ trông như sau:

![MSSQL Action](/images/3/1/3/0003.png?width=80pc)

AWS SCT phân tích lược đồ và tạo báo cáo đánh giá di chuyển cơ sở dữ liệu để chuyển đổi sang Aurora MySQL. Các mục có dấu màu xanh lam bên cạnh không thể được dịch trực tiếp từ nguồn sang đích. Các mục màu xanh lá cây sẽ được dịch từ nguồn sang đích. Trong trường hợp này, điều này bao gồm các quy trình được lưu trữ. Đối với mỗi sự cố chuyển đổi, bạn có thể hoàn thành một trong các hành động sau:

1. Sửa đổi các đối tượng trên cơ sở dữ liệu nguồn để AWS SCT có thể chuyển đổi các đối tượng sang cơ sở dữ liệu Aurora MySQL đích.

2. Thay vì sửa đổi lược đồ nguồn, hãy sửa đổi các tập lệnh mà AWS SCT tạo ra trước khi áp dụng các tập lệnh trên cơ sở dữ liệu Aurora MySQL đích.

Tuy nhiên, để tiết kiệm thời gian, chúng ta bỏ qua việc sửa đổi tất cả các đối tượng không thể tự động chuyển đổi. Thay vào đó, ví dụ, bạn sẽ sửa đổi thủ công một trong các quy trình được lưu trữ từ bên trong SCT để làm cho nó tương thích với cơ sở dữ liệu đích.

Điều này được chứng minh trong [tiểu mục này](./ModifyCode).

1. Nhấp vào `**dms_sample**` cho lược đồ Oracle hoặc dbo cho SQL Server trong bảng điều khiển bên trái và nhấp vào **Convert Schema** (Chuyển đổi lược đồ).
Đối với Oracle, nó sẽ trông giống như bên dưới và đối với các cơ sở dữ liệu khác thì tương tự ngoại trừ tên cơ sở dữ liệu ở trên cùng và hệ thống phân cấp của nó ở bên trái

![Hành động MSSQL](/images/3/1/3/0004.png?width=80pc)

1. Bạn có thể được nhắc bằng hộp thoại **“Object may already exist in the target database, replace?”** (Đối tượng có thể đã tồn tại trong cơ sở dữ liệu đích, thay thế ?) Chọn **Yes**.

![Hành động MSSQL](/images/3/1/3/0005.png?width=80pc)

1. Nhấp chuột phải vào lược đồ **_dms_sample_dbo_** (SQL Sever) hoặc **dms_sample** (các DB khác) trong bảng bên phải và nhấp vào **Áp dụng cho cơ sở dữ liệu**.

{{% expand ">> Đối với nguồn Oracle, mở phân này" %}}

![Hành động MSSQL](/images/3/1/3/0006-a.png?width=80pc)

{{% /expand %}}

{{% expand ">> Đối với nguồn SQL Server, mở phân này" %}}

![Hành động MSSQL](/images/3/1/3/0006-b.png?width=80pc)

{{% /expand %}}

1. Khi được nhắc nếu bạn muốn áp dụng lược đồ cho cơ sở dữ liệu, hãy nhấp vào **Có**.

{{% notice note %}}
Bạn có thể thấy dấu chấm than trên một số đối tượng cơ sở dữ liệu như chỉ mục và ràng buộc khóa ngoại. Trong phần tiếp theo, chúng ta sẽ xóa cơ sở dữ liệu mục tiêu khóa ngoại.
{{% /notice %}}

1. Tại thời điểm này, lược đồ đã được áp dụng cho cơ sở dữ liệu mục tiêu. Mở rộng lược đồ **_dms_sample_dbo_** hoặc **_dms_sample_** trên ngăn bên phải để xem các bảng, chế độ xem, quy trình, v.v. _**Lưu ý:** Nếu bạn dùng hệ CSDL MS SQL Server, hãy mở và làm theo đoạn bên dưới vì một số có các bước bổ sung cụ thể là SQL Server yêu cầu các bước bổ sung._

    {{% expand ">> Đối với nguồn SQL Server, hãy mở phần này" %}}

1. Để chuẩn bị cho các bước sau này, chúng ta sẽ cần tạo tập lệnh sql cho các ràng buộc mà chúng ta vừa thêm vào mục tiêu. Để thực hiện việc này, trước tiên chúng ta muốn thay đổi cài đặt dự án từ menu **Cài đặt** ở trên cùng và chọn **Cài đặt dự án** như được hiển thị bên dưới.
![MSSQL Extra](/images/3/1/3/0007.png?width=80pc)

2. Chọn **Lưu tập lệnh** từ menu bên trái rồi chọn **Aurora Postgresql** từ menu thả xuống trên cùng cho **Nhà cung cấp** và chọn **Tệp đơn** cho mỗi **Giai đoạn** trong menu thả xuống thứ hai như hiển thị bên dưới.

![MSSQL Extra](/images/3/1/3/0008.png?width=80pc)

3. Bây giờ, hãy nhấp vào mục tiêu Aurora Postgresql bên phải màn hình của bạn để **_dms_sample_dbo_** được tô sáng và nhấp chuột phải để menu bật lên hiển thị và chọn **Lưu dưới dạng SQL** như hiển thị bên dưới.

![MSSQL Extra](/images/3/1/3/0009.png?width=80pc)

4. Chọn thư mục dự án và lưu các tệp. Để cửa sổ này mở vì bạn sẽ cần quay lại sau. Nó sẽ trông giống như bên dưới nhưng lưu ý rằng mọi thứ thay đổi khá nhanh ở đây nên nếu không khớp chính xác thì cũng không sao.

![MSSQL Extra](/images/3/1/3/0010.png?width=80pc)

    {{% /expand %}}

Bạn đã chuyển đổi thành công lược đồ cơ sở dữ liệu và đối tượng từ nguồn sang Amazon Aurora.

Phần này chứng minh việc di chuyển lược đồ của cơ sở dữ liệu nguồn sang Amazon Aurora PostgreSQL dễ dàng thế nào nhờ Schema Conversion Tool (công cụ chuyển đổi lược đồ). Tương tự như vậy, bạn đã tìm hiểu cách Công cụ chuyển đổi lược đồ làm nổi bật sự khác biệt giữa các phương ngữ công cụ cơ sở dữ liệu khác nhau và cung cấp cho bạn các mẹo về cách bạn có thể sửa đổi mã thành công khi cần di chuyển thủ tục và các đối tượng cơ sở dữ liệu khác.