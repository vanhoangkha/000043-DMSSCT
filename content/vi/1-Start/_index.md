---
title: "Bắt đầu"
weight: 1
chapter: false
pre: "<b> 1. </b>"
---

Nếu bạn đang sử dụng tài khoản AWS của riêng mình hoặc được nhân viên AWS khuyên cấu hình môi trường workshop, bạn cần thiết lập một số tài nguyên trên AWS mà chúng ta sẽ sử dụng để thực hiện di chuyển. Phần này mô tả các bước cung cấp tài nguyên AWS cần thiết cho hướng dẫn di chuyển cơ sở dữ liệu này.

Chúng ta sử dụng **AWS CloudFormation** để đơn giản hóa việc cung cấp cơ sở hạ tầng, từ đó hướng sự tập trung vào các tác vụ liên quan đến dịch chuyển dữ liệu.

Tệp mẫu CloudFormation sẽ tạo một cấu trúc mạng cơ bản bao gồm **Amazon Virtual Private Cloud (Amazon VPC)** với 3 mạng con công khai để triển khai một máy **AWS Database Migration Service (AWS DMS)** cũng như một máy **Amazon Relational Database Service (Amazon RDS)** cho cơ sở dữ liệu đích. Ngoài ra, kiến trúc cũng bao gồm một máy **Amazon Elastic Compute Cloud (EC2)** để lưu trữ các công cụ chúng ta sẽ sử dụng trong quá trình di chuyển này, bao gồm **AWS Schema Conversion Tool (AWS SCT)**. Tương tự, trong workshop di chuyển Microsoft SQL Server, chúng ta sử dụng phiên bản EC2 này để mô phỏng cơ sở dữ liệu nguồn của mình.