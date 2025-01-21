---
title: "Nguồn Oracle"
weight: 1
chapter: false
pre: "<b> 2.1. </b>"
---

Bây giờ bạn đã hoàn tất thiết lập Bắt đầu, bạn đã sẵn sàng di chuyển cơ sở dữ liệu mẫu.

Hướng dẫn từng bước này trình bày cách bạn có thể sử dụng **Dịch vụ di chuyển cơ sở dữ liệu AWS (DMS)** để di chuyển dữ liệu từ cơ sở dữ liệu Oracle, trong trường hợp này đang chạy trên **Amazon RDS** nhưng quy trình này giống với quy trình Oracle chạy tại chỗ hoặc bất kỳ nơi nào khác. Ngoài ra, bạn sẽ cấu hình AWS DMS để ghi lại các thay đổi dữ liệu (CDC) trên cơ sở dữ liệu nguồn và sao chép chúng trên cơ sở dữ liệu đích.

Môi trường cho bài thực hành này bao gồm:

- Một máy ảo EC2 lưu trữ các công cụ được sử dụng trong bài thực hành này như Oracle SQL Developer.

- Một máy Oracle của Amazon RDS được sử dụng để lưu trữ cơ sở dữ liệu Oracle nguồn.

- Một CSDL đích cho việc dịch chuyển dữ liệu

![Kiến trúc cơ sở hạ tầng](/images/2/1/0001.png?width=80pc)