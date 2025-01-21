---
title: "Quá trình huyển đổi lược đồ"
weight: 1
chapter: false
pre: "<b> 3.1. </b>"
---

{{% notice info %}}
1. Phần này chỉ áp dụng cho các CSDL đích Amazon Aurora. Nếu bạn đang sử dụng loại CSDL đích khác, bạn có thể bỏ qua [phần 3.1.2](../3.1.2-Migration/)
\
2. Một số hình ảnh được lấy từ quá trình chuyển đổi lược đồ Microsoft SQL sang Aurora (PostgreSQL). Tuy nhiên, việc dịch chuyển giữa các nguồn và đích khác nhau sử dụng các quy trình tương tự. Do đó, hướng dẫn này cũng có thể áp dụng cho các nguồn và mục tiêu đó.
{{% /notice %}}

Phần này trình bày cách sử dụng AWS Schema Conversion Tool để chuyển đổi lược đồ từ Microsoft SQL Server hoặc Oracle sang Amazon Aurora (MySQL hoặc PostGreSQL). Ngoài ra, bạn sẽ quan sát cách AWS SCT giúp bạn phát hiện ra sự khác biệt giữa hai phương ngữ này; và cung cấp cho bạn các mẹo về cách bạn có thể sửa đổi mã thủ tục khi cần để di chuyển thành công tất cả các đối tượng cơ sở dữ liệu.

![Convert MS SQL to Aurora MySQL](/images/3/1/0001.png?width=50pc)