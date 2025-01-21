---
title: "Cấu hình cơ sở dữ liệu đích (RDS Microsoft SQL Server)"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

{{% notice info %}}

Hướng dẫn này chỉ dành cho việc di chuyển đến mục tiêu RDS Microsoft SQL Server. Nếu cơ sở dữ liệu đichs sử dụng lược đồ khác, bạn có thể bỏ qua trang này.

{{% /notice %}}

1. Bây giờ, trên phiên bản EC2 mà chúng ta đã kết nối qua RDP, chúng ta sẽ kết nối với cơ sở dữ liệu mục tiêu SQL Server RDS. Trong SQL Server Management Studio, chọn SQL Server Authentication và kết nối với phiên bản SQL Server RDS bằng các tham số sau. Lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần vào Secrets Manager và mở DMSDBSecret và hiển thị mật khẩu SQL Server. Nó cũng nằm trên tab **Output** của Cloudformation Stack đầu tiên bên dưới mật khẩu SQL Server.

    Điền các thông tin sau vào các vị trí tương ứng trên màn hình đăng nhập:

    |  Parameter	 |  Value  |
    |-------------|-------------------|
    |  Server Type	 |  Database Engine  |
    |  Server Name	 |  < TargetSQLServerEndpoint (you can find this in Cloudformation **Output** tab or goto RDS service in console and pick your RDS SQL Server instance>  |
    |  Login	 |  dbadmin  |
    |  Password	 |  See Cloudformation **Output** tab & see value in DMSDBSecretP or look up password in AWS Secrets Manager for secret ending in RDSDBSecret  |
    |  **Remeber Password** check box	 |  checked  |

1. Mở cửa sổ **New Query** nếu nó chưa tự động mở.

1. Chạy tệp kịch bản sau để tạo CSDL đích **dms_sample_target** trên RDS SQL Server.

    ```sql
    use master
    GO

    CREATE DATABASE dms_sample_target
    GO
    ```

    ![New db on target](/images/3/2/1/a/0001.png?width=80pc)

Cơ sở dữ liệu đích (**dms_sample_target**) hiện đã được tạo. Bạn có thể quay lại **AWS Management Console**.
