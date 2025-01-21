---
title: "Create a replication instance"
weight: 2
chapter: false
pre: "<b> 3.2.2. </b>"
---

Lược đồ sau minh họa góc nhìn thượng tầng của quá trình di dời dữ liệu.

![Data Migration Diagram](/images/3/2/2/0001.png?width=50pc)

1. Điều hướng đến [Bảng điều khiển DMS](https://console.aws.amazon.com/dms/v2/) hoặc gõ DMS vào thanh tìm kiếm ở góc trên bên trái của màn hình.

    ![Thay đổi mã quy trình](/images/3/2/2/0002.png?width=90pc)

1. Trong menu bên trái, nhấp vào **Replication instances**. Điều này sẽ mở màn hình phiên bản sao chép.

1. Lưu ý rằng chúng tôi đã tạo sẵn một phiên bản sao chép DMS cho bạn, vì vậy bạn có thể bỏ qua phần này hoặc nếu bạn muốn trải nghiệm việc xây dựng một phiên bản sao chép DMS, hãy tiếp tục.

1. Nhấp vào nút **Create replication instance** ở góc trên bên phải.

    ![Thay đổi mã quy trình](/images/3/2/2/0003.png?width=90pc)

1. Nhập thông tin sau cho Phiên bản Sao chép. Sau đó, nhấp vào nút **Tạo**.

    |  Tham số	 |  Giá trị  |
    |----------------|---------------------|
    |  Name	 |  DMSReplication-myinitials  |
    |  Descriptive Amazon Resource name(ARN)	 |  leave blank  |
    |  Description	 |  (Tùy chọn) **_Replication server for Database Migration_** hoặc bất kỳ miêu tả nào  |
    |  Instance Class	 |  `**dms.c5.xlarge**`  |
    |  Engine version	 |  Giữ nguyên giá trị mặc định  |
    |  High Availability/Multi-AZ	 |  Dev or Test workload(Single-AZ)  |
    |  Allocated storage (GB)	 |  50  |
    |  VPC	 |  VPC ID với DMSVpc trong tên - Cần mở danh sách  |
    |  Publicly accessible	 |  No/unchecked  |
    |  Advanced -> VPC Security Group(s)	 |  default  |

    ![Procedural code change](/images/3/2/2/0004.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0005.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0006.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0007.png?width=90pc)

{{% notice note %}}
**Lưu ý 1:** Nếu bạn gặp lỗi **"IAM Role arn aws iam ########## role dms-vpc-role không được cấu hình đúng"**, hãy nhấn Hủy và lặp lại các bước trên, nó sẽ hoạt động ở lần thử thứ hai.  
\
\
**Lưu ý 2:** Việc tạo máy sao chép sẽ mất vài phút. Trong khi chờ đợi máy sao chép này được tạo, chúng ta sẽ sử dụng máy đã được tạo cho bạn như một phần của quá trình xây dựng môi trường đã có sẵn.
{{% /notice %}}