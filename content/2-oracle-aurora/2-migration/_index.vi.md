+++
title = "Dịch chuyển Dữ liệu"
date = 2020
weight = 2
chapter = false
pre = "<b>2.2. </b>"
+++

**Dịch chuyển Dữ liệu**

{{% notice note %}}
Xin lưu ý rằng bạn cần hoàn thành các bước được mô tả trong phần [**Chuyển đổi Schema**](../1-conversion/) để chuẩn bị cho phần thực hành này.
{{% /notice %}}

Phần này sẽ trình bày cách bạn có thể sử dụng AWS Database Migration Service để di chuyển dữ liệu từ cơ sở dữ liệu Oracle sang cơ sở dữ liệu Amazon Aurora (PostgreSQL). Ngoài ra, bạn sẽ sử dụng AWS DMS để liên tục sao chép các dữ liệu thay đổi từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích. Chúng ta thực hiện việc này theo hai bước:

Đầu tiên, bạn thực hiện di chuyển toàn bộ tải cơ sở dữ liệu Oracle nguồn sang cơ sở dữ liệu Aurora PostgreSQL bằng AWS DMS.

Tiếp theo, bạn nắm bắt các thay đổi dữ liệu (CDC) từ cơ sở dữ liệu Oracle và tự động sao chép chúng sang cơ sở dữ liệu Aurora PostgreSQL bằng AWS DMS.

AWS DMS không di chuyển secondary indexes, sequences, default values, stored procedures, triggers, synonyms, views, và các schema object khác không liên quan đến dữ liệu di chuyển. Để di chuyển các đối tượng này sang cơ sở dữ liệu Aurora (PostgreSQL) đích, chúng ta đã sử dụng AWS Schema Conversion Tool trong phần trước.

![Diagram](/images/2/OracleDms00.png?width=40pc)

Trong phần này, bạn sẽ thực hiện các bước sau:

#### Nội dung:
1. [Kết nối tới Database Nguồn Oracle](1-connect-source-db/)
2. [Cấu hình Database Nguồn](2-config-source-db/)
3. [Cấu hình Database Đích](3-config-target-db/)
4. [Tạo Máy ảo DMS Replication](4-dms-replication/)
5. [Tạo DMS Endpoint Nguồn và Đích](5-endpoints/)
6. [Tạo DMS Migration Task](6-migration-task/)
7. [Kiểm tra Dữ liệu Database Đích](7-inspect-content/)
8. [Di chuyển Dữ liệu thay đổi](8-replicate-changes/)
