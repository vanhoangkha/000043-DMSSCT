---
title: "Dịch chuyển dữ liệu sử dụng DMS Serverless"
weight: 1
chapter: false
pre: "<b> 4.1. </b>"
---

Hướng dẫn từng bước này trình bày cách bạn có thể sử dụng **AWS DMS** để di chuyển dữ liệu từ cơ sở dữ liệu SQL Server hoặc Oracle đang chạy trên **Amazon EC2**. Ngoài ra, bạn sẽ cấu hình **AWS DMS** để ghi lại các thay đổi dữ liệu (CDC) trên cơ sở dữ liệu nguồn và sao chép chúng trên cơ sở dữ liệu đích.

### Điều kiện tiên quyết

1. Thiết lập AWS Console, Tải xuống cặp khóa EC2 và Truy xuất các tham số Môi trường. ([Bắt đầu](../../1-Start/))

1. Cấu hình cơ sở dữ liệu nguồn của bạn bằng cách chọn một trong các liên kết sau:

    - [SQL Server làm nguồn](../../2-SelectSource/2.2-SqlSrv/)

    - [Oracle làm nguồn](../../2-SelectSource/2.1-Oracle/)

1. Tạo điểm cuối Nguồn và Đích:

    - [Aurora MySQL làm Đích](../../3-SelectTarget/3.1-AuroraMySQL/3.1.2-Migration/3.1.2.3-CreateEndpoint)

    - Aurora PostgreSQL làm Đích

Sau khi bạn đã cấu hình cơ sở dữ liệu nguồn và tạo điểm cuối nguồn và đích. Bạn có thể tiến hành tạo tác vụ Sao chép không có máy chủ.