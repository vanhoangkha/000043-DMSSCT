---
title: "Microsoft SQL Server target"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

Trong trang này, bạn sẽ kiểm tra cơ sở dữ liệu mục tiêu sau khi di chuyển.

1. Mở Microsoft SQL Server Management Studio từ máy chủ EC2 mà bạn đã kết nối qua RDP.

1. Thực hiện theo hướng dẫn đã mô tả trước đó để kết nối với phiên bản RDS SQL Server mục tiêu.

1. Kiểm tra nội dung của cơ sở dữ liệu RDS SQL đã di chuyển (dms_sample_target) và đảm bảo rằng các bảng sau đã được di chuyển. Bạn có thể làm điều đó bằng cách mở một cửa sổ Truy vấn Mới để thực hiện câu lệnh sau.

    ```sql
    use dms_sample_target
    SELECT *
    FROM dms_sample_target.INFORMATION_SCHEMA.TABLES;
    GO
    ```

1. Đối với nguồn Oracle, điều này nên hiển thị 15 bảng cơ sở dms_sample và 1 bảng ngoại lệ áp dụng liên quan đến DMS, tổng cộng là 16 bảng được tạo ra.

1. Đối với nguồn SQL Server, điều này nên hiển thị 16 bảng cơ sở dms_sample và 1 bảng ngoại lệ áp dụng liên quan đến DMS, tổng cộng là 17 bảng được tạo ra.

1. Tiếp theo, thực hiện truy vấn sau:

    ```sql
    use dms_sample_target
    SELECT * FROM dms_sample_target.sport_type;
    GO
    ```

    ![](/images/3/2/5/a/0001.png?width=80pc)

{{% notice info %}}
Bóng chày và bóng đá là hai môn thể thao duy nhất hiện đang được liệt kê trong bảng này. Ở phần tiếp theo, bạn sẽ thêm một số bản ghi mới vào cơ sở dữ liệu nguồn với thông tin về các loại thể thao khác. DMS sẽ tự động sao chép những bản ghi mới này từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích.
{{% /notice %}}