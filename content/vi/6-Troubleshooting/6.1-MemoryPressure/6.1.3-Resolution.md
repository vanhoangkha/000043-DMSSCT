---
title: "Giải pháp"
weight: 3
chapter: false
pre: "<b> 6.1.3. </b>"
---

Để giải quyết lỗi tác vụ DMS do áp lực bộ nhớ, chúng ta có hai tùy chọn

**Tùy chọn 1. Tăng bộ nhớ trên phiên bản sao chép DMS.** Bạn có thể tăng bộ nhớ bằng cách sửa đổi phiên bản DMS và chọn lớp phiên bản có bộ nhớ cao hơn. Vui lòng tham khảo [tài liệu AWS DMS này](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Types.html) để chọn đúng loại phiên bản cho khối lượng công việc của bạn.

**Tùy chọn 2. Giảm khối lượng công việc.** Trong phòng thí nghiệm này, chúng tôi đã sử dụng loại phiên bản DMS **t2.micro** cung cấp **1 GB bộ nhớ**. Khi bắt đầu phòng thí nghiệm này, để tạo kịch bản này, chúng tôi đã tăng khối lượng công việc bằng cách thêm nhiều bảng và lược đồ hơn. Chúng tôi cũng tăng số lượng bảng để tải song song.

Do đó, trong trường hợp của chúng tôi, để giảm khối lượng công việc, bạn có thể (a) giảm số lượng tải bảng song song. (b) giảm số lượng lược đồ/bảng. (c) Nếu có nhiều tác vụ chạy song song trên cùng một phiên bản DMS, bạn có thể muốn di chuyển một số tác vụ sang các phiên bản khác.