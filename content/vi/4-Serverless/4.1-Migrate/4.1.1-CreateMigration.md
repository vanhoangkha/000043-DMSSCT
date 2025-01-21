---
title: "Tạo quá trình dịch chuyển serverless"
weight: 1
chapter: false
pre: "<b> 4.1.1. </b>"
---

Trong hướng dẫn từng bước này, bạn sẽ tạo Serverless Replication để di chuyển dữ liệu từ cơ sở dữ liệu Oracle hoặc SQL Server sang Amazon Aurora (tương thích với MySQL hoặc PostgreSQL).

Môi trường cho phòng thí nghiệm này bao gồm:

- Cơ sở dữ liệu nguồn (SQL Server hoặc Oracle).

- Một phiên bản Amazon Aurora được sử dụng làm cơ sở dữ liệu đích.

1. Truy cập [AWS DMS Console](https://console.aws.amazon.com/dms/v2/).
Trên trang **AWS DMS Console**, nhấp vào **Serverless replication**. **AWS DMS Serverless Replication** là một khái niệm mới tóm tắt các phiên bản và tác vụ thường thấy trong AWS DMS chuẩn.

1. Trên trang **Serverless replication**, nhấp vào nút **Create Replication**.

    ![](/images/4/1/1/0001.png?width=90pc)

1. **Cấu hình quá trình sao chép**

Cung cấp **tên** cho Serverless replication của bạn và Configure replication để kết nối với cơ sở dữ liệu nguồn và đích của bạn. Trong bước này, bạn sẽ cần chỉ định **Endpoint Nguồn và Đích**. Bạn cũng sẽ cấu hình sao chép để thực hiện tải đầy đủ (di chuyển dữ liệu hiện có) và bật **Sao lưu dữ liệu đang thay đổi (CDC)** để sao chép các thay đổi đang diễn ra từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích.

    |  Tham số	 |  Giá trị  |
    |--------------|-----------------|
    |  Task identifier	 |  `**dms-serverless-lab**`  |
    |  Source database endpoint	 |  Endpoint CSDL nguồn (SQL Server or Oracle) , Ví dụ: `**sql-server-source**`  |
    |  Target database endpoint	 |  Endpoint CSDL đích (MySQL or PostgreSQL) , Ví dụ: `**mysql-target**`  |
    |  Migration type	 |  Full Load and CDC ( Dịch chuyển cả CSDL đã có và đang cập nhật sau này)  |

    ![](/images/4/1/1/0002.png?width=90pc)

1. Configure Additional Settings

    |  Tham số	 |  Giá trị	 |  Giải thích  |
    |----------------|-----------|----------------|
    |  Target table preparation mode	 |  Do Nothing	 | Điều này đảm bảo rằng bất kỳ bảng hiện có nào trong cơ sở dữ liệu đích sẽ không bị xóa và các bảng không có trong cơ sở dữ liệu đích sẽ được tạo.  |
    |  Stop task after full load completes	 |  Don't stop	 |  Tùy chọn này cho phép quá trình sao chép tiếp tục chạy ngay cả sau khi quá trình tải đầy đủ ban đầu hoàn tất, do đó có thể xử lý những thay đổi đang diễn ra.  |
    |  Include LOB columns in replication	 |  Limited LOB mode	 |  Thiết lập này đảm bảo rằng các cột đối tượng lớn (LOB) được đưa vào quá trình sao chép với một số hạn chế nhất định để tối ưu hóa hiệu suất.  |
    |  Max LOB size	 |  32 KB	 |  Phần này chỉ định kích thước tối đa cho các cột LOB sẽ được sao chép.  |
    |  Turn on validation	 |  Keep it unchecked i.e. OFF	 |  Việc xác thực có thể tốn nhiều tài nguyên và không phải lúc nào cũng cần thiết cho mọi tình huống.  |
    |  Turn on cloudwatch logs	 |  turn it on and keep all the "default".	 |  Điều này sẽ cho phép bạn theo dõi quá trình sao chép và khắc phục mọi sự cố phát sinh.  |

    ![](/images/4/1/1/0003.png?width=90pc)
    
    ![](/images/4/1/1/0004.png?width=90pc)

1. Thiết lập Quy tắc lựa chọn bảng

    _**Lưu ý:** Chỉ mở rộng cho nguồn trong kịch bản của bạn. Bạn có thể bỏ qua các nguồn khác._

    - Đối với nguồn Oracle, hãy sử dụng:

    |  Tham số	 |  Giá trị  |
    |------------|---------------|
    |  Schema	 |  DMS_SAMPLE%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |

    - Đối với nguồn SQL Server, hãy sử dụng:

    |  Tham số	 |  Giá trị  |
    |----------|------------|
    |  Schema	 |  dbo%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |

    ![](/images/4/1/1/0005.png?width=90pc)

{{% notice note %}}
Nếu màn hình Create Task không nhận ra bất kỳ lược đồ nào, hãy đảm bảo quay lại màn hình điểm cuối và nhấp vào điểm cuối của bạn. Cuộn xuống cuối trang và nhấp vào Nút Làm mới (⟳) trong phần Schemas. Nếu lược đồ của bạn vẫn không hiển thị trên màn hình Create Task, hãy nhấp vào tab Guided và chọn thủ công lược đồ ‘dbo’ và tất cả các bảng.
{{% /notice %}}

6. **Thiết lập quy tắc chuyển đổi**
Quy tắc chuyển đổi cho phép bạn sửa đổi cấu trúc hoặc nội dung của dữ liệu khi dữ liệu được di chuyển. Mở rộng phần Quy tắc chuyển đổi và nhấp vào Thêm quy tắc chuyển đổi mới bằng các giá trị sau:

- Đối với nguồn Oracle, hãy sử dụng:

        - Rule 1:

        |  Tham số	 |  Giá trị  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Action	 |  Make lowercase  |

        - Rule 2:

        |  Tham số	 |  Giá trị  |
        |----------|------------|
        |  Target	 |  Table  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Table Name	 |  %  |
        |  Action	 |  Make lowercase  |

        - Rule 3:

        |  Tham số	 |  Giá trị  |
        |----------|------------|
        |  Target	 |  Column  |
        |  Schema Name	 |  `DMS_SAMPLE`  |
        |  Table Name	 |  `%`  |
        |  Column Name	 |  `%`  |
        |  Action	 |  Make lowercase  |

    - Đối với nguồn SQL Server, hãy đùng:

        |  Tham số	 |  Giá trị  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  `dbo`  |
        |  Action	 |  Rename to: `dms_sample_target`  |

        ![](/images/4/1/1/0006.png?width=90pc)

1. **Chỉ định Cài đặt liên quan đến Mạng**

    Trong cài đặt **Compute**, hãy chọn **VPC** và **Subnet** nơi bản sao sẽ được tạo. Ngoài ra, hãy chọn **nhóm bảo mật** thích hợp.

    |  Tham số	 |  Giá trị  |
    |----------|------------|
    |  VPC	 |  Chọn VPC ID chứa DMSVpc trong danh sách  |
    |  Subnet Group	 |  Subnet group mặc định trong VPC  |
    |  Security Groups	 |  Chọn security group bắt đầu với cfn-InstanceSecurityGroup-%  |
    |  AWS KMS Key	 |  `**aws/dms**`  |

1. **Chọn Vùng khả dụng**

    Trong phần **Availability**, hãy chọn tùy chọn khả dụng phù hợp với khối lượng công việc của bạn và chọn AZ cụ thể mà phiên bản chính của bạn sẽ hoạt động. Nếu bạn chọn **"No preference"**, AWS DMS sẽ tự động chọn AZ cho bạn.

    |  Tham số	 |  Giá trị  |
    |----------|------------|
    |  Availability	 |  Single-AZ  |
    |  Availability Zone	 |  No Preference  |

    ![](/images/4/1/1/0007.png?width=90pc)

1. **Chọn Đơn vị dung lượng DMS tối thiểu và tối đa (DCU)**

Trong Cài đặt dung lượng, Chọn Đơn vị dung lượng DMS tối thiểu và tối đa (DCU). Dung lượng tính toán sao chép trong AWS DMS được đo bằng Đơn vị dung lượng DMS (DCU). Mỗi DCU cung cấp 2 GiB bộ nhớ cùng với các tài nguyên tính toán và mạng tương ứng.

    |  Tham số	 |  Giá trị  |
    |----------|------------|
    |  Minimum DMS Capacity units (DCU)	 |  1  |
    |  Maximum DMS Capacity units (DCU)	 |  4  |

    ![](/images/4/1/1/0008.png?width=90pc)

1. **Xem lại và Tạo bản sao**

    Xem lại tất cả các cấu hình của bạn, sau đó bắt đầu bản sao không có máy chủ bằng cách nhấp vào **Tạo bản sao**.

1. Nếu tất cả các tham số đều chính xác và xác thực thành công thì bản sao mới tạo sẽ hiển thị trong **Bản sao không có máy chủ**.

    ![](/images/4/1/1/0009.png?width=90pc)


1. **Bắt đầu quá trình dịch chuyển**

    Để bắt đầu di chuyển dữ liệu từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích, hãy bắt đầu bản sao không có máy chủ. Chọn bản sao và, trong **Actions**, chọn **Start**.
    
    ![](/images/4/1/1/0010.png?width=40pc)

    Trên trang **Start replication**, Chọn **Don't stop CDC** rồi Nhấp vào **Start replication**.

    ![](/images/4/1/1/0011.png?width=90pc)

    Quá trình sao chép sẽ bắt đầu ngay lập tức.

    ![](/images/4/1/1/0012.png?width=90pc)

Quá trình này kết thúc quá trình tạo bản sao và bản sao của bạn hiện đang bắt đầu. Quá trình sao chép không có máy chủ bao gồm 8 giai đoạn, bạn có thể theo dõi trong cột Trạng thái. Vui lòng chuyển sang trang tiếp theo để biết tổng quan chi tiết về từng giai đoạn.