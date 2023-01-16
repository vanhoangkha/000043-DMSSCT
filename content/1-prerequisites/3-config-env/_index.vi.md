+++
title = "Chuẩn bị Môi trường"
date = 2020
weight = 3
chapter = false
pre = "<b>1.3. </b>"
+++

**Nội dung:**
- [Chuẩn bị Môi trường](#chuẩn-bị-môi-trường)

---

#### Chuẩn bị Môi trường

Ở bước này, bạn sẽ sử dụng **CloudFormation (CFN) template** để triển khai hệ thống cho bài thực hành dịch chuyển database. **AWS CloudFormation** đơn giản hóa việc xây dựng hạ tầng, vậy nên bạn có thể tập trung vào việc di chuyển cơ sở dữ liệu.

1. Mở [**AWS CloudFormation console**](https://console.aws.amazon.com/cloudformation/), và chọn vào **Create Stack**.

![Environment](/images/1/4.png?width=90pc)

2. Chọn **Template is ready**, và chọn **Upload a template file** để tải lên template bài thực hành. Sau đó chọn **Choose file** và tải lên [**DMSWorkshop.yaml**](https://dms-immersionday.workshop.aws/code/DMSWorkshop.yaml). Chọn **Next**.

{{%attachments title="Template" pattern=".*(yaml)"/%}}

![Environment](/images/1/5.png?width=90pc)

3. Điền các thông tin bên dưới vào form và chọn **Next**. 

|   Thông số nhập vào   |                                          Giá trị                                        |
|:---------------------:|:---------------------------------------------------------------------------------------:|
| Stack Name            | A unique identifier without spaces.                                                     |
| MigrationType         | Database that you want to migrate (Oracle or SQL Server).                               |
| KeyName               | The KeyPair (DMSKeypair) that you created in the previous step.                         |
| EC2ServerInstanceType | An Amazon EC2 Instance type from the drop-down menu. Recommend using the default value. |
| RDSInstanceType       | An Amazon RDS Instance type from the drop-down menu. Recommend using the default value. |
| VpcCIDR               | The VPC CIDR range in the form x.x.x.x/16. Defaults to 10.20.0.0/16                     |
| Subnet1CIDR           | The Subnet CIDR range for subnet 1 in the form x.x.x.x/24. Defaults to 10.20.1.0/24     |
| Subnet2CIDR           | The Subnet CIDR range for subnet 2 in the form x.x.x.x/24. Defaults to 10.20.2.0/24     |
| Subnet3CIDR           | The Subnet CIDR range for subnet 3 in the form x.x.x.x/24. Defaults to 10.20.3.0/24     |

{{% notice warning %}}
Các tài nguyên được tạo được gắn vào tiền tố là Tên Stack của bạn. Hãy chọn Tên Stack sao cho duy nhất trong Tài khoản của bạn.
{{% /notice %}}

![Environment](/images/1/6.png?width=90pc)

4. Ở trang **Stack Options**, chấp nhận các giá trị mặc định và chọn **Next**.
5. Ở trang **Review**, chọn **Create stack**.

![Environment](/images/1/7.png?width=90pc)

6. Lúc này, bạn sẽ được chuyển về **CloudFormation console** và sẽ thấy tình trạng `CREATE_IN_PROGRESS`. Hãy đợi đến khi trạng thái được chuyển về `COMPLETE`.

![Environment](/images/1/8.png?width=90pc)

7. Khi tình trạng của việc triển khai CloudFormation trở thành `CREATE_COMPLETE`, hãy đi đến mục **Outputs**.
8. Ghi chú lại các thông tin từ **Output** vì các giá trị này bạn sẽ sử dụng để làm bài thực hành:
   - Di chuyển Microsoft SQL Server sang Amazon Aurora (MySQL):
   ![Environment](/images/1/9.png?width=90pc)
   
   - Di chuyển Oracle sang Amazon Aurora (PostgreSQL):
   ![Environment](/images/1/10.png?width=90pc)
