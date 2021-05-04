+++
title = "Máy ảo DMS Replication"
date = 2020
weight = 4
chapter = false
pre = "<b>2.2.4. </b>"
+++

**Nội dung**
- [Tạo Máy ảo DMS Replication](#tạo-máy-ảo-dms-replication)

---

#### Tạo Máy ảo DMS Replication
Hình minh họa sau đây cho thấy tổng quan của quá trình di chuyển.

![Replication Instance](/images/2/OracleDms12.png?width=40pc)

{{% notice info %}}
Máy chủ AWS DMS replication thực hiện việc di chuyển dữ liệu giữa nguồn và đích. Máy chủ replication cũng lưu vào bộ nhớ cache các bản ghi giao dịch trong quá trình di chuyển. Số lượng CPU và dung lượng bộ nhớ của một máy chủ replication ảnh hưởng đến thời gian tổng thể cần thiết cho quá trình di chuyển.
{{% /notice %}}

1. Truy cập vào **Database Migration Service (DMS) console**.
2. Ở menu bên trái, chọn **Replication Instances**. Nó sẽ dẫn đến trang khởi chạy một Máy chủ Replication.
3. Chọn **Create replication instance** ở góc phải.

![Replication Instance](/images/2/36a.png?width=90pc)

4. Nhập thông tin khởi tạo cho Máy chủ và chọn **Create**.
|             Thông số              |                  Giá trị                  |
|:---------------------------------:|:-----------------------------------------:|
| Name                              | `DMSReplication`                            |
| Description                       | `Replication server for Database Migration` |
| Instance Class                    | dms.c5.xlarge                             |
| Engine version                    | Leave the default value                   |
| Allocated storage (GB)            | `50`                                        |
| VPC                               | **< VPC ID from Environment Setup Step >**    |
| Multi-AZ                          | No                                        |
| Publicly accessible               | No                                        |
| Advanced -> VPC Security Group(s) | default                                   |

![Replication Instance](/images/2/36b.png?width=90pc)

{{% notice note %}}
Khởi tạo máy chủ replication sẽ tốn một vài phút. Trong quá trình chờ đợi khởi tọa, bạn có thể tiếp tục tạo Endpoint cho CSDL Nguồn và Đích ở bước kế tiếp. Tuy nhiên, chúng ta không thể kiểm tra kết nối nếu không có Máy chủ replication.
{{% /notice %}}

![Replication Instance](/images/2/36c.png?width=90pc)
