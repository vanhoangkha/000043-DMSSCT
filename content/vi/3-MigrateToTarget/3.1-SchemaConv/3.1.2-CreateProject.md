---
title: "Tạo dự án trong SCT"
weight: 2
chapter: false
pre: "<b> 3.1.2. </b>"
---

Bây giờ bạn đã cài đặt Công cụ SCT, bước tiếp theo là tạo Dự án di chuyển cơ sở dữ liệu bằng công cụ này.

### Xác định CSDL nguồn

1. Trong Schema Conversion Tool, nếu trình hướng dẫn dự án mới không khởi động, vui lòng khởi động bằng cách vào **File > New Project Wizard** góc trên bên trái. Khi ở chế độ **Project wizard**, vui lòng nhập các giá trị sau vào ghi chú biểu mẫu mà bạn cần điều chỉnh cho cơ sở dữ liệu nguồn mà bạn đã chọn trong văn bản bên dưới, sau đó nhấp vào **Next**.

    |  Tham số 	|  Giá trị  |
    |----------------|------------------------|
    |  Project Name		|  AWS Schema Conversion Tool Source DB to Aurora MySQL (or Aurora PostgresSQL)  |
    |  Location		|  C:\Users\Administrator\AWS Schema Conversion Tool  |
    |  Type Radio Button		|  Nhấp/Chọn SQL Database  |
    |  Source Database Engine		|  Microsoft SQL Server hoặc Oracle  |
    |  **"I want to"** Radio Button		|  Nhấp/Chọn **I want to switch engines and optimize for the cloud**  |

    ![New Project Wizard](/images/3/1/2/0001.png?width=80pc)

    ![New Project Wizard](/images/3/1/2/0002.png?width=80pc)

1. Chỉ định cấu hình cơ sở dữ liệu nguồn trong biểu mẫu, Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần vào Secrets Manager và mở DMSDBSecret và hiển thị giá trị mật khẩu SQLServer. Nó cũng nằm trên tab đầu ra của Cloudformation Stack (SQLServerPassword) đầu tiên và nhấp vào Test Connection. Sau khi kết nối được kiểm tra thành công, hãy nhấp vào **Next**.

    Tùy thuộc vào cơ sở dữ liệu nguồn của bạn, hãy chọn một trong các lộ trình sau để thực hiện theo các bước.
    #### Oracle Source Information
    {{%expand "Expand to see" %}}

|  Tham số	 |  Giá trị  |
|----------------|---------------|
|  Connection Name (if there)	 |  Oracle Source  |
|  Type	 |  SID  |
|  Server Name	 |  < SourceOracleEndpoint (you can find this in Cloudformation Output tab or goto RDS service in |  console and pick your RDS Oracle Target instance)>  |
|  Server Port	 |  1521  |
|  Oracle SID	 |  ORACLEDB  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager for Oracle  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  Oracle Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\ojdbc11.jar  |

    {{% /expand %}}

    #### MS SQL Server Source Information
    {{%expand "Expand to see" %}}

|  Tham số	 |  Giá trị  |
|----------------|---------------|
|  Connection Name (if there)	 |  SQL Server Source  |
|  Project Name	 |  localhost  |
|  Server Port	 |  1433  |
|  Instance Name	 |  localhost  |
|  Authentication	 |  SQL Server Authentication  |
|  User Name	 |  dbadmin  |
|  Password	 |  Xem tab **Đầu ra** của Cloudformation & **_DMSDBSecretPSQLSERVER_** hoặc tra cứu trong AWS Secrets Manager cho SQL Server  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  Microsoft SQL Server Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\mssql-jdbc-12.6.1.jre11.jar  |

    {{% /expand %}}

    ![New Project Wizard](/images/3/1/2/0003.png?width=80pc)

1. Chọn cơ sở dữ liệu **dms_sample**, sau đó nhấp vào **Next**. (Lưu ý: khi bạn nhấp vào cơ sở dữ liệu, thanh màu xám/xanh lam sẽ xuất hiện và nút **Next** sẽ được bật)

    ![New Project Wizard](/images/3/1/2/0004.png?width=80pc)

### Xem lại báo cáo kiểm tra khả năng dịch chuyển

1. SCT sẽ kiểm tra chi tiết tất cả các đối tượng trong lược đồ của cơ sở dữ liệu nguồn. Nó sẽ tự động chuyển đổi nhiều nhất có thể và cung cấp thông tin chi tiết về các mục mà nó không thể chuyển đổi. Nếu bạn cuộn xuống báo cáo, bạn sẽ thấy các cơ sở dữ liệu mục tiêu cụ thể như bên dưới cho SQL Server sang Aurora MySQL.

    Nhìn chung, các gói, quy trình và hàm có nhiều khả năng gặp phải một số vấn đề cần giải quyết vì chúng chứa mã SQL tùy chỉnh hoặc độc quyền nhất. AWS SCT chỉ định lượng thay đổi thủ công cần thiết để chuyển đổi từng loại đối tượng. Nó cũng cung cấp gợi ý về cách điều chỉnh các đối tượng này thành công với lược đồ mục tiêu.

1. Sau khi hoàn tất việc xem xét báo cáo đánh giá di chuyển cơ sở dữ liệu, hãy nhấp vào **Tiếp theo**.

    ![New Project Wizard](/images/3/1/2/0005.png?width=80pc)

### Xác định CSDL đích

Chỉ định cấu hình cơ sở dữ liệu mục tiêu trong biểu mẫu, Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần vào **Secrets Manager** và mở **DMSDBSecret** và tiết lộ mật khẩu. Cũng trên tab đầu ra của Cloudformation Stack, hãy xem mật khẩu SQLSever (giống như trên) rồi nhấp vào **Test Connection**. Sau khi kết nối được kiểm tra thành công, hãy nhấp vào **Finish**.

{{%expand "Mở phần này nếu bạn muốn chuyển qua Amazon Aurora (MySQL compatible)" %}}

|  Tham số	 |  Giá trị  |
|-----------------|--------------------|
|  Target Database Engine	 |  Amazon Aurora (MySQL compatible) not the default  |
|  Connection Name (if there)	 |  Aurora MySQL Target  |
|  Server Name	 |  <TargetAuroraMySQLEndpoint> - bạn có thể tìm thấy mục này trên **Cloudformation > cfn > Output** hoặc bạn có thể vào RDS trong bảng điều khiển AWS và tìm máy MySQLTarget  |
|  Server Port	 |  3306  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation Output tab & DMSDBSecretP or look it up in AWS Secrets Manager.  |
|  Use SSL	 |  Unchecked  |
|  Store Password	 |  Checked  |
|  MySQL Driver Path	 |  C:\Users\Administrator\Desktop\DMS Workshop\JDBC\mysql-connector-j-8.3.0.jar  |

{{% /expand %}}

{{%expand "Expand if you are convert to Amazon Aurora (PostgreSQL compatible)" %}}

|  Tham số 	|  Giá trị  |
|-----------------|--------------------|
|  Target Database Engine		|  Amazon Aurora (PostgreSQL compatible) not the default  |
|  Connection Name (if there)		|  Postgresql Target  |
|  Server Name		|  **TargetAuroraPostgreSQLEndpoint** - bạn có thể tìm thấy mục này trên **Cloudformation > cfn > Output** hoặc bạn có thể vào RDS trong bảng điều khiển AWS và tìm máy Postgresql Target  |
|  Server Port		|  `**5432**`  |
|  Database Name		|  AuroraDB (có phân biệt hoa-thường)  |
|  User Name		|  `**dbadmin**`  |
|  Password		|  Xem tab **Output** trên Cloudformation  & DMSDBSecretP hoặc tìm trên AWS Secrets Manager  |
|  Use SSL		|  Unchecked  |
|  Store Password		|  Checked  |
|  Amazon Aurora Driver Path		|  `**C:\Users\Administrator\Desktop\DMS Workshop\JDBC\postgresql-42.7.3.jar**` Nếu sao chép và dán không hoạt động, hãy sử dụng nút duyệt đến thư mục DMS Workshop JDBC trên màn hình nền  |

{{% /expand %}}

![New Project Wizard](/images/3/1/2/0006.png?width=80pc)

![New Project Wizard](/images/3/1/2/0007.png?width=80pc)

{{% notice info %}}
Sau khi nhấn **Next** và tải siêu dữ liệu, bạn có thể nhận được thông báo cảnh báo: **"Quá trình tải siêu dữ liệu bị gián đoạn do sự cố tìm nạp dữ liệu."** Bạn có thể bỏ qua thông báo này vì nó không ảnh hưởng đến chúng ta trong workshop này. Lưu ý rằng SCT sẽ mất vài phút để phân tích các đối tượng cơ sở dữ liệu
{{% /notice %}}