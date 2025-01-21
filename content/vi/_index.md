---
title: "Chuyển đổi lược đồ và di dời CSDL"
weight: 1
chapter: false
---

# Chuyển đổi lược đồ và di dời CSDL

### Chuyển đổi lược đồ

Chuyển đổi lược đồ (schema) của cơ sở dữ liệu (CSDL) và các đối tượng mã nguốn thường là thao tác tốn nhiều thời gian nhất trong quá trình dịch chuyển các cơ sở dữ liệu không đồng nhất. Chuyển đổi lược đồ đúng cách được xem là một cột mốc quan trọng trong quá trình dịch chuyển CSDL. [Công cụ chuyển đổi lược đồ AWS (SCT)](https://docs.aws.amazon.com/SchemaConversionTool/latest/userguide/CHAP_Installing.html) là một ứng dụng dễ sử dụng mà bạn có thể cài đặt trên máy tính cục bộ hoặc phiên bản Amazon EC2. Tại **ReInvent 2023**, AWS cũng đã thêm giao diện bảng điều khiển web cho phần Chuyển đổi và di chuyển của dịch vụ DMS. Trong tương lai, chúng ta sẽ dần chuyển sang trải nghiệm trong bảng điều khiển.

SCT và Chuyển đổi & Di chuyển trong bảng điều khiển đều giúp đơn giản hóa quá trình di chuyển cơ sở dữ liệu không đồng nhất bằng cách kiểm tra lược đồ cơ sở dữ liệu nguồn và tự động chuyển đổi phần lớn các đối tượng mã cơ sở dữ liệu, bao gồm các dạng xem cũng như các quy trình và hàm được lưu trữ, sang định dạng tương thích với cơ sở dữ liệu đích. Bất kỳ đối tượng nào SCT không thể tự động chuyển đổi sẽ được đánh dấu bằng thông tin chi tiết. Từ đó bạn có thể sử dụng để chuyển đổi thủ công.

![Schema Conversion](/images/0-home/0001.png?width=50pc)

### Di dời CSDL

Sau khi hoàn tất chuyển đổi lược đồ, bạn sẽ cần di chuyển chính dữ liệu. Trong trường hợp cơ sở dữ liệu sản xuất, bạn có thể không đủ khả năng để có rất ít thời gian chết trong quá trình di chuyển. Hơn nữa, bạn có thể muốn giữ các giao dịch từ cơ sở dữ liệu nguồn và đích đồng bộ cho đến khi bạn chuyển ứng dụng của mình sang đích mới.

Dịch vụ di chuyển cơ sở dữ liệu AWS giúp bạn di chuyển dữ liệu từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích một cách dễ dàng và an toàn. AWS DMS hỗ trợ di chuyển dữ liệu đến và đi từ hầu hết các cơ sở dữ liệu thương mại và nguồn mở được sử dụng rộng rãi. Cơ sở dữ liệu nguồn có thể được đặt trong môi trường tại chỗ của bạn, chạy trên phiên bản Amazon EC2 hoặc có thể là cơ sở dữ liệu Amazon RDS. Mục tiêu có thể là cơ sở dữ liệu trên Amazon EC2 hoặc Amazon RDS. Mục tiêu cũng có thể không liên quan như S3, Stream như Kafka/Kinesis, DocumentDB hoặc DynamoDB, v.v. Ngoài ra, cơ sở dữ liệu nguồn vẫn hoạt động đầy đủ trong quá trình di chuyển, giảm thiểu thời gian chết cho các ứng dụng dựa vào cơ sở dữ liệu.

![Migration](/images/0-home/0002.png?width=50pc)