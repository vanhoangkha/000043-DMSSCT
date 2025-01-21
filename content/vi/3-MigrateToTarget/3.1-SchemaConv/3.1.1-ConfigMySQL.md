---
title: "Cấp quyền trong CSDL đich"
weight: 1
chapter: false
pre: "<b> 3.1.1. </b>"
---

{{% notice info %}}
Phần này chỉ dành cho CSDL đích Aurora (tương thích với MySQL). Nếu bạn đang di chuyển đến CSDL đích khác, bạn có thể bỏ qua trang này.
{{% /notice %}}

{{%expand "Mở phần này nếu lược đồ đích của bạn là Aurora MySQL" %}}

1. Mở **MySQL Workbench 8.0 CE** từ bên trong máy chủ EC2 và tạo kết nối cơ sở dữ liệu mới cho cơ sở dữ liệu Aurora mục tiêu bằng các giá trị sau. Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần vào **Secrets Manager** và mở **DMSDBSecret** và hiển thị mật khẩu SQL Server. Nó cũng nằm trên tab đầu ra của Cloudformation Stack đầu tiên trong mật khẩu SQL Server (đúng là mysql nhưng mật khẩu giống nhau cho sql server & mysql trong trường hợp này):

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0000.png?width=75pc)

    |  Tham số	 |  Giá trị  |
    |-------------|---------------------------|
    |  Connection Name	 | ` Target Aurora RDS (MySQL)`  |
    |  Host Name	 |  <TargetAuroraMySQLEndpoint> - bạn có thể tìm thấy điều này trên **Cloudformation > cfn > tab Output** hoặc bạn có thể vào RDS trong bảng điều khiển AWS và tìm máy Aurora MySQL Target của bạn  |
    |  Port	 |  3306  |
    |  Username	 |  `dbadmin`  |
    |  Password (Nhấn enter sau khi nhấp **Test Connection**)	 |  Xem tab **Cloudformation Output** > **_DMSDBSecretP_** hoặc tra cứu trong AWS Secrets Manager cho SQL Server  |
    |  Default Schema	 | Để trống  |

1. Nhấp vào nút **Test Connection** (Kiểm tra kết nối) và nhập mật khẩu. Sau khi bạn nhận được thông báo **“Successfully made the MySQL connection”**, hãy nhấp vào **OK**.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0002.png?width=75pc)

1. Nhấp vào CSDL đích Aurora RDS (MySQL) từ danh sách Kết nối MySQL trong SQL Workbench để kết nối với cơ sở dữ liệu đích.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0003.png?width=75pc)

1. Sao chép các câu lệnh SQL cấp quyền sau và thực thi chúng trong công cụ workbench (Biểu tượng ánh sáng là biểu tượng thực thi/chạy).

    ```sql
    GRANT CREATE ON *.* TO 'dbadmin';
    GRANT ALTER ON *.* TO 'dbadmin';
    GRANT DROP ON *.* TO 'dbadmin';
    GRANT INDEX ON *.* TO 'dbadmin';
    GRANT REFERENCES ON *.* TO 'dbadmin';
    GRANT SELECT ON *.* TO 'dbadmin';
    GRANT CREATE VIEW ON *.* TO 'dbadmin';
    GRANT SHOW VIEW ON *.* TO 'dbadmin';
    GRANT TRIGGER ON *.* TO 'dbadmin';
    GRANT CREATE ROUTINE ON *.* TO 'dbadmin';
    GRANT ALTER ROUTINE ON *.* TO 'dbadmin';
    GRANT EXECUTE ON *.* TO 'dbadmin';
    -- only for MySQL <8.0 GRANT SELECT ON mysql.proc TO 'awssct';
    GRANT INSERT, UPDATE ON AWS_SQLSERVER_EXT.* TO 'dbadmin';
    GRANT INSERT, UPDATE, DELETE ON AWS_SQLSERVER_EXT_DATA.* TO 'dbadmin';
    GRANT CREATE TEMPORARY TABLES ON AWS_SQLSERVER_EXT_DATA.* TO 'dbadmin';
    GRANT CREATE TEMPORARY TABLES ON *.* TO 'dbadmin';
    -- MySQL <8 code GRANT INVOKE LAMBDA ON *.* TO 'awssct';
    GRANT AWS_LAMBDA_ACCESS TO 'dbadmin'; 
    GRANT INSERT, UPDATE ON AWS_ORACLE_EXT.* TO 'dbadmin';
    GRANT INSERT, UPDATE, DELETE ON AWS_ORACLE_EXT_DATA.* TO 'dbadmin';
    grant INSERT ON aws_sqlserver_ext.* to 'dbadmin';
    grant UPDATE ON aws_sqlserver_ext.* to 'dbadmin';
    ```

    Sau khi thực hiện, đầu ra sẽ trông giống như hình ảnh bên dưới. Chúng tôi khuyên bạn nên giữ MySQL workbench mở vì bạn sẽ quay lại sau trong phần DMS.

    ![Open MySQL Workbench and Create a connection](/images/3/1/1/0004.png?width=75pc)

Bây giờ bạn có thể thay đổi phiên bản EC2 mà bạn đã chuyển sang RDP trở lại công cụ chuyển đổi Schema và nhấp vào **Tiếp theo** bên dưới.
{{% /expand%}}