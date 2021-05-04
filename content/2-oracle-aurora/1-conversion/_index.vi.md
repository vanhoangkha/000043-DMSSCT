+++
title = "Chuyển đổi Schema"
date = 2020
weight = 1
chapter = false
pre = "<b>2.1. </b>"
+++

**Chuyển đổi Schema**

Phần này trình bày cách sử dụng AWS Schema Conversion Tool để chuyển đổi schema cơ sở dữ liệu Oracle sang cơ sở dữ liệu Amazon Aurora (PostgreSQL). Ngoài ra, bạn sẽ quan sát cách AWS SCT giúp bạn phát hiện sự khác biệt giữa hai ngôn ngữ; và cung cấp cho bạn các mẹo về cách bạn có thể sửa đổi mã thủ tục khi cần thiết để di chuyển thành công tất cả các đối tượng trong cơ sở dữ liệu.

![Diagram](/images/2/OracleSct00.png?width=40pc)

Trong phần này, bạn sẽ thực hiện các bước sau:

#### Nội dung:
1. [Kết nối tới Máy ảo EC2](1-connect-ec2/)
2. [Cài đặt AWS Schema Conversion Tool (AWS SCT)](2-aws-sct/)
3. [Tạo Database Migration Project](3-dms-project/)
4. [Chuyển đổi Schema](4-convert/)