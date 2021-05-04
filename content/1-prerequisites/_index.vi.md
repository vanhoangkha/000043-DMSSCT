+++
title = "Các bước chuẩn bị"
date = 2020
weight = 1
chapter = false
pre = "<b>1. </b>"
+++

**Các bước chuẩn bị**

Phần này mô tả các bước để cung cấp tài nguyên AWS cần thiết cho bài thực hành di chuyển cơ sở dữ liệu này.

Bạn sẽ sử dụng [**AWS CloudFormation**](https://aws.amazon.com/cloudformation/) để đơn giản hóa việc cung cấp cơ sở hạ tầng và bạn có thể tập trung vào các tác vụ liên quan đến di chuyển dữ liệu.

CFN Template tạo cấu trúc liên kết mạng cơ bản bao gồm **Amazon Virtual Privsate Cloud (Amazon VPC)** với 3 public subnet để triển khai máy chủ **AWS Database Migration Service (AWS DMS)***, cũng như máy chủ **Amazon Relational Database Service (Amazon RDS)** làm cơ sở dữ liệu đích. Ngoài ra, nó cung cấp một máy ảo **Amazon Elastic Compute Cloud (EC2)** để lưu trữ các công cụ mà chúng ta sử dụng trong quá trình di chuyển này, bao gồm cả **AWS Schema Conversion Tool (AWS SCT)**. Tương tự như vậy, trong bài thực hành di chuyển Microsoft SQL Server, chúng ta sử dụng máy ảo EC2 này để mô phỏng cơ sở dữ liệu nguồn của chúng ta.

{{% notice info %}}
Chúng ta sử dụng **Remote Desktop Protocol (RDP)** để kết nối với máy ảo Amazon EC2. Hãy đảm bảo rằng bạn có một ứng dụng RDP đã được cài đặt sẵn trên máy tính của bạn, chẳng hạn như [Microsoft Remote Desktop](https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients).
{{% /notice %}}

{{% notice warning %}}
Các tài nguyên được khởi tạo trong bài thực hành này sẽ phải trả phí. Hãy nhớ thực hiện theo hướng dẫn [Dọn dẹp Tài nguyên](../3-cleanup/) sau khi bạn đã hoàn thành bài thực hành để tránh phát sinh thêm các chi phí.
{{% /notice %}}

#### Nội dung
1. [Đăng nhập vào AWS Manangement Console](1-console/)
2. [Tạo mới một EC2 Keypair](2-create-kp/)
3. [Cấu hình Môi trường](3-config-env/)
