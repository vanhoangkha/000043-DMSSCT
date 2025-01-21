---
title: "Thông báo sự kiện"
weight: 2
chapter: false
pre: "<b> 5.2. </b>"
---

AWS DMS tạo ra nhiều sự kiện khác nhau ở cấp độ tác vụ và phiên bản DMS mà bạn có thể đăng ký. AWS DMS sử dụng Amazon Simple Notification Service (Amazon SNS) để cung cấp thông báo khi sự kiện AWS DMS xảy ra.

1. Để tạo **DMS event notification**, trước tiên bạn phải tạo ****event subscriptions (bản theo dõi sự kiện)**. Để tạo đăng ký sự kiện DMS, hãy truy cập [**Bảng điều khiển AWS DMS**](https://console.aws.amazon.com/dms/v2/home#dashboard) và nhấp vào **Event Subscriptions** ở cột bên trái. Nhấp vào nút **Create event subscription**.

    ![](/images/5/2/0001.png?width=80pc)

1. Trên trang **create event subscription**, hãy cung cấp tên đăng ký. Sau đó chọn **target (mục tiêu)** để thông báo. Đối với phòng thí nghiệm này, chúng tôi sẽ sử dụng chủ đề email. Nhập tên chủ đề và địa chỉ email. Vui lòng đảm bảo rằng bạn/nhóm của bạn có quyền truy cập vào địa chỉ email được cung cấp tại đây. AWS DMS/SNS sẽ đẩy thông báo đến email đã cho. Tùy chọn, nếu bạn đã tạo chủ đề, bạn có thể chọn tùy chọn **Existing topics (Chủ đề hiện có)** và chọn chủ đề từ danh sách.

    ![](/images/5/2/0002.png?width=80pc)

1. Đối với nguồn sự kiện, bạn có thể chọn **replication-instance** hoặc **replication-task**. Đối với phòng thí nghiệm này, chúng ta sẽ chọn **replication-task**. Từ **Event categories**, chúng ta sẽ chọn **All event categories** và từ **replication tasks**, chúng ta sẽ chọn *All taks**. Sau đó, gửi tạo sự kiện bằng cách nhấp vào nút **Create event subscription**.

    ![](/images/5/2/0003.png?width=80pc)

1. Sau khi đăng ký sự kiện được tạo, hãy kiểm tra trạng thái và xác minh rằng đăng ký đã chuyển thành **Active** (đang hoạt động).

    ![](/images/5/2/0004.png?width=80pc)

1. Sau khi đăng ký sự kiện được tạo, hãy điều hướng đến [**Bảng điều khiển đăng ký AWS SNS**](https://console.aws.amazon.com/sns/v3/home#/subscriptions). Bây giờ, hãy chọn đăng ký do AWS DMS tạo bằng cách xác minh cột **chủ đề**. **Dịch vụ thông báo đơn giản AWS (SNS)** sẽ gửi email có liên kết xác nhận đến địa chỉ email bạn đã cung cấp ở bước 2. Trạng thái đăng ký sẽ ở **đang chờ xác nhận**.

1. Tại thời điểm này, bạn sẽ cần truy cập email do AWS SNS gửi và **Xác nhận đăng ký**.

    ![](/images/5/2/0005.png?width=80pc)

1. Ngay sau khi nhận được xác nhận, trạng thái đăng ký AWS SNS sẽ thay đổi thành **đã xác nhận**. Bây giờ bạn đã sẵn sàng nhận thông báo qua email cho các sự kiện AWS DMS.

1. Để kiểm tra thông báo sự kiện, hãy tiếp tục và thực hiện một số hành động trên phiên bản sao chép DMS. Ví dụ: tạo phiên bản sao chép mới/khởi động lại phiên bản/thay đổi lớp phiên bản sao chép, v.v. Để xác minh các sự kiện DMS được tạo cho các hoạt động này, trên bảng điều khiển DMS, hãy chọn **Sự kiện** từ cột bên trái. Như trong phòng thí nghiệm này, chúng tôi đã tạo thông báo sự kiện ở cấp độ **phiên bản sao chép**, bạn sẽ nhận được email cho tất cả các sự kiện thuộc loại **phiên bản sao chép**.

Đây là ví dụ về **email thông báo sự kiện DMS**. Nếu bạn đang sử dụng địa chỉ email cá nhân nhưng không thấy email đến hộp thư đến, hãy kiểm tra xem email có được gửi đến thư mục thư rác không. Khi bạn đang sử dụng địa chỉ email công ty, hãy đảm bảo rằng tường lửa không chặn các thông báo này.

Bạn có thể lặp lại các bước trên để tạo một đăng ký sự kiện khác để nhận thông báo về **sự kiện tác vụ DMS**.