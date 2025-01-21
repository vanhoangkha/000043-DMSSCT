---
title: "Giám sát sự kiện mở rộng quy mô"
weight: 2
chapter: false
pre: "<b> 4.2.2. </b>"
---

Khi tải DML được tạo trên cơ sở dữ liệu nguồn, hãy theo dõi bảng điều khiển AWS DMS và bảng thông tin CloudWatch để biết mức sử dụng dung lượng DMS. Khi tải vượt quá **80%**, bạn sẽ thấy sự kiện Scale-up được kích hoạt.

### Biểu đồ sử dụng dung lượng

1. Để truy cập số liệu CloudWatch cho DMS Serverless Replication, hãy điều hướng đến bảng điều khiển AWS DMS, chọn **"Serverless replications"** trong thanh bên trái, chọn bản sao không có máy chủ của bạn và tìm biểu đồ **Capacity Utilization** trong tab **Monitoring**.

    Bạn có thể xem chi tiết hơn bằng cách nhấp vào **Maximizing Capacity Utilization**.

    ![](/images/4/2/2/0001.png?width=80pc)

2. Khi tải vượt quá **80%**, bạn có thể kiểm tra nhật ký sau 10 phút để xác nhận rằng sự kiện đã kích hoạt việc mở rộng DCU.

Như vậy, chúng ta đã kết thúc bài thực hành về Mở rộng quy mô DMS Serverless. Vui lòng chuyển sang bài thực hành tiếp theo để tìm hiểu cách theo dõi sự kiện thu hẹp quy mô.