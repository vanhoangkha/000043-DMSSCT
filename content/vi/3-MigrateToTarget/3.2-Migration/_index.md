---
title: "Data Migration"
weight: 2
chapter: false
pre: "<b> 3.2. </b>"
---

Phần này sẽ trình bày cách bạn có thể sử dụng Dịch vụ Dịch chuyển Cơ sở Dữ liệu AWS (AWS Database Migration Service - DMS) để di chuyển dữ liệu từ cơ sở dữ liệu nguồn đến cơ sở dữ liệu đích Amazon Aurora (MySQL). Ngoài ra, bạn sẽ sử dụng AWS DMS để liên tục sao chép các thay đổi trong cơ sở dữ liệu từ cơ sở dữ liệu nguồn đến cơ sở dữ liệu đích.

AWS DMS không di chuyển các chỉ mục phụ, chuỗi, giá trị mặc định, thủ tục lưu trữ, bộ kích hoạt, từ đồng nghĩa, chế độ xem và các đối tượng lược đồ khác không liên quan cụ thể đến việc di chuyển dữ liệu. Để di chuyển những đối tượng này đến Aurora MySQL, chúng tôi đã sử dụng Công cụ Chuyển đổi Lược đồ AWS trong phần trước.

![Migrate MS SQL to Aurora MySQL](/images/3/2/0001.png?width=50pc)