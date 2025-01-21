---
title: "Chuẩn bị môi trường"
weight: 3
chapter: false
pre: "<b> 1.3. </b>"
---

Trong bước này, bạn sẽ sử dụng mẫu CloudFormation (CFN) để triển khai cơ sở hạ tầng cho quá trình di chuyển cơ sở dữ liệu này. AWS CloudFormation đơn giản hóa việc cung cấp cơ sở hạ tầng, do đó chúng ta có thể tập trung vào các tác vụ liên quan đến di chuyển dữ liệu.

1. Mở [bảng điều khiển AWS CloudFormation](https://console.aws.amazon.com/cloudformation/) và nhấp vào nút **Create Stack**.

    ![CFn Stacks menu](/images/1/3/0001.png?width=60pc)

1. Chọn **Template is ready** và chọn **Upload a template file** làm mẫu nguồn. Sau đó, nhấp vào **Choose file** và tải lên [DMSWorkshop2025.yaml](/workloads/DMSWorkshop2025.yaml). Nhấp vào **Next**.

    ![Upload template file](/images/1/3/0002.png?width=60pc)

1. Điền thông tin vào các khung trống theo các giá trị dưới bảng sau, rồi nhấp **Next**.

    |  Tham số	 |  Giá trị	 |
    ---------------------|----------------------------------|
    |  Stack Name	 |  A unique identifier without spaces.	 |
    |  MigrationType / Lab Type	 |  Database that you want to migrate (Oracle or SQL Server).	 |
    |  EC2ServerInstanceType	 |  An Amazon EC2 Instance type from the drop-down menu. Recommend using the default value.	 |
    |  KeyName	 |  The KeyPair (DMSKeypair) that you created in the previous step.	 |
    |  RDSInstanceType	 |  An Amazon RDS Instance type from the drop-down menu. Recommend using the default value.	 |
    |  VpcCIDR	 |  The VPC CIDR range in the form x.x.x.x/16. Defaults to 10.20.0.0/16	 |
    |  IAMRoleDmsVpcExist	 |  Does your AWS account already have dms-vpc-role(goto IAM>roles & search for "dms-vpc" to check) if this role is not there template will fail-rollback unless you change default Y to N?	 |

    ![Upload template file](/images/1/3/0003.png?width=60pc)

{{% notice info %}}
Các tài nguyên được tạo ở đây sẽ được thêm tiền tố bằng bất kỳ giá trị nào bạn chỉ định trong **Stack name**. Vui lòng chỉ định một giá trị duy nhất cho tài khoản của bạn.
{{% /notice %}}

4. Tại trang **Stack Options**, chấp nhận các giá trị mặc định và nhấp **Next**.

    ![Stack options](/images/1/3/0004.png?width=60pc)

    ![Agree to create necessary IAM roles](/images/1/3/0005.png?width=50pc)

1. Tại trang **Review**, nhấp vào **Create stack**.

    ![Agree to create necessary IAM roles](/images/1/3/0006.png?width=90pc)

1. Tại thời điểm này, bạn sẽ được chuyển hướng trở lại bảng điều khiển CloudFormation và sẽ thấy trạng thái là **CREATE_IN_PROGRESS**. Vui lòng đợi ở đây cho đến khi trạng thái thay đổi thành **CREATE_COMPLETE**.

    ![Agree to create necessary IAM roles](/images/1/3/0007.png?width=90pc)

1. Khi trạng thái CloudFormation thay đổi thành **CREATE_COMPLETE**, hãy chuyển đến phần **Outputs**.

1. Ghi lại các giá trị đầu ra từ môi trường CloudFormation mà bạn đã khởi chạy. Bạn sẽ cần chúng cho phần còn lại của workshop:

    ![Agree to create necessary IAM roles](/images/1/3/0008.png?width=90pc)