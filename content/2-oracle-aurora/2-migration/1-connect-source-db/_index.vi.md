+++
title = "Kết nối tới Database Nguồn"
date = 2020
weight = 1
chapter = false
pre = "<b>2.2.1. </b>"
+++

**Nội dung**
- [Kết nối tới Database Nguồn Oracle](#kết-nối-tới-database-nguồn-oracle)

---

#### Kết nối tới Database Nguồn Oracle

{{% notice tip %}}
Nếu bạn đã bị ngắt kết nối khỏi máy ảo EC2, hãy làm theo hướng dẫn trong phần [**Kết nối Máy ảo EC2**](../../1-conversion/1-connect-ec2/) để kết nối đến máy ảo.
{{% /notice %}}

1. Sau khi kết nối, hãy mở **Oracle SQL Developer** từ thanh **Taskbar**.

![Connect Source Database](/images/2/25.png?width=90pc)

2. Bấm vào **biểu tượng dấu cộng** ở menu bên trái, chọn **New Database Connection** và nhập các thông tin bên dưới. Sau đó chọn **Connect**.

|      Thông số      |          Giá trị         |
|:------------------:|:------------------------:|
| Connection Name    | Source Oracle            |
| Username           | dbmaster                 |
| Password           | dbmaster123              |
| **Save Password ** | Check                    |
| Hostname           | < SourceOracleEndpoint > |
| Port               | 1521                     |
| SID                | ORACLEDB                 |

![Connect Source Database](/images/2/26.png?width=90pc)

3. Sau khi thấy tình trạng kiểm tra là **Successful**, hãy chọn **Connect**.