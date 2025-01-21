---
title: "Troubleshooting Steps"
weight: 2
chapter: false
pre: "<b> 6.1.2. </b>"
---

Bất kể nguyên nhân gây ra lỗi là gì, quá trình khắc phục sự cố nên thực hiện theo các bước dưới đây:

1. Làm mới trang **DMS tasks** & xác minh trạng thái nhiệm vụ DMS. Nếu nhiệm vụ ở trạng thái **Failed (Thất bại)**, điều đó có nghĩa là DMS đã dừng xử lý nhiệm vụ và dừng lại do lỗi.

    ![](/images/6/1/2/0000.png?width=80pc)

2. Khi nhiệm vụ ở trạng thái **Failed**, hãy xác minh xem có bất kỳ thông báo nào được gửi bởi nhiệm vụ DMS không. Bạn có thể xem thông báo này trong mục Thông báo lỗi cuối cùng trên trang **DMS tasks**. Trong trường hợp này, rất rõ ràng là nhiệm vụ bị lỗi do sự cố hết bộ nhớ.

3. Bây giờ, để khắc phục sự cố hết bộ nhớ, hãy điều hướng đến trang **DMS replication instance** và chuyển sang tab **CloudWatch metrics**. Xem lại số liệu cụ thể cho **Memory & Swap Usage (Sử dụng bộ nhớ & hoán đổi)**.

    Trong ảnh chụp màn hình ở trên, chúng ta có thể thấy rõ sự sụt giảm bộ nhớ có thể giải phóng và sự gia tăng mức sử dụng swap vào thời điểm xảy ra lỗi tác vụ. Các số liệu của CloudWatch được tính trung bình là 60 giây. Do đó, bạn có thể không thấy bộ nhớ giảm hoàn toàn xuống 0.

    ![](/images/6/1/2/0001.png?width=80pc)
    ![](/images/6/1/2/0002.png?width=80pc)
    ![](/images/6/1/2/0003.png?width=80pc)

4. Khi tác vụ DMS dừng hẳn, bạn có thể thấy thông báo bên dưới trong log tác vụ DMS:

    ```
    2021-11-10T23:58:14 [AT_GLOBAL       ]I:  Closing log file at Wed Nov 10 23:58:14 2021  (at_logger.c:2548)
    ```

    Tuy nhiên, khi tác vụ không thành công do áp lực bộ nhớ, DMS không có thời gian để dừng tác vụ và ghi log một cách sạch sẽ. Do đó, nếu bạn tham khảo log tác vụ DMS trong các tình huống này, bạn có thể không tìm thấy bất kỳ thông tin hữu ích nào để khắc phục sự cố.

5. Trong trường hợp áp lực bộ nhớ trên **Trình sao chép DMS**, bạn cũng có thể muốn xác minh có bao nhiêu tác vụ DMS đang chạy trên phiên bản cụ thể. Để xác minh điều này, hãy điều hướng đến trang **DMS replication instance**, ở trên cùng bên phải, bạn sẽ thấy phần có tên là Tác vụ di chuyển liên quan. Để có danh sách tất cả các tác vụ DMS đang chạy trên phiên bản đó, hãy chuyển sang tab Tác vụ di chuyển. Tại phần này, bạn có thể xem lại danh sách tác vụ cùng trạng thái của chúng.
