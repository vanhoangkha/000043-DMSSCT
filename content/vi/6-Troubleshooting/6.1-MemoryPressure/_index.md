---
title: "Áp lực bộ nhớ lên DMS Instance"
weight: 1
chapter: false
pre: "<b> 6.1. </b>"
---

**_Trong phòng thí nghiệm này, chúng ta sẽ khắc phục sự cố lỗi tác vụ DMS do áp lực bộ nhớ trên phiên bản sao chép._**

Trước khi đi vào tạo kịch bản này, chúng ta hãy tóm tắt lại cách DMS hoạt động bên trong.

Để thực hiện di chuyển cơ sở dữ liệu, AWS DMS kết nối với kho dữ liệu nguồn, đọc dữ liệu nguồn và định dạng dữ liệu để kho dữ liệu đích sử dụng. Sau đó, nó tải dữ liệu vào kho dữ liệu đích. Hầu hết quá trình xử lý này diễn ra trong bộ nhớ của phiên bản sao chép DMS. Mặc dù các giao dịch lớn có thể yêu cầu một số bộ đệm vào đĩa. Các giao dịch được lưu trong bộ nhớ đệm và tệp nhật ký cũng được ghi vào đĩa.

Tuy nhiên, nếu quá trình di chuyển gây quá nhiều tải cho phiên bản sao chép DMS, trong một số trường hợp, nó có thể tạo áp lực bộ nhớ lên phiên bản và có thể dẫn đến lỗi tác vụ. Nếu bạn chạy nhiều hơn một tác vụ DMS, những lỗi này có thể xảy ra ở nhiều tác vụ, nếu không phải trên tất cả.

Chúng ta hãy tiếp tục và tạo kịch bản trong phần tiếp theo.