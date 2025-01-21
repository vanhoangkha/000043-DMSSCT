---
title: "Delete S3 Bucket and IAM Roles"
weight: 6
chapter: false
pre: "<b> 7.6. </b>"
---

{{% notice info %}}
Phần này chỉ nên hoàn thành nếu bạn đã thực hiện phòng thí nghiệm mục tiêu Amazon S3. Bạn có thể DỪNG đọc ngay bây giờ nếu bạn đã hoàn thành bất kỳ phòng thí nghiệm nào khác trong Hội thảo di chuyển cơ sở dữ liệu vì bạn đã hoàn thành việc xóa tài nguyên cho các phòng thí nghiệm đó ở giai đoạn này.
{{% /notice %}}

1. Điều hướng đến bảng điều khiển Amazon S3 và đi đến thùng mà bạn đã tạo như một phần của phòng thí nghiệm này.

1. Nhấp vào hộp kiểm bên trái `**dmstargetfolder**`. Nhấp vào nút Hành động và chọn **Empty**.

1. Quay lại danh sách thùng và nhấp vào hộp kiểm bên cạnh thùng S3 mà bạn đã tạo trước đó. Nhấp vào **Delete**.

1. Nhập tên thùng của bạn, sau đó nhấp vào **Delete**.

    ![](/images/7/5/0001.png?width=85pc)

1. Phòng thí nghiệm sử dụng `**DMS-VPC-ROLE**` cần thiết để DMS hoạt động nói chung. Chúng tôi khuyên bạn nên giữ nguyên vai trò này vì không mất phí cho Vai trò IAM và DMS sẽ cần vai trò này nếu không có. Nếu bạn có bất kỳ câu hỏi hoặc thắc mắc nào, vui lòng liên hệ với bộ phận liên hệ hoặc bộ phận hỗ trợ của AWS.

1. Bây giờ, bạn cần xóa chính sách IAM mà bạn đã tạo trước đó. Lưu ý: bạn có thể giữ nguyên vì không mất phí cho chính sách IAM nhưng thùng được sử dụng đã bị xóa. Tùy thuộc vào bạn. Nếu bạn muốn giữ nguyên thì bạn đã hoàn thành phần này. Nếu bạn muốn xóa, hãy vào bảng điều khiển IAM, sau đó vào Chính sách từ ngăn điều hướng. Trong thanh tìm kiếm, nhập `**DMS-LAB-S3-Access-Policy**`.

1. Nhấp vào hộp kiểm bên cạnh `**DMS-LAB-S3-Access-Policy**`. Sau đó, nhấp vào **Policy Actions** và chọn **Delete**.

1. Chọn **Delete** trên lời nhắc mới.

Bạn đã hoàn tất việc xóa các tài nguyên AWS mà bạn đã tạo trước đó trong tài khoản của mình.