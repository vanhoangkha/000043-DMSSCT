---
title: "Nguồn SQL Server"
weight: 2
chapter: false
pre: "<b> 2.2. </b>"
---

Bây giờ bạn đã hoàn tất thiết lập Bắt đầu, bạn đã sẵn sàng di chuyển cơ sở dữ liệu mẫu.

Hướng dẫn từng bước này trình bày cách bạn có thể sử dụng AWS Database Migration Service (DMS) để di chuyển dữ liệu sang cơ sở dữ liệu SQL Server đang chạy trên Amazon EC2. Ngoài ra, bạn sẽ cấu hình AWS DMS để ghi lại các thay đổi dữ liệu (CDC) trên cơ sở dữ liệu nguồn và sao chép chúng trên cơ sở dữ liệu đích.

Môi trường cho bài thực hành này bao gồm:

- Một máy ảo EC2 lưu trữ các công cụ được sử dụng trong bài thực hành này như **SQL Server Management Studio (SSMS)** hoặc **Oracle SQL Developer**.

- Một cơ sở dữ liệu SQL Server đang chạy trên máy ảo EC2 mà bạn sẽ RDP vào

- Một CSDL đích cho DMS

Trong bài tập này, bạn thực hiện các tác vụ sau:

- Kết nối với Phiên bản EC2

- Mở SQL Server Management Studio

- Cấu hình Cơ sở dữ liệu nguồn

- Tóm tắt

![Infrastructure](/images/3/1/0001.png?width=80pc)