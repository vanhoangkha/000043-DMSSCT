---
title: "Create a DMS Migration Task"
weight: 4
chapter: false
pre: "<b> 3.2.4. </b>"
---

AWS DMS sử dụng **Nhiệm vụ di chuyển cơ sở dữ liệu** để di chuyển dữ liệu từ nguồn sang cơ sở dữ liệu đích.

1. Nhấp vào **Nhiệm vụ di chuyển cơ sở dữ liệu** trên menu bên trái, sau đó nhấp vào nút **Tạo nhiệm vụ** ở góc trên bên phải.

    ![Tạo nhiệm vụ](/images/3/2/4/0001.png?width=80pc)

1. Tạo nhiệm vụ di chuyển dữ liệu với các giá trị sau để di chuyển cơ sở dữ liệu `**dms_sample**`.

    {{% expand "Mở phần này nếu loại CSDL đích là Aurora (MySQL)" %}}

| Tham số | Giá trị |
|------------|---------------|
| Mã định danh nhiệm vụ | `source-to-AuroraMySQL-target` |
| Phiên bản sao chép | `cfn-dmsreplication` hoặc chỉ `dmsreplication` |
| Điểm cuối cơ sở dữ liệu nguồn | cơ sở dữ liệu nguồn của bạn (SQL Server, Oracle, v.v.) từ bước trước |
| Điểm cuối cơ sở dữ liệu đích | `aurora-target` hoặc `cfn-auroramysqlinstance` hoặc bất kỳ tên nào bạn đặt ở bước trước |
| Loại di chuyển | Di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra |
| Chế độ dừng CDC | Không sử dụng chế độ dừng CDC tùy chỉnh |
| Tạo bảng khôi phục trên DB mục tiêu | để trống/không chọn |
| Chế độ chuẩn bị bảng mục tiêu | Không làm gì cả (không phải mặc định) |
| Dừng tác vụ sau khi tải đầy đủ hoàn tất | Không dừng |
| Cài đặt cột LOB / Bao gồm các cột LOB trong bản sao | Chế độ LOB giới hạn |
| Kích thước LOB tối đa (KB) | 32 |
| Xác thực dữ liệu | Không chọn |
| Nhật ký tác vụ / Bật nhật ký CloudWatch | Kiểm tra Bật nhật ký CloudWatch (không phải mặc định) |
| Bối cảnh nhật ký | để chọn lấy mức mặc định khi ghi nhật ký |
| Áp dụng tối ưu hóa theo lô nếu hiển thị | **Bật áp dụng tối ưu hóa theo lô** -> Không chọn |

    {{% /expand %}}

    {{% expand "Mở phần này nếu loại CSDL đích là Aurora (PostgreSQL)" %}}

| Tham số | Giá trị |
|------------|----------------|
| Mã định danh tác vụ | `source-to-aupg-migration-task` |
| Phiên bản sao chép | `cfn-dmsreplication` hoặc chỉ `dmsreplication` |
| Điểm cuối cơ sở dữ liệu nguồn | cơ sở dữ liệu nguồn của bạn (SQL Server, Oracle, v.v.) từ bước trước |
| Điểm cuối cơ sở dữ liệu mục tiêu | `aurora-target` hoặc `cfn-aurorapostgresql*` hoặc bất kỳ tên nào bạn đặt ở bước trước |
| Loại di chuyển | Di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra |
| Chế độ dừng CDC | Không sử dụng chế độ dừng CDC tùy chỉnh |
| Tạo bảng khôi phục trên DB mục tiêu | để trống/không chọn |
| Chế độ chuẩn bị bảng mục tiêu | Không làm gì cả (không phải mặc định) |
| Dừng tác vụ sau khi tải đầy đủ hoàn tất | Không dừng |
| Cài đặt cột LOB / Bao gồm các cột LOB trong bản sao | Chế độ LOB giới hạn |
| Kích thước LOB tối đa (KB) | 32 |
| Xác thực dữ liệu | Không được chọn |
| Nhật ký tác vụ / Bật nhật ký CloudWatch | Kiểm tra Bật nhật ký CloudWatch (không phải mặc định) |
| Bối cảnh nhật ký | để lại trạng thái được chọn, lấy mức mặc định khi ghi nhật ký |
| Áp dụng tối ưu hóa theo lô nếu hiển thị | **Bật áp dụng tối ưu hóa theo lô** -> Không được chọn |

    {{% /expand %}}

    {{% expand "Mở phần này nếu loại CSDL đích là RDS Microsoft SQL Server:" %}}

| Tham số | Giá trị |
|------------|---------------|
| Mã định danh tác vụ | `source-to-sqlserver-target` |
| Phiên bản sao chép | `cfn-dmsreplication` hoặc chỉ `dmsreplication` |
| Điểm cuối cơ sở dữ liệu nguồn | cơ sở dữ liệu nguồn SQL Server hoặc Oracle, v.v. của bạn từ bước trước |
| Điểm cuối cơ sở dữ liệu mục tiêu | `sqlserver-target` hoặc bất kỳ tên nào bạn đặt ở bước trước |
| Kiểu di chuyển | Di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra |
| Chế độ dừng CDC | Không sử dụng chế độ dừng CDC tùy chỉnh |
| Tạo bảng khôi phục trên DB mục tiêu | để trống/không chọn |
| Chế độ chuẩn bị bảng mục tiêu | Không làm gì cả (không phải mặc định) |
| Dừng tác vụ sau khi tải đầy đủ hoàn tất | Không dừng |
| Cài đặt cột LOB / Bao gồm các cột LOB trong bản sao | Chế độ LOB giới hạn |
| Kích thước LOB tối đa (KB) | 32 |
| Xác thực dữ liệu | Không chọn |
| Nhật ký tác vụ / Bật nhật ký CloudWatch | Kiểm tra Bật nhật ký CloudWatch (không phải mặc định) |
| Bối cảnh nhật ký | để chọn lấy mức mặc định khi ghi nhật ký |
| Áp dụng tối ưu hóa theo lô nếu có thể nhìn thấy | **Bật áp dụng tối ưu hóa theo lô** -> Không chọn |

    {{% /expand %}}

    {{% expand "Mở phần này nếu loại CSDL đích là Oracle:" %}}

| Tham số | Giá trị |
|------------|---------------|
| Mã định danh tác vụ | `source-to-oracle-target` |
| Phiên bản sao chép | `cfn-dmsreplication` hoặc chỉ `dmsreplication` |
| Điểm cuối cơ sở dữ liệu nguồn | cơ sở dữ liệu nguồn SQL Server hoặc Oracle, v.v. của bạn từ bước trước |
| Điểm cuối cơ sở dữ liệu mục tiêu | `oracle-target` hoặc bất kỳ tên nào bạn đặt ở bước trước |
| Loại di chuyển | Di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra |
| Chế độ dừng CDC | Không sử dụng chế độ dừng CDC tùy chỉnh |
| Tạo bảng khôi phục trên DB mục tiêu | để trống/không chọn |
| Chế độ chuẩn bị bảng mục tiêu | Không làm gì cả (không phải mặc định) |
| Dừng tác vụ sau khi tải đầy đủ hoàn tất | Không dừng |
| Cài đặt cột LOB / Bao gồm các cột LOB trong bản sao chép | Chế độ LOB giới hạn |
| Kích thước LOB tối đa (KB) | 32 |
| Xác thực dữ liệu | Không chọn |
| Nhật ký tác vụ / Enable CloudWatch logs | Kiểm tra Bật CloudWatch logs (không phải mặc định) |
| Log Context | để nguyên trạng thái đánh dấu, lấy mức mặc định khi ghi nhật ký |
| Tối ưu hóa theo lô áp dụng nếu hiển thị | **Bật tối ưu hóa theo lô áp dụng** -> Bỏ chọn |

    {{% /expand %}}

    {{% expand "Mở phần này nếu loại CSDL đích là Amazon S3:" %}}
| Tham số | Giá trị |
|------------|---------------|
| Mã định danh tác vụ | `source-to-s3-target` |
| Phiên bản sao chép | `cfn-dmsreplication` hoặc chỉ `dmsreplication` |
| Điểm cuối cơ sở dữ liệu nguồn | cơ sở dữ liệu nguồn SQL Server hoặc Oracle, v.v. của bạn từ bước trước |
| Điểm cuối cơ sở dữ liệu mục tiêu | `s3-target` hoặc bất kỳ tên nào bạn đặt ở bước trước |
| Loại di chuyển | Di chuyển dữ liệu hiện có và sao chép các thay đổi đang diễn ra |
| Chế độ dừng CDC | Không sử dụng chế độ dừng CDC tùy chỉnh |
| Tạo bảng khôi phục trên DB mục tiêu | để trống/bỏ chọn |
| Chế độ chuẩn bị bảng mục tiêu | Không làm gì cả (không phải mặc định) |
| Dừng tác vụ sau khi tải đầy đủ hoàn tất | Không dừng |
| Cài đặt cột LOB / Bao gồm các cột LOB trong bản sao | Chế độ LOB giới hạn |
| Kích thước LOB tối đa (KB) | 32 |
| Xác thực dữ liệu | Bỏ chọn |
| Nhật ký tác vụ / Bật nhật ký CloudWatch | Kiểm tra Bật nhật ký CloudWatch (không phải mặc định) |
| Bối cảnh nhật ký | bỏ chọn lấy mức mặc định khi ghi nhật ký |
| Áp dụng tối ưu hóa theo lô nếu hiển thị | Bật áp dụng tối ưu hóa theo lô Bỏ chọn |
    {{% /expand %}}

    ![Tạo tác vụ](/images/3/2/4/0002.png?width=80pc)

    ![Tạo tác vụ](/images/3/2/4/0003.png?width=80pc)

1. Mở rộng phần **Ánh xạ bảng** và chọn **Trình hướng dẫn** cho chế độ chỉnh sửa.

    ![Create task](/images/3/2/4/0004.png?width=80pc)

1. Nhấp vào nút **Thêm quy tắc lựa chọn mới** và nhập các giá trị sau vào biểu mẫu:

    - Đối với nguồn Oracle, hãy sử dụng:

    | Tham số | Giá trị |
    |------------|---------------|
    | Sơ đồ | DMS_SAMPLE% |
    | Tên bảng | % |
    | Hành động | Bao gồm |

    - Đối với nguồn SQL Server, hãy sử dụng:

    | Tham số | Giá trị |
    |----------|------------|
    | Sơ đồ | dbo% |
    | Tên bảng | % |
    | Hành động | Bao gồm |

{{% notice tip %}}

Nếu màn hình **Create Task** không nhận dạng bất kỳ sơ đồ nào, hãy đảm bảo quay lại màn hình điểm cuối và nhấp vào điểm cuối của bạn. Cuộn xuống cuối trang và nhấp vào Nút Làm mới **(⟳)** trong phần **Schemas**. Nếu lược đồ của bạn vẫn không hiển thị trên màn hình **Create Task**, hãy nhấp vào tab Hướng dẫn và chọn thủ công lược đồ `**dbo**` và tất cả các bảng.

{{% /notice %}}

5. Tiếp theo, hãy mở rộng phần Quy tắc chuyển đổi và nhấp vào Thêm quy tắc chuyển đổi mới bằng cách sử dụng các giá trị sau:

    - Đối với nguồn Oracle, hãy sử dụng:

        - Quy tắc 1:

        | Tham số | Giá trị |
        |----------|------------|
        | Mục tiêu | Lược đồ |
        | Tên lược đồ | DMS_SAMPLE |
        | Hành động | Viết chữ thường |

        - Quy tắc 2:

        | Tham số | Giá trị |
        |----------|------------|
        | Mục tiêu | Bảng |
        | Tên lược đồ | DMS_SAMPLE |
        | Tên bảng | % |
        | Hành động | Viết chữ thường |

        - Quy tắc 3:

        | Tham số | Giá trị |
        |----------|------------|
        | Mục tiêu | Cột |
        | Tên lược đồ | `DMS_SAMPLE` |
        | Tên bảng | `%` |
        | Tên cột | `%` |
        | Hành động | Viết chữ thường |

    - Đối với SQL Server Source, hãy sử dụng:

    | Tham số | Giá trị |
    |----------|------------|
    | Mục tiêu | Sơ đồ |
    | Tên sơ đồ | `%` (nếu đích là Microsoft SQL) hoặc `%dbo` |
    | Hành động | Đổi tên thành: `dms_sample_target` |

1. Bỏ chọn **Bật đánh giá trước khi di chuyển** để thu gọn phần này cho hội thảo của chúng tôi vì phần này không có thời gian và không bắt buộc.

1. Sau khi nhập các giá trị, hãy đảm bảo **Cấu hình khởi động tác vụ di chuyển** được đặt thành **Tự động bắt đầu khi tạo**, sau đó nhấp vào **Tạo tác vụ**.

![Create task](/images/3/2/4/0005.png?width=80pc)

1. Tại thời điểm này, tác vụ sẽ bắt đầu chạy và sao chép dữ liệu từ cơ sở dữ liệu `**dms_sample**` đang chạy trên nguồn của bạn sang phiên bản Amazon Aurora RDS (PostgreSQL). Lưu ý tác vụ DMS sẽ mất một lúc để tạo (**Status=createing**), sau đó sẽ chuyển sang **Status=Ready**, tiếp theo là **Status=Starting**, rồi **Status=Running**. Bạn có thể sử dụng nút làm mới mũi tên tròn để cập nhật trạng thái cho tác vụ.

![Create task](/images/3/2/4/0006.png?width=80pc)