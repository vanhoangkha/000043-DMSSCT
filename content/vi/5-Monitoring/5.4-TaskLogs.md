---
title: "Task Logs"
weight: 4
chapter: false
pre: "<b> 5.4. </b>"
---

AWS DMS được tích hợp **Dịch vụ AWS CloudWatch** để ghi lại thông tin tác vụ trong quá trình di chuyển. Bạn có tùy chọn bật ghi log cho từng tác vụ DMS. Sau khi bật, log sẽ liên tục được xuất bản thông qua log cloudWatch.

1. Để xem log tác vụ DMS, hãy truy cập [**Bảng điều khiển AWS DMS**](https://console.aws.amazon.com/dms/v2/home#/dashboard) và nhấp vào **Nhiệm vụ sao chép** ở cột bên trái. Nhấp vào tác vụ từ danh sách ở bên phải. Khi bạn vào trang **Nhiệm vụ DMS**, hãy tìm nút **View logs** ở góc trên bên phải. Bạn cũng có thể mở log tác vụ từ tab **Overview details** trên cùng một trang.

    ![](/images/5/4/0001.png?width=80pc)

1. Khi bạn nhấp vào **View logs**, một cửa sổ mới trong dịch vụ CloudWatch sẽ mở ra. Theo mặc định, bạn sẽ thấy log mới nhất trên màn hình. Ở cuối trang, bạn sẽ có nút tiếp tục. Khi bạn nhấp vào đó, log sẽ tự động cuộn khi có log mới được tạo.

    ![](/images/5/4/0002.png?width=80pc)

Đôi khi bạn có thể cần lọc log để tìm kiếm thông báo cụ thể trong log. Bạn có thể thực hiện bằng cách sử dụng mẫu lọc trong **Log events**.

{{% notice note %}}
Bạn nên luôn bật ghi log tác vụ DMS tại thời điểm tạo. Bạn sẽ cần thêm quyền trên dịch vụ AWS CloudWatch để xem các tác vụ DMS.
{{% /notice %}}