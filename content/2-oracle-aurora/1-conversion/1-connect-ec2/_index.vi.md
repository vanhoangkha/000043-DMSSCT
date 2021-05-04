+++
title = "Kết nối EC2"
date = 2020
weight = 1
chapter = false
pre = "<b>2.1.1. </b>"
+++

**Nội dung**
- [Kết nối đến Máy ảo EC2](#kết-nối-đến-máy-ảo-ec2)

---

#### Kết nối đến Máy ảo EC2

1. Truy cập vào [**AWS EC2 console**](http://amzn.to/2atGc3r) và chọn **Instances** ở cột bên trái.

![Connect](/images/2/1.png?width=90pc)

2. Chọn máy ảo với tên `<StackName>-EC2Instance` và chọn **Actions**. Sau đó chọn **Connect**.

![Connect](/images/2/2.png?width=90pc)

3. Đi đến phần **RDP client**, chọn **Get Password**.

![Connect](/images/2/3.png?width=90pc)

4. Chọn **Browse** và tải lên **tập tin Key Pair** bạn đã tải xuống trước đó.
5. Chọn **Decrypt Password**.

![Connect](/images/2/4.png?width=90pc)

6. Sao chép mật khẩu đã tạo. Bạn sẽ sử dụng mật khẩu này để kết nối đăng nhập vào máy ảo EC2.

![Connect](/images/2/5.png?width=90pc)

7. Chọn vào **Download Remote Desktop File** để tải tập tin RDP của máy ảo EC2.
8. Kết nối vào máy chủ EC2 bằng ứng dụng RDP của bạn.
