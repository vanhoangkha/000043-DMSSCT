---
title: "Tạo môi trường"
weight: 1
chapter: false
pre: "<b> 6.2.1. </b>"
---

{{% notice note %}}
Trong bài tập khắc phục sự cố này, chúng ta sẽ sử dụng các tài nguyên (tác vụ DMS/phiên bản RDS, v.v.) được tạo trong phòng thí nghiệm Oracle Source to Target Amazon Aurora (PostgreSQL). Tuy nhiên, nếu bạn đang theo dõi bất kỳ phòng thí nghiệm nào khác với bất kỳ công cụ mục tiêu RDBMS nào khác, hãy thoải mái tiếp tục sử dụng các tài nguyên đó.
\
Chúng tôi giả định rằng bạn đã tạo tác vụ DMS bằng bài thực hành này và cũng đã hoàn tất di chuyển một lần.
{{% /notice %}}

1. Bây giờ, hãy tiếp tục và **KHỞI ĐỘNG LẠI** cùng một tác vụ DMS oracle-migration-task một lần nữa.

    ![](/images/6/2/1/0001.png?width=80pc)

1. Sau khi tác vụ này chạy trong vài phút, bạn sẽ thấy tác vụ chuyển sang trạng thái lỗi. Bạn có thể thấy trạng thái tác vụ là **Running with errors (Đang chạy nhưng gặp lỗi)** hoặc **Error (Lỗi)**.

    ![](/images/6/2/1/0002.png?width=60pc)