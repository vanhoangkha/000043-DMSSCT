---
title: "Create DMS Source and Target Endpoints"
weight: 3
chapter: false
pre: "<b> 3.2.3. </b>"
---

Bây giờ bạn đã có một phiên bản sao, bạn cần tạo các điểm cuối nguồn và đích cho cơ sở dữ liệu mẫu.

1. Nhấp vào liên kết **Điểm cuối** ở bên trái, sau đó nhấp vào **Tạo điểm cuối** ở góc trên bên phải.

    ![Bảng điều khiển DMS Endpoints](/images/3/2/3/0000.png?width=80pc)

1. Nhập thông tin sau để tạo một điểm cuối cho cơ sở dữ liệu nguồn **dms_sample**. Xin lưu ý rằng mật khẩu không được cung cấp dưới đây, bạn cần vào Secrets Manager và mở **DMSDBSecret** để tiết lộ mật khẩu SQL Server (giống như trước nếu bạn đã thực hiện điều này). Nó cũng nằm trong tab đầu ra của Cloudformation Stack đầu tiên dưới mật khẩu, tùy thuộc vào việc bạn sử dụng SQL Server hay Oracle:

    #### Nguồn Oracle:

    {{% expand "Mở phần này nếu loại cơ sở dữ liệu nguồn của bạn là Oracle" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------------|
|  Endpoint Type	 |  Source endpoint  |
|  Select RDS DB instance	 |  Checked for Oracle others để trống  |
|  RDS Instance	 |  <StackName>-SourceOracleDB  |
|  Endpoint Identifier	 |  `oracle-source` hoặc nhận giá trị tự xuất hiện  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Source Engine	 |  oracle  |
|  Access to Endpoint database Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  < SourceOracleEndpoint Should auto populate >  |
|  Port	 |  1521  |
|  SSL Mode	 |  none  |
|  User Name	 |  dbadmin  |
|  Password	 |  See Cloudformation **Output** tab & **DMSDBSecretP** or look it up in AWS Secrets Manager for Oracle  |
|  SID/Service Name	 |  `ORACLEDB`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  **cfn-DMSReplication** or **DMSReplication** or the one you created if it is ready  |

    {{% /expand %}}

    #### Microsoft SQL Server source:

    {{% expand "Expand this if your source DB type is Microsoft SQL Server" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------------|
|  Endpoint Type	 |  Source endpoint  |
|  Endpoint Identifier	 |  `sqlserver-source`  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Source Engine	 |  Microsoft SQL Server  |
|  Access to Endpoint database Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  < địa chỉ ip / tên miền của EC2 > - Tìm trong tab **Output** của CFn stack  |
|  Port	 |  1433  |
|  SSL Mode	 |  none  |
|  User Name	 |  dbadmin  |
|  Password	 |  Xem Cloudformation **Output** tab & **DMSDBSecretPSQLServer** hoặc tra cứu tróng AWS Secrets Manager  |
|  Database Name	 |  	`dms_sample`  |
|  Test endpoint connection -> VPC	 |  <VPC ID với DMSVpc trong tên - từ bước Thiết Lập Môi Trường>  |
|  Replication Instance	 |  **cfn-DMSReplication** hoặc **DMSReplication** - nếu máy đã sẵn sàng  |
|  Endpoint Settings  |  mở mũi tên, kiểm tra **_"Use Endpoint connection attributes"_** sau đó thêm **_setUpMsCdcForTables=true_** vào hộp văn bản  |

    {{% /expand %}}

    ![Endpoint Console](/images/3/2/3/0002.png?width=80pc)
    ![Endpoint Console](/images/3/2/3/0003.png?width=80pc)
    ![Endpoint Console](/images/3/2/3/0004.png?width=80pc)

1. Once the information has been entered, select the existing DMS Replcation instance (the one without your initials) and click **Run Test**. When the status turns to successful, click **Create endpoint**.

    ![Endpoint Console](/images/3/2/3/0005.png?width=80pc)


1. Thực hiện các bước tương tự để tạo một điểm cuối khác cho Cơ sở dữ liệu Aurora RDS đích (**dms_sample_dbo** hoặc **dms_sample** tùy thuộc vào cơ sở dữ liệu nguồn của bạn) sử dụng các giá trị sau. Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần truy cập vào Secrets Manager và mở DMSDBSecret để tiết lộ mật khẩu SQL Server. Nó cũng có trên tab đầu ra của Cloudformation Stack đầu tiên dưới mật khẩu SQL Server (đúng là đây là mysql nhưng mật khẩu cho sql server và mysql trong trường hợp này là giống nhau):

    #### CSDL đích Aurora (MySQL):

    {{% expand "Mở phần này nếu CSDL đích của bạn là Aurora (MySQL)" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked for all DB targets  |
|  Select RDS DB instance	 |  <StackName>-AuroraMySQLInstance  |
|  Endpoint Identifier	 |  aurora-mysql-target  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Target Engine	 |  Amazon Aurora MySQL  |
|  Access to Endpoint database Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  `**TargetAuroraMySQLEndpoint**` hoặc giá trị sẽ tự điền  |
|  Port	 |  3306  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  Xem Cloudformation Output tab & DMSDBSecretP hoặc tra trong AWS Secrets Manager  |
|  Test endpoint connection -> VPC	 |  <VPC ID with DMSVpc in the name from Environment Setup Step>  |
|  Replication Instance	 |  `**cfn-DMSReplication**`, `**DMSReplication**` hoặc bất kỳ tên nào bạn đã gán cho máy này  |

    {{% /expand %}}

    #### CSDL đích Aurora (PostgreSQL):

    {{% expand "Mở phần này nếu CSDL đích của bạn là Aurora (PostgreSQL)" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Checked for all DB targets  |
|  Select RDS DB instance	 |  <StackName>-AuroraMySQLInstance  |
|  Endpoint Identifier	 |  `**aurora-postgresql-target**` hoặc giá trị sẽ tự điền  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Target Engine	 |  Amazon Aurora PostgreSQL  |
|  Access to Endpoint database Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  `**TargetAuroraPostgreSQLEndpoint**` hoặc giá trị sẽ tự điền  |
|  Port	 |  5432  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  Xem Cloudformation Output tab & DMSDBSecretP hoặc tra trong AWS Secrets Manager  |
|  Test endpoint connection -> VPC	 |  <VPC ID với DMSVpc trong tên- từ bước cài đặt môi trường>  |
|  Replication Instance	 |  `**cfn-DMSReplication**` or `**DMSReplication**` hoặc một tên bạn đã gán  |

    {{% /expand %}}

    #### RDS Microsoft SQL Server target:

    {{% expand "Mở phần này nếu dạng CSDL đích là RDS Microsoft SQL Server:" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Tích tất cả các nguồn  |
|  Select RDS DB instance	 |  <StackName>-TargetSQLServer  |
|  Endpoint Identifier	 |  `**sqlserver-target**` hoặc tên được tự động điền  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Target Engine	 |  Microsoft SQL Server  |
|  **Access to Endpoint database** Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  TargetSqlServerEndpoint (có thể sẽ tự động được điền)  |
|  Port	 |  1433  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  Xem Cloudformation Output tab & DMSDBSecretP hoặc tìm trong AWS Secrets Manager - giá trị kết thúc bằng **RDSDBSecret**  |
|  Database Name	 |  `**dms_sample_target**`  |
|  Test endpoint connection -> VPC	 |  <VPC ID with **DMSVpc** in the name from Environment Setup Step>  |
|  Replication Instance	 |  `**cfn-dmsreplication**` or just `**dmsreplication**`  |

    {{% /expand %}}

    #### RDS Oracle target:

    {{% expand "Mở phần này nếu dạng CSDL đích là Oracle:" %}}

|  Tham số	 |  Giá trị  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Select RDS DB instance	 |  Đánh dấu mọi CSDL đích  |
|  Select RDS DB instance	 |  < StackName >-TargetOracleDB  |
|  Endpoint Identifier	 |  **oracle-target** hoặc một giá trị được tự động điền  |
|  Descriptive Amazon Resource Name (nếu có)	 |  để trống  |
|  Target Engine	 |  oracle  |
|  **Access to Endpoint database** Radio Button	 |  Nhấp/Chọn **Provide access information Manually**  |
|  Server Name	 |  < TargetOracleEndpoint > should auto populate  |
|  Port	 |  1521  |
|  SSL Mode	 |  none  |
|  User Name	 |  `**dbadmin**`  |
|  Password	 |  Xem **Cloudformation Output** tab > `**DMSDBSecretP**` or hoặc tra trong AWS Secrets Manager - Oracle  |
|  Database Name	 |  `**TARGETDB**`  |
|  Test endpoint connection -> VPC	 |  <VPC ID chứa **DMSVpc** trong tên - từ bước **Cài đặt môi trường**>  |
|  Replication Instance	 |  `**cfn-dmsreplication**` or just `**dmsreplication**`  |

    {{% /expand %}}

    #### Amazon S3 Target

    {{% expand "Mở phần này nếu dạng CSDL đích là Amazon S3:" %}}
|  Tham số	 |  Giá trị  |
|----------------|-----------------|
|  Endpoint Type	 |  Target endpoint  |
|  Endpoint Identifier	 |  `**S3-target**`  |
|  Descriptive Amazon Resource Name	 |  để trống  |
|  Target Engine	 |  Amazon S3  |
|  Server Name	 |  < ARN của `**dms-migration-role**` >  |
|  Bucket Name	 |  < Tên S3 Bucket >  |
|  Bucket folder	 |  `**dmstargetfolder**`  |
    {{% /expand %}}

1. Sau khi nhập thông tin, hãy chọn phiên bản DMS Replcation hiện tại (phiên bản không có chữ viết tắt của bạn) và nhấp vào **Run Test**. Khi trạng thái chuyển sang thành công, hãy nhấp vào **Create endpoint**.

    ![Endpoint Console](/images/3/2/3/0006.png?width=80pc)