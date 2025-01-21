---
title: "Các số liệu trên CloudWatch"
weight: 1
chapter: false
pre: "<b> 5.1. </b>"
---

AWS DMS cung cấp cho bạn khả năng giám sát hiệu suất của **quá trình di chuyển DMS** thông qua **số liệu CloudWatch**. Có nhiều số liệu khác nhau có sẵn ở **mức độ tác vụ & máy sao chép**.

{{% notice info %}}
Số liệu CloudWatch cho trình sao chép chép DMS có thể hữu ích trong việc xác định mức tiêu thụ tài nguyên trên trình sao chép chép DMS. **Mức sử dụng CPU, Bộ nhớ có thể giải phóng, Không gian lưu trữ trống,** v.v. là một số số liệu chính mà bạn có thể muốn theo dõi. Số liệu CloudWatch cho các tác vụ DMS có thể hữu ích trong việc xác định hiệu suất. DMS cung cấp các số liệu khác nhau cho Tải đầy đủ, CDC, Xác thực & Tác động đến trình sao chép chép. Vui lòng tham khảo tài liệu Giám sát AWS DMS để biết chi tiết về từng số liệu.
{{% /notice %}}

Để xem số liệu CloudWatch cho trình sao chép chép DMS, hãy truy cập [**Bảng điều khiển AWS DMS**](https://console.aws.amazon.com/dms/v2/home#dashboard) và nhấp vào **Replication instances** ở cột bên trái. Chọn trình sao chép chép rồi điều hướng đến tab **CloudWatch metrics**.

Để xem số liệu CloudWatch cho các tác vụ DMS, hãy truy cập [**Bảng điều khiển AWS DMS**](https://console.aws.amazon.com/dms/v2/home#dashboard) và nhấp vào **Database Migration Task** ở cột bên trái. Nhấp vào tác vụ DMS của bạn từ danh sách các tác vụ.

Khi bạn vào trang **DMS task**, hãy điều hướng đến tab **CloudWatch metrics**.

![](/images/5/1/0001.png?width=90pc)

Tiếp theo, chúng ta sẽ tìm hiểu về các sự kiện AWS DMS và cách thiết lập thông báo cho các sự kiện đó.