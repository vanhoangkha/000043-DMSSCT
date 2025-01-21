---
title: "Serverless replication"
weight: 4
chapter: false
pre: "<b> 4. </b>"
---

AWS DMS Serverless loại bỏ sự phỏng đoán và gánh nặng vận hành khi quản lý tài nguyên di chuyển bằng cách tự động cung cấp, mở rộng quy mô và tối ưu hóa năng lực. Nó cung cấp tính năng khả dụng cao tích hợp sẵn và mô hình thanh toán theo mức sử dụng, cho phép bạn bắt đầu di chuyển nhanh chóng với sự giám sát tối thiểu trong khi tối ưu hóa chi phí và tăng tính linh hoạt trong hoạt động. Tính năng này cũng loại bỏ nhu cầu thực hiện các tác vụ thủ công như ước tính năng lực, cung cấp, quản lý chi phí và bảo trì công cụ sao chép.

Trong mô-đun này, chúng tôi sẽ trình bày:

- Cách sử dụng tính năng AWS DMS Serverless để di chuyển dữ liệu. Bạn sẽ bắt đầu bằng cách thiết lập DMS Serverless để thực hiện tải đầy đủ và hoạt động CDC.

- Sau đó, bạn sẽ tạo một số hoạt động trên cơ sở dữ liệu nguồn để quan sát cách DMS Serverless tự động mở rộng quy mô để đáp ứng khối lượng công việc.

Đến cuối mô-đun này, bạn sẽ có kinh nghiệm thực tế trong việc định cấu hình và quản lý DMS Serverless để di chuyển dữ liệu hiệu quả và tự động.

{{% notice note %}}
Trước khi tiến hành theo hướng dẫn trong mô-đun này, vui lòng đảm bảo rằng bạn đã hoàn tất tất cả các bước tiên quyết, bao gồm phần [Bắt đầu](../1-Start/) và cấu hình cơ sở dữ liệu nguồn và đích của bạn. Nếu bạn đã bỏ qua bất kỳ mô-đun cơ bản nào trong số này, điều cần thiết là phải quay lại và hoàn tất chúng trước. Việc bỏ qua các điều kiện tiên quyết này có thể dẫn đến các sự cố hoặc thiết lập không đầy đủ trong quá trình di chuyển dữ liệu. Để di chuyển suôn sẻ và thành công, hãy đảm bảo rằng tất cả các cấu hình cần thiết đều được thiết lập bằng cách nhấp vào các liên kết bên dưới.
{{% /notice %}}

