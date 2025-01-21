---
title: "Kết nối tới máy ảo EC2 và cài đặt Schema Conversion tool"
weight: 4
chapter: false
pre: "<b> 1.4. </b>"
---

### Kết nối tới máy ảo EC2

Có hai phương pháp để kết nối với EC2-Instance:

1. Thông qua máy khách RDP truyền thống, phức tạp hơn và yêu cầu nhiều bước hơn và

2. Thông qua AWS Fleet Manager, dễ hơn và yêu cầu ít bước hơn và là phương pháp tiếp cận được chúng tôi đề xuất.

Mặc dù hướng dẫn bên dưới đề cập đến cả hai phương pháp, chúng tôi khuyên bạn nên bắt đầu với phương pháp Fleet Manager được liệt kê đầu tiên.

Nếu bạn đang sử dụng trình duyệt không hỗ trợ sao chép và dá, chúng tôi khuyên bạn nên mở hướng dẫn thực hành trong trình duyệt bên trong cửa sổ RDP bằng fleet manager để có thể sao chép và dán.

#### Hướng 1: Sử dụng AWS Fleet Manager

{{% expand "Mở để xem hướng dẫn" %}}

_(Hướng sử dụng RDP truyền thống nằm sau phần này. Bạn có thể chuyển đến bằng cách [nhấp vào đây](#classic-desktop-rdp-connection-approach).)_

{{% notice note %}}

**_Lưu ý 1:_** Nếu sử dụng Fleet Manager để kết nối, chúng tôi khuyên bạn nên sử dụng trình duyệt dựa trên Chrome vì các trình duyệt không dựa trên Chrome có thể không hỗ trợ sao chép và dán. Bạn cũng nên mở trình duyệt bên trong phiên RDP và truy cập vào url đầy đủ của **AWS Database Migration Workshop** (https://catalog.workshops.aws/databasemigration), sau đó bạn có thể cắt và dán bên trong máy ảo.
\
\
**_Lưu ý 2:_** Với Chrome, đôi khi bạn vẫn phải phóng to/toàn màn hình cửa sổ RDP rồi quay lại chế độ chuẩn hoặc thậm chí ngắt và kết nối lại hoàn toàn để sao chép và dán hoạt động.
\
\
**_Lưu ý 3:_** Nếu bạn đang sử dụng trình duyệt không hỗ trợ sao chép và dán, chúng tôi khuyên bạn nên mở hướng dẫn trong phòng thí nghiệm trong trình duyệt bên trong cửa sổ RDP bằng fleet manager để bật sao chép và dán.

{{% /notice %}}

1. Đi đến [Bảng điều khiển AWS Fleet Manger](https://console.aws.amazon.com/systems-manager/managed-instances) và nhấp vào phiên bản có tên kết thúc bằng **_-EC2Instance_** (nếu bạn bắt đầu trên bảng điều khiển Fleet Manager, hãy nhấp vào Nút **Getting Started**) sau đó chọn nút Hành động nút và chọn **Connect with Remote Desktop** như hiển thị trong hình ảnh bên dưới (nếu bạn nhận được thông báo có sự cố hoặc không thấy phiên bản nào, hãy đảm bảo bạn đang ở đúng vùng cho sự kiện của mình)

    ![FleetMgr](/images/1/4/Fl-001.png?width=60pc)

    ![FleetMgr](/images/1/4/Fl-002.png?width=60pc)

1. Chọn nút tùy chọn **Key pair** sau đó chọn **Browse** để tìm cặp khóa đã tải xuống máy cục bộ của bạn. Bạn phải tải xuống cặp khóa trước đó (được đề cập trong phần [**Bắt đầu**](../../1-Start/) trong mục tải xuống cặp khóa). Nếu bạn chưa tải xuống, hãy đi đến **Key pair** trong **Bảng điều khiển Amazon EC2** và tải xuống ngay bây giờ.

1. Nhấp vào **Connect**.

    ![FleetMgr](/images/1/4/Fl-003.png?width=60pc)

1. Nhấp vào **No** trên thanh bên phải **Networks > Network 10** khi được hỏi **_Do you want to allow your PC to be discoverable....?_** ở bên phải nếu tùy chọn này hiển thị.

    ![FleetMgr](/images/1/4/Fl-004.png?width=60pc)

{{% notice info %}}
Nếu bạn đã kết nối thành công với máy tính để bàn EC2 qua **Fleet Manager**, bây giờ bạn có thể tiến hành phần tiếp theo của phòng thí nghiệm. Nếu chưa...
{{% /notice %}}

{{% /expand %}}

#### Hướng 2: Sử dụng phần mềm kết nối RDP

{{% expand "Mở để xem hướng dẫn" %}}

_(Chúng tôi sẽ sử dụng Remote Desktop Protocol (RDP) để kết nối với Amazon EC2 Instance.)_

Nếu bạn đang sử dụng OS X, bạn có thể tải Microsoft Remote Desktop từ cửa hàng ứng dụng [tại đây](https://apps.apple.com/app/microsoft-remote-desktop/id1295203466?mt=12).

1. Truy cập [Bảng điều khiển AWS EC2](http://console.aws.amazon.com/ec2/v2/) và nhấp vào **Security Groups** ở cột bên trái (bạn có thể phải cuộn xuống một chút).

![Bảng điều khiển SecGroup](/images/1/4/0001.png?width=90pc)

1. Chọn nhóm bảo mật (security group) có đuôi là **_-InstanceSecurityGroup_** bằng cách đánh dấu vào hộp rồi nhấp vào **Actions > Edit > Inbound** như hiển thị bên dưới.

1. Chỉnh sửa các quy tắc đến cho RDP bằng cách nhấp vào **Source** và chọn **My IP** như hiển thị bên dưới. Nhấp vào **Save rules** (Lưu ý rằng đây là cách thực hành tốt nhất nếu bạn có VPN hoặc mạng phức tạp, bạn có thể cần quay lại và thay đổi thành Anywhere IPv4 0.0.0.0/0 nhưng chúng ta sẽ bắt đầu với điều này)

![Chỉnh sửa quy tắc](/images/1/4/0002.png?width=90pc)

1. Đi đến [bảng điều khiển AWS EC2](http://console.aws.amazon.com/ec2/v2/) và nhấp vào **Instances** ở cột bên trái.

1. Chọn phiên bản có tên **<StackName>-EC2Instance** rồi nhấp vào nút **Actions**. Nhấp vào **Connect**.

![Bảng điều khiển phiên bản](/images/1/4/0003.png?width=90pc)

1. Đi đến phần **RDP client** và nhấp vào **Get Password** (lấy mật khẩu).

![RDP Connect](/images/1/4/0004.png?width=90pc)

1. Nhấp vào **Browse** và tải lên tệp khóa riêng tư (đuôi .pem) bạn đã tải xuống trước đó.

1. Nhấp vào **Decrypt Password** (Giải mã mật khẩu).

![Lấy mật khẩu](/images/1/4/0005.png?width=90pc)

1. Sao chép mật khẩu đã tạo và lưu đâu đó. Bạn sẽ sử dụng mật khẩu này để kết nối để đăng nhập vào máy ảo EC2.

1. Nhấp vào **Download Remote Desktop File** để tải xuống tệp RDP để truy cập máy ảo EC2 này.

![Lưu mật khẩu và RDP](/images/1/4/0006.png?width=90pc)

1. Kết nối với máy ảo EC2 bằng máy khách RDP.

![Kết nối RDP](/images/1/4/0007.png?width=60pc)


{{% notice note %}}
Nếu bạn gặp lỗi kết nối và bạn đang sử dụng VPN doanh nghiệp, chúng tôi khuyên bạn nên bỏ qua VPN doanh nghiệp, lặp lại các bước 2 và 3 trong phần Máy khách RDP ở trên và thử kết nối lại. Nếu bạn vẫn gặp sự cố, vui lòng liên hệ với một trong những người hướng dẫn hoặc hỗ trợ trong phiên của bạn.
{{% /notice %}}

{{% /expand %}}

### Cài đặt Schema Conversion Tool

Kết nối lại vài máy ảo EC2 mà chúng ta đã sử dụng để chuẩn bị cơ sở dữ liệu nguồn thông qua rdp hoặc Fleet Manager, chúng ta sẽ cài đặt công cụ AWS Schema Conversion trên máy chủ này. Tải xuống tệp và cài đặt sẽ cung cấp cho bạn phiên bản mới nhất của AWS Schema Conversion Tool.

1. Trên máy chủ EC2, mở thư mục **"DMS Workshop"** trên Desktop. Sau đó, nhấp đúp vào **"AWS Schema Conversion Tool Download"** để tải phiên bản mới nhất của phần mềm như hình bên dưới. (Lưu ý: nếu được hỏi có muốn mở tệp này không, hãy nói **"YES"**.)

![Download SCT](/images/1/4/1001.png?width=90pc)

1. Khi quá trình tải xuống hoàn tất, hãy giải nén nội dung (nhấp đúp vào góc dưới bên trái của trình duyệt nơi tải xuống xảy ra hoặc nhấp một lần và chọn Open) nhấp đúp vào tệp gói cài đặt AWS Schema windows và làm theo các bước của trình hướng dẫn cài đặt theo mặc định và hoàn tất cài đặt AWS Schema Conversion Tool bằng cách nhấp vào **Finish** khi hoàn tất. (giống như hình ảnh bên dưới). 

    _**Lưu ý:** Nhấp đúp vào Fleet Mgr có thể khá khó khăn. Nhấp một lần và nhấn phím enter với tệp được tô sáng đôi khi sẽ hiệu quả hơn. Nếu bạn thấy **Lỗi nén thư mục** bật lên, hãy đóng cửa sổ này lại và thử phương pháp nhấp một lần phím enter thay vì nhấp đúp bằng chuột. Ngoài ra, đôi khi trình hướng dẫn cài đặt bị che mất, vì vậy hãy xem nó có nằm trên thanh tác vụ ở dưới cùng không và nhấp vào đó, trông giống như biểu tượng cài đặt Windows ở dưới cùng của màn hình RDP. Nếu bạn vẫn gặp sự cố, hãy hỏi người liên hệ/giảng viên AWS của bạn._

1. Quy trình cài đặt mẫu nằm trong các hình ảnh sau:

![cài đặt SCT](/images/1/4/1002.png?width=40pc)
![Đang cài đặt SCT](/images/1/4/1003.png?width=40pc)
![cài đặt SCT](/images/1/4/1004.png?width=40pc)
![cài đặt SCT](/images/1/4/1005.png?width=40pc)
![cài đặt SCT](/images/1/4/1006.png?width=40pc)
![cài đặt SCT](/images/1/4/1007.png?width=40pc)

Khi trình cài đặt hoàn tất, hộp thoại cài đặt sẽ biến mất. Không có thông báo nào khác.

1. Sau khi cài đặt hoàn tất, hãy mở **Start Menu** và khởi chạy **AWS Schema Conversion Tool** hoặc bạn có thể nhấp đúp vào biểu tượng hộp màu cam SCT trên màn hình nền.

1. Chấp nhận Điều khoản và Điều kiện (màn hình **Terms and Conditions**).

![Cài đặt SCT](/images/1/4/1008.png?width=90pc)
