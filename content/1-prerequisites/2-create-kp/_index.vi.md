+++
title = "Tạo EC2 key pair"
date = 2020
weight = 2
chapter = false
pre = "<b>1.2. </b>"
+++

**Nội dung:**
- [Thiết lập AWS Managed Microsoft Directory](#thiết-lập-aws-managed-microsoft-directory)

---

#### Tạo EC2 key pair

Trong bước này, chúng ta sẽ tạo một EC2 key pair sử dụng để kết nối đến EC2 instance trong bài thực hành.

1. Truy cập vào địa chỉ [**tại đây**](http://amzn.to/2kcoMQp) để vào mục **Key Pair** trong **EC2 console**. 
2. Kiểm tra vùng bạn đang truy cập có đúng như mong muốn. Sau đó, chọn vào **Create Key Pair**.

![EC2 key pair](/images/1/2.png?width=90pc)

3. Đặt tên key pair là **EC2KeyPair**, sau đó chọn **Create**.
4. Lúc này, trình duyệt sẽ cho phép bạn tải về tập tin **EC2Keypair.pem**. **Lưu** tập tin. Bạn sẽ cần sử dụng tập tin này để làm bài thực hành.

![EC2 key pair](/images/1/3.png?width=90pc)

{{% notice note %}}
Hãy nhớ vị trí bạn đã lưu trữ key pair `.pem` ở máy bạn. Bạn sẽ sử dụng chúng sau này.
{{% /notice %}}
