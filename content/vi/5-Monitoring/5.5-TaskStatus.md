---
title: "Các trạng thái của tác vụ"
weight: 5
chapter: false
pre: "<b> 5.5. </b>"
---

AWS DMS làm mới trạng thái tác vụ khi tác vụ chuyển từ trạng thái này sang trạng thái khác. Để xem trạng thái của tác vụ DMS, hãy vào **Bảng điều khiển AWS DMS** và nhấp vào **DMS Migration Tasks** ở cột bên trái. Ở bên phải, bạn sẽ thấy danh sách tất cả các tác vụ DMS cùng trạng thái hiện tại của chúng.

Bảng sau đây hiển thị các trạng thái có thể có của một tác vụ:

- **Creating (Đang tạo)**: AWS DMS đang tạo tác vụ.

- **Running (Đang chạy)**: Tác vụ đang thực hiện các nhiệm vụ di chuyển đã chỉ định.

- **Stopped (Đã dừng)**: Tác vụ đã dừng.

- **Stopping (Đang dừng)**: Tác vụ đang bị dừng. Thông thường, đây là dấu hiệu cho thấy người dùng đã can thiệp vào tác vụ.

- **Deleting (Đang xóa)**: Tác vụ đang bị xóa, thường là do yêu cầu người dùng can thiệp.

- **Failed (Đã thất bại)**: Tác vụ đã thất bại. Để biết thêm thông tin, hãy xem tệp nhật ký tác vụ.

- **Starting (Đang bắt đầu)**: Tác vụ đang kết nối với phiên bản sao chép và với điểm cuối nguồn và đích. Bất kỳ bộ lọc và chuyển đổi nào đang được áp dụng.

- **Ready (Sẵn sàng)**: Nhiệm vụ đã sẵn sàng để chạy. Trạng thái này thường theo sau trạng thái "created".

- **Modifying (Đang sửa)**: Nhiệm vụ đang được sửa đổi, thường là do hành động của người dùng đã sửa đổi cài đặt nhiệm vụ.

- **Moving (Đang di chuyển)**: Nhiệm vụ đang trong quá trình được di chuyển đến một phiên bản sao chép khác. Bản sao chép vẫn ở trạng thái này cho đến khi quá trình di chuyển hoàn tất. Xóa nhiệm vụ là thao tác duy nhất được phép trên nhiệm vụ sao chép trong khi nó đang được di chuyển.

**Failed-move (Di chuyển thất bại)**: Việc di chuyển nhiệm vụ đã không thành công vì bất kỳ lý do nào, chẳng hạn như không có đủ dung lượng lưu trữ trên phiên bản sao chép mục tiêu. Khi một nhiệm vụ sao chép ở trạng thái này, nó có thể được bắt đầu, sửa đổi, di chuyển hoặc xóa.