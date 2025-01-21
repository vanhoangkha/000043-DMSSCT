---
title: "Giám sát sự kiện thu nhỏ quy mô"
weight: 3
chapter: false
pre: "<b> 4.2.3. </b>"
---

Không giống như việc tăng quy mô, phản ứng mạnh mẽ với tải tăng trên máy chủ nguồn, việc giảm quy mô diễn ra dần dần hơn. Quá trình giảm quy mô mất một thời gian để điều chỉnh dung lượng, cho phép chuyển đổi mượt mà hơn khi nhu cầu trên hệ thống nguồn giảm.

Sau khi tải CDC đã bắt kịp, thời gian làm mát là trong một giờ, trong đó tác vụ không có máy chủ DMS kích hoạt sự kiện giảm quy mô của DCU.

- Tác vụ không có máy chủ DMS hiện được giảm quy mô xuống còn 4 DCU

- Đầu ra của nhật ký CloudWatch cho thấy sao chép không có máy chủ giảm quy mô từ 8 DCU xuống 4 DCU

Bây giờ bạn đã hoàn thành mô-đun không có máy chủ. Nếu bạn đang chạy trong tài khoản của riêng mình, hãy đảm bảo hoàn thành phần dọn dẹp sự kiện [Dọn dẹp tài nguyên và môi trường](../../7-CleanUp/).