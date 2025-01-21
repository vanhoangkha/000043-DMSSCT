---
title: "Tạo môi trường"
weight: 1
chapter: false
pre: "<b> 6.1.1. </b>"
---

Như đã đề cập trước đó, áp lực bộ nhớ trên phiên bản DMS có thể xảy ra khi tác vụ di chuyển đặt tải trọng cao lên phiên bản DMS và bộ nhớ được phân bổ không đủ để xử lý khối lượng công việc. Do đó, để tạo lại tình huống này, chúng ta sẽ đặt tải thông qua tác vụ DMS.

{{% notice info %}}
Trong bài tập khắc phục sự cố này, chúng ta sẽ sử dụng các tài nguyên (tác vụ DMS/phiên bản RDS, v.v.) được tạo trong phòng thí nghiệm [**_Oracle Source to Amazon Aurora (PostgreSQL) Target_**](../../3-SelectTarget/3.1-AuroraMySQL/). Tuy nhiên, nếu bạn đang theo dõi bất kỳ phòng thí nghiệm nào khác với bất kỳ công cụ nguồn/đích RDBMS nào khác, hãy thoải mái tiếp tục sử dụng các tài nguyên đó.
{{% /notice %}}

1. Điều hướng đến danh sách tác vụ DMS trên bảng điều khiển AWS DMS. Chọn tác vụ di chuyển toàn bộ của DMS. Từ menu thả xuống **Actions**, nhấp vào **Stop**.

    ![](/images/6/1/1/0001.png?width=80pc)

1. Sau khi tác vụ dừng hẳn, một lần nữa vào menu **Actions > Modify**.

    ![](/images/6/1/1/0002.png?width=80pc)

1. Trên trang **Modify data migration task**, kéo xuống phần **Advanced task settings**. Trong **Full load tuning settings**, nhập **49** vào hộp văn bản cho *Maximum number of tables to load in parallel** và **50000** vào hộp văn bản **Commit rate during full load**.

    ![](/images/6/1/1/0003.png?width=80pc)

1. Bây giờ, cuộn xuống phần **Table mappings**. Trong **Selection Rules***, thay thế tên Sơ đồ từ **DMS_SAMPLE** thành **%**. Bây giờ, cuộn xuống cuối trang và nhấn nút **Save**.

    ![](/images/6/1/1/0004.png?width=80pc)

1. Sau khi sửa đổi tác vụ hoàn tất, hãy tiếp tục và **RESTART** (khởi động lại) tác vụ.

    ![](/images/6/1/1/0005.png?width=80pc)
    ![](/images/6/1/1/0006.png?width=60pc)

1. Theo dõi số liệu theo dõi đám mây của phiên bản DMS. Khi tải trên bộ nhớ phiên bản DMS tăng lên, bạn có thể nhận thấy **Bộ nhớ có thể giải phóng** giảm và **Sử dụng phân vùng swap** tăng/biến động. Ngoài ra, hãy theo dõi trạng thái tác vụ DMS. Sau một thời gian, bạn sẽ thấy trạng thái tác vụ DMS được thay đổi thành **Failed (Thất bại)**.

    ![](/images/6/1/1/0007.png?width=80pc)

1. Điều hướng đến tác vụ DMS thất bại, trong tab **Overview details**, hãy chú ý đến thông báo **Last failure (lỗi mới nhất)**. Nếu tác vụ DMS thất bại do áp lực bộ nhớ trên phiên bản DMS, bạn sẽ thấy thông báo **"Last Error Replication task out of memory. Stop Reason `FATAL_ERROR` Error Level `FATAL`."**

Ở giai đoạn này, chúng ta có thể tạo thành công kịch bản trong đó tác vụ DMS thất bại do áp lực bộ nhớ trên phiên bản DMS!

{{% notice note %}}
Nếu bạn thấy tác vụ đã hoàn thành thành công ngay cả sau khi thêm nhiều bảng vào tác vụ, bạn có thể thêm nhiều bảng hơn nữa vào tác vụ. Ngoài ra, bạn cũng có thể tạo tác vụ riêng trên cùng một phiên bản và chạy tất cả các tác vụ song song.
{{% /notice %}}