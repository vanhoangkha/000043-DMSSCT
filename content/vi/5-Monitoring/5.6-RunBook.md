---
title: "RunBook"
weight: 6
chapter: false
pre: "<b> 5.6. </b>"
---

Sổ tay hướng dẫn AWS DMS Monitoring cung cấp hướng dẫn chi tiết về giải pháp giám sát tự động được phát triển cho AWS Database Migration Service (DMS). Giải pháp được triển khai bằng Amazon Lambda với Python và AWS SDK, tự động hóa một số tác vụ giám sát và cảnh báo quan trọng cho toàn bộ nhóm tài nguyên DMS. Trọng tâm chính là tạo thiết lập giám sát và cảnh báo hợp nhất để đảm bảo tình trạng và hiệu suất của các phiên bản và tác vụ sao chép DMS.

Sổ tay hướng dẫn này triển khai các hoạt động giám sát sau:

1. Bảng điều khiển Amazon CloudWatch tập trung để xem xét mức tiêu thụ tài nguyên (ví dụ: CPU, Bộ nhớ, Sử dụng lưu trữ hoặc Sử dụng dung lượng cho DMS Serverless, v.v.) của tất cả các Phiên bản AWS DMS Classic.

1. Bảng điều khiển Amazon CloudWatch tập trung để xem xét các Số liệu CDC (Ghi lại dữ liệu thay đổi) như Độ trễ nguồn, Độ trễ mục tiêu, v.v. từ tất cả các tác vụ DMS.

1. Thiết lập thông báo sự kiện AWS DMS (Bao gồm thay đổi trạng thái như dừng, bắt đầu, lỗi, v.v. cho tất cả các phiên bản và tác vụ DMS) cho tất cả các phiên bản và tác vụ AWS DMS cổ điển.

1. Thiết lập cảnh báo Amazon CloudWatch hàng giờ cho Lỗi và Cảnh báo trong tất cả các lần di chuyển AWS DMS bao gồm AWS DMS Classic, di chuyển đồng nhất hoặc DMS Serverless. Người dùng có thể tùy chỉnh tần suất thông báo.

1. Thiết lập cảnh báo cho các phiên bản AWS DMS để thông báo khi ngưỡng vi phạm.

1. Thiết lập cảnh báo về các biện pháp thực hành tốt nhất của AWS DMS cho các phiên bản DMS và tác vụ DMS. Ví dụ: tập lệnh sẽ cảnh báo nếu có phiên bản DMS được bật quyền truy cập công khai hoặc phiên bản DMS cổ điển chưa sử dụng hoặc tác vụ DMS được bật ghi nhật ký gỡ lỗi.

Tất cả các hoạt động giám sát do giải pháp đặt đều có thể tùy chỉnh hoàn toàn, trong đó người dùng có thể chọn số liệu CloudWatch hoặc lọc nhật ký tác vụ cho các sự kiện đặc biệt.

Triển khai giải pháp một cú nhấp chuột bằng mẫu AWS CloudFormation này: [Triển khai AWS Database Migration Monitoring Runbook](https://github.com/aws-samples/aws-dms-monitoring-runbook/blob/main/scripts/dms_monitoring.yaml)

Làm theo hướng dẫn từng bước [AWS Database Migration Monitoring Runbook github](https://github.com/aws-samples/aws-dms-monitoring-runbook/).