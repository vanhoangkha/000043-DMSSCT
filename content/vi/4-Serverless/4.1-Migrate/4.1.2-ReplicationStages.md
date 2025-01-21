---
title: "AWS DMS Serverless - Các giai đoạn sao chép"
weight: 2
chapter: false
pre: "<b> 4.1.2. </b>"
---

Để xử lý các tài nguyên cần thiết cho việc sao chép dữ liệu, AWS DMS Serverless chuyển đổi qua các giai đoạn khác nhau phản ánh các quy trình nội bộ của dịch vụ. Khi bắt đầu sao chép, AWS DMS Serverless sẽ đánh giá khối lượng công việc, phân bổ các tài nguyên cần thiết và bắt đầu sao chép dữ liệu dựa trên các trạng thái sau.

1. **Initializing (Khởi tạo):** AWS DMS Serverless bắt đầu sao chép bằng cách thiết lập các tham số cần thiết cho tác vụ. Việc khởi tạo mất khoảng 2 đến 5 phút.

1. **Preparing Metadata Resources (Chuẩn bị tài nguyên siêu dữ liệu):** Hệ thống thiết lập kết nối với cơ sở dữ liệu nguồn của bạn để thu thập siêu dữ liệu cần thiết cho việc sao chép. Giai đoạn này có thể mất khoảng 15 đến 20 phút.

1. **Testing Connection (Kiểm tra kết nối):** DMS Serverless kiểm tra xem các kết nối đến cả cơ sở dữ liệu nguồn và đích có hoạt động bình thường không. Việc kiểm tra kết nối nguồn và đích có thể mất tới 2 đến 5 phút.

1. **Fetching Metadata (Lấy siêu dữ liệu):** Siêu dữ liệu từ nguồn được lấy ra, cho phép DMS Serverless phân tích cấu trúc cơ sở dữ liệu và nhu cầu về dung lượng. Có thể mất tới 5 phút để phân tích siêu dữ liệu.

1. **Calculating Capacity (Tính toán dung lượng):** Dựa trên siêu dữ liệu đã truy xuất, DMS ước tính lượng tài nguyên cần thiết để xử lý các tác vụ sao chép. Tác vụ này có thể mất từ ​​1 đến 2 phút.

1. **Provisioning Capacity (Cung cấp dung lượng):** AWS DMS phân bổ các tài nguyên tính toán cần thiết dựa trên các phép tính trước đó để hỗ trợ sao chép. Có thể mất từ ​​15 đến 20 phút để cung cấp sao chép không có máy chủ.

1. **Replication Starting (Bắt đầu sao chép):** Sao chép dữ liệu bắt đầu, bao gồm các giai đoạn như Full Load và Ghi lại dữ liệu thay đổi (CDC), giai đoạn này ghi lại các thay đổi đang diễn ra. Phải mất từ ​​1 đến 2 phút để bắt đầu quá trình sao chép.

1. **Running (Đang chạy):** Sao chép liên tục hiện đang được tiến hành, giúp đồng bộ hóa các hệ thống nguồn và đích. Nó có thể chuyển sang trạng thái dừng dựa trên hành động của người dùng.