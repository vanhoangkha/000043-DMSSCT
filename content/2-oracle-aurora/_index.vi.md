+++
title = "Oracle sang Amazon Aurora (PostgreSQL)"
date = 2020
weight = 2
chapter = false
pre = "<b>2. </b>"
+++

**Di chuyển từ Oracle sang Amazon Aurora (PostgreSQL)**

Bây giờ, bạn đã hoàn thành việc thiết lập [**môi trường bài thực hành**](../1-prerequisites/), bạn đã sẵn sàng để thực hiện di chuyển cơ sở dữ liệu mẫu.

Hướng dẫn này sẽ cho bạn thấy được cách sử dụng [**AWS Database Migration Service (DMS)**](https://aws.amazon.com/dms/) và [**AWS Schema Conversion Tool (AWS SCT)**](https://aws.amazon.com/dms/schema-conversion-tool/?nc=sn&loc=2) để di chuyển dữ liệu từ một cơ sở dữ liệu (CSDL) Oracle sang [**Amazon Aurora (PostgreSQL)**](https://aws.amazon.com/rds/aurora/). Thêm vào đó, bạn sẽ sử dụng AWS DMS để liên tục cập nhật các dữ liệu thay đổi từ CSDL nguồn đến CSDL đích.

Môi trường của bài thực hành này bao gồm:
- Một máy ảo EC2 sử dụng cho việc chạy AWS Schema Conversion Tool (SCT) và các ứng dụng cần thiết cho bài thực hành.
- Một máy ảo Amazon RDS sử dụng để chạy CSDL Oracle.
- Một máy ảo Amazon RDS Aurora (PostgreSQL) sử dụng làm CSDL đích.

![Diagram](/images/2/OracleDmsDiagram.png?width=40pc)

{{% notice note %}}
Trước khi bắt đầu, hãy chắc chắn bạn đã hoàn thành phần [**Các bước chuẩn bị**](../1-prerequisites/).
{{% /notice %}}

#### Nội dung
1. [Chuyển đổi Schema](1-conversion/)
2. [Dịch chuyển Dữ liệu](2-migration/)
3. [Tổng kết](3-summary/)