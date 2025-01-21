---
title: "Kiểm thử hoạt động mở rộng quy mô của DMS Serverless"
weight: 2
chapter: false
pre: "<b> 4.2. </b>"
---

Trong phòng thí nghiệm này, bạn sẽ khám phá cách **AWS DMS Serverless** có thể tự động mở rộng quy mô công suất dựa trên tải từ hệ thống nguồn. Mục tiêu chính của bài kiểm tra tải này là chứng minh khả năng mở rộng quy mô thích ứng của DMS Serverless trong các tình huống thực tế. Trong môi trường sản xuất, khối lượng công việc di chuyển dữ liệu có thể thay đổi đáng kể, với các giai đoạn hoạt động cao đòi hỏi nhiều tài nguyên hơn và các giai đoạn hoạt động thấp khi có thể giảm thiểu tài nguyên để tối ưu hóa chi phí. Tính năng mở rộng quy mô động này giúp đảm bảo rằng quá trình di chuyển diễn ra suôn sẻ, ngay cả khi tải trên hệ thống nguồn dao động, mà không cần can thiệp thủ công để điều chỉnh công suất.

### Kiểm tra tải nền tảng truyền thông xã hội với AWS DMS Serverless

Hãy tưởng tượng bạn đang quản lý một nền tảng truyền thông xã hội nơi người dùng có thể đăng nội dung, bình chọn hoặc bỏ phiếu cho bài đăng và tương tác với người khác. Nền tảng này trải qua các giai đoạn hoạt động thông thường, nhưng trong thời gian cao điểm — chẳng hạn khi một bài đăng lan truyền hoặc một sự kiện lớn diễn ra — lưu lượng truy cập tăng đột biến. Các bài đăng được tạo, người dùng tương tác với nội dung và lượt bình chọn bắt đầu đổ về.

Để xử lý các đợt tăng đột biến này, hệ thống cần mở rộng tài nguyên một cách nhanh chóng và hiệu quả. Đó là lúc **AWS DMS Serverless** phát huy tác dụng. Trong phòng thí nghiệm này, chúng tôi sẽ mô phỏng một tình huống như vậy bằng cách tạo ra một lượng lớn hoạt động dữ liệu trong trung tâm dữ liệu tại chỗ của bạn và sao chép dữ liệu đó sang AWS để xử lý thêm. Chúng tôi sẽ quan sát cách **DMS Serverless** phản hồi với tải ngày càng tăng và tự động mở rộng dung lượng của nó.

#### 1. Tạo Người dùng, Bài đăng và Lượt bình chọn

Chúng tôi sẽ mô phỏng một trang mạng xã hội nhộn nhịp bằng cách tạo các bảng để biểu diễn **Người dùng**, **Bài đăng** và **Lượt bình chọn**:

- Bảng **Users** (người dùng) sẽ lưu trữ dữ liệu như danh tiếng, thông tin chi tiết về hồ sơ và hoạt động bình chọn.

- Bảng **Posts** (Bài đăng) sẽ chứa nội dung từ câu hỏi đến câu trả lời, với các thuộc tính như điểm và lượt xem.

- Bảng **Votes** (bình chọn) sẽ ghi lại các tương tác của người dùng với các bài đăng này, bao gồm các lượt upvote, downvote hoặc các hành động vote đặc biệt như tiền thưởng.

Dữ liệu này sẽ được tạo trong **trung tâm dữ liệu cục bộ**, mô phỏng môi trường thực tế của ứng dụng doanh nghiệp trước khi di chuyển lên đám mây.

#### 2. Mô phỏng sự gia tăng lưu lượng truy cập

Một quy trình được lưu trữ sẽ tạo ra hàng nghìn **posts**, **users** và **votes** theo các khoảng thời gian ngẫu nhiên, mô phỏng lưu lượng truy cập không thể đoán trước của một nền tảng truyền thông xã hội trực tiếp:

- Chúng tôi sẽ mô phỏng việc tạo **posts** và tương tác với chúng của **users**, bao gồm cách họ upvote và downvote nội dung.

- Khi nền tảng trở nên bận rộn hơn, tải trên hệ thống tăng lên. Chúng tôi sẽ kích hoạt nhiều phiên hoạt động cao, mô phỏng giờ cao điểm.

Khi lưu lượng truy cập này tăng lên trong hệ thống tại chỗ, **AWS DMS Serverless** sẽ sao chép dữ liệu này theo thời gian thực vào **AWS Cloud**, đảm bảo rằng thông tin mới nhất có sẵn để xử lý thêm trong các dịch vụ AWS như phân tích hoặc học máy.

#### 3. Sao chép dữ liệu vào AWS

Dữ liệu được tạo tại chỗ sẽ được sao chép liền mạch vào **AWS Cloud** bằng **DMS Serverless**. **DMS Serverless** đảm bảo tính khả dụng cao, sao chép theo thời gian thực và tự động mở rộng quy mô, giúp giải pháp này lý tưởng để xử lý tải thay đổi.

#### 4. Giám sát phản hồi của hệ thống

**DMS Serverless** sẽ tự động mở rộng quy mô dung lượng (DCU) khi khối lượng xử lý trên hệ thống nguồn tăng lên. Điều này đảm bảo rằng quy trình di chuyển có thể xử lý sự gia tăng hoạt động mà không bị tắc nghẽn hoặc chậm lại, bất kể khối lượng xử lý trên hệ thống tại chỗ là bao nhiêu.

#### 5. Thu hẹp quy mô khi lưu lượng truy cập giảm

Khi khối lượng xử lý giảm — giống như khi bài đăng lan truyền nguội đi và nền tảng trở lại bình thường—DMS Serverless sẽ tự động giảm dung lượng, chứng minh tính đàn hồi của điện toán không máy chủ và tối ưu hóa chi phí.

Bài thực hành sẽ mất khoảng **40-50 phút** để hoàn thành và sẽ cung cấp cho bạn trải nghiệm thực tế với **khả năng tự động điều chỉnh quy mô** của DMS Serverless và **sao chép theo thời gian thực từ hệ thống tại chỗ sang AWS**.