---
title: "Chọn CSDL đích cho DMS"
weight: 3
chapter: false
pre: "<b> 3. </b>"
---

Vậy là bạn đã hoàn tất việc thiết lập phần Bắt đầu và chọn cơ sở dữ liệu nguồn, bạn đã sẵn sàng để di chuyển cơ sở dữ liệu mẫu.

Hướng dẫn từng bước này trình bày cách bạn có thể sử dụng **AWS Schema Conversion Tool (AWS SCT)** và **AWS Database Migration Service (DMS)** để chuyển đổi lược đồ và di chuyển dữ liệu sang **Amazon Aurora (MySQL/PostgreSQL)**. Ngoài ra, bạn sẽ sử dụng AWS DMS để liên tục sao chép các thay đổi cơ sở dữ liệu từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích.

Môi trường cho phòng thí nghiệm này bao gồm:

- Một nguồn dữ liệu như SQL Server hoặc Oracle.

- Một **máy ảo EC2** đã cài **Schema Conversion Tool** và các công cụ giao diện người dùng cơ sở dữ liệu khác, làm cơ sở dữ liệu nguồn.

- Một máy **Amazon Aurora/RDS** được sử dụng làm cơ sở dữ liệu đích.

- Một **S3 Bucket** nếu bạn chọn S3 làm CSDL đích

![Infrastructure](/images/3/0001.png?width=80pc)