+++
title = "Database Migration Project"
date = 2020
weight = 3
chapter = false
pre = "<b>2.1.3. </b>"
+++

**Nội dung**
- [Tạo Database Migration Project](#tạo-database-migration-project)

---

#### Tạo Database Migration Project

Bây giờ, bạn đã cài đặt xong ứng dụng AWS Schema Conversion Tool, tiếp theo bạn sẽ cần tạo một Database Migration Project sử dụng công cụ này.

1. Ở trong ứng dụng Schema Conversion Tool, nhập các thông tin bên dưới vào form và chọn **Next**.

|        Thông số        |                            Giá trị                           |
|:----------------------:|:------------------------------------------------------------:|
| Project Name           | AWS Schema Conversion Tool Oracle to Aurora PostgreSQL       |
| Location               | C:\Users\Administrator\AWS Schema Conversion Tool\Projects   |
| Database Type          |                               |
| Source Database Engine | Oracle / I want to switch engines and optimize for the cloud |

![Project](/images/2/8.png?width=90pc)

2. Nhập thông tin CSDL Nguồn vào form và chọn **Test Connection**. Sau khi kiểm thử thành công, chọn **Next**.

|      Thông số      |                           Giá trị                           |
|:------------------:|:-----------------------------------------------------------:|
| Type               | SID                                                         |
| Server Name        | < SourceOracleEndpoint >                                    |
| Server Port        | 1521                                                        |
| Oracle SID         | ORACLEDB                                                    |
| User Name          | dbmaster                                                    |
| Password           | dbmaster123                                                 |
| Use SSL            | Unchecked                                                   |
| Store Password     | Checked                                                     |
| Oracle Driver Path | C:\Users\Administrator\Desktop\DMS Workshop\JDBC\ojdbc8.jar |

![Project](/images/2/9.png?width=90pc)
![Project](/images/2/9a.png?width=90pc)
![Project](/images/2/9b.png?width=90pc)

{{% notice note %}}
Bạn có thể sẽ thấy có cảnh báo bảo mật về SSL. Hãy chọn **"Accept the risk and continue"**.
{{% /notice %}}

3. Chọn CSDL `DMS_SAMPLE`, sau đó chọn **Next**.

![Project](/images/2/10.png?width=90pc)

{{% notice note %}}
Sau khi chọn **Next** và tải các metadata, Bạn có thể sẽ nhận được thông báo: **Metadata loading was interrupted because of data fetching issues.**. Hãy bỏ qua thông báo này vì nó không ảnh hưởng đến bài thực hành của bạn.
{{% /notice %}}

4. Kiểm tra thông tin từ **Database Migration Assessment Report**.

![Project](/images/2/11.png?width=90pc)
SCT sẽ đánh giá chi tiết các đối tượng trong schema của CSDL nguồn. Nó sẽ chuyển đổi nhiều nhất có thể một cách tự động và cung cấp các thông tin chi tiết về các mục mà nó không thể chuyển đổi.

![Project](/images/2/12.png?width=90pc)
Thông thường, các package, procedure, và function sẽ có một số vấn đề cần phải xử lý vì chúng chứa nhiều các thiết lập tùy chỉnh hay các SQL code độc quyền. AWS SCT xác định khối lượng thay đổi thủ công cần thiết để chuyển đổi các loại đối tượng. Nó cũng đưa ra các gợi ý cách thực hiện để chuyển đổi sang schema mới.

5. Sau khi hoàn tất việc xem Báo cáo đánh giá quá trình chuyển đổi CSDL, chọn **Next**.
6. Chỉ định CSDL đích trong form và chọn **Test Connection**. Sau khi kiểm thử kết nối thành công, chọn **Finish**.

|         Thông số          |                                 Giá trị                                |
|:-------------------------:|:----------------------------------------------------------------------:|
| Target Database Engine    | Amazon Aurora (PostgreSQL compatible)                                  |
| Server Name               | < TargetAuroraPostgreSQLEndpoint >                                     |
| Server Port               | 5432                                                                   |
| Database Name             | AuroraDB                                                               |
| User Name                 | dbmaster                                                               |
| Password                  | dbmaster123                                                            |
| Use SSL                   | Unchecked                                                              |
| Store Password            | Checked                                                                |
| Amazon Aurora Driver Path | C:\Users\Administrator\Desktop\DMS Workshop\JDBC\postgresql-42.2.9.jar |

![Project](/images/2/13.png?width=90pc)
![Project](/images/2/13.1.png?width=90pc)
![Project](/images/2/13.2.png?width=90pc)

![Project](/images/2/13a.png?width=90pc)
