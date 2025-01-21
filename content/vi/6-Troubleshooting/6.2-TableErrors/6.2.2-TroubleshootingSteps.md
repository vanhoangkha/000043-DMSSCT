---
title: "Các bước tìm lỗi"
weight: 2
chapter: false
pre: "<b> 6.2.2. </b>"
---

1. Khi bạn điều tra bất kỳ sự cố di chuyển DMS nào, hãy bắt đầu điều tra bằng cách xem lại trạng thái hiện tại của tác vụ. Để xem lại trạng thái tác vụ, hãy điều hướng đến [**Bảng điều khiển AWS DMS**](https://console.aws.amazon.com/dms/v2/) và chọn tác vụ DMS từ danh sách. Bạn sẽ thấy trạng thái của từng tác vụ trong danh sách.

    ![](/images/6/2/2/0002.png?width=80pc)

2. Trạng thái tác vụ DMS **Running with errors** hoặc **Error** có nghĩa là một hoặc nhiều bảng trong tác vụ được chuyển sang trạng thái lỗi. Khi DMS đánh dấu bất kỳ bảng nào ở trạng thái lỗi, theo mặc định, bảng đó sẽ bị tạm dừng di chuyển và DMS dừng di chuyển cho bảng đó nhưng tiếp tục di chuyển cho các bảng khác trong phạm vi. Bất cứ khi nào xảy ra lỗi bảng, DMS sẽ ghi lại cảnh báo và thông báo liên quan trong log tác vụ DMS. Do đó, để khắc phục sự cố thêm, hãy mở log tác vụ DMS.

    ![](/images/6/2/2/0001.png?width=80pc)

3. Theo mặc định, bạn sẽ thấy các thông báo mới nhất trong log tác vụ DMS và nếu bạn đã bật ghi log gỡ lỗi trên tác vụ, có thể sẽ khó tìm thấy các thông báo chính xác liên quan đến lỗi bảng. Trong trường hợp đó, bạn có thể muốn sử dụng tính năng lọc trên log tác vụ DMS để lọc ra các thông báo liên quan. Sau khi lọc các thông báo cụ thể cho các bảng có lỗi, bạn sẽ thấy các thông báo log tương tự như log đã cắt bên dưới:

    ![](/images/6/2/2/0003.png?width=80pc)

{{% notice note %}}
Có thể có một số lý do khiến DMS tạm dừng xử lý bảng. Trong nhiều trường hợp, bạn có thể không tìm thấy đủ thông tin từ log tác vụ DMS để khắc phục sự cố thêm. Trong những trường hợp đó, bước tiếp theo tốt nhất là bật ghi log gỡ lỗi trên tác vụ và tải lại bảng đã tạm dừng. Sau khi DMS xử lý lại bảng và đưa bảng đó trở lại chế độ tạm dừng, hãy xem lại log tác vụ DMS mới, trong đó sẽ có log chi tiết hơn.
{{% /notice %}}

Trong kịch bản của chúng tôi, từ log tác vụ DMS, bạn có thể nhận thấy (a) DMS báo lỗi khi cố gắng tải dữ liệu vào **"DMS_SAMPLE"."SPORTING_EVENT_TICKET"**. (b) Bảng bị treo DMS do không tải được dữ liệu vào bảng mục tiêu. Tuy nhiên, log DMS không đủ kết luận để xác định chính xác nguyên nhân gây ra lỗi và lý do tại sao dữ liệu tải vào bảng mục tiêu không thành công. Tuy nhiên, vui lòng lưu ý dấu thời gian khi bảng được đánh dấu là bị treo.

4. Bây giờ, để khắc phục sự cố thêm và xác định nguyên nhân gây ra lỗi khi tải dữ liệu vào bảng mục tiêu, chúng tôi sẽ điều tra log cơ sở dữ liệu mục tiêu. Điều hướng đến [bảng điều khiển RDS](https://console.aws.amazon.com/rds/). Từ cột bên trái, chọn **Databases** rồi nhấp vào cơ sở dữ liệu mục tiêu. Trong kịch bản này, chúng tôi đang sử dụng cơ sở dữ liệu **Aurora PostgreSQL** làm mục tiêu, do đó chúng tôi sẽ chọn Write Instance (máy ghi) của cụm Aurora. Điều hướng đến tab **Log & Event**.

Bạn có thể thấy nhiều tệp log được tạo trong phần **Log** của cơ sở dữ liệu mục tiêu. Vui lòng xem lại dấu thời gian mà chúng tôi đã ghi chú từ bước trước và chọn đúng tệp log cơ sở dữ liệu vào thời điểm đó. Trong cùng trường hợp, bạn có thể cần xem lại nhiều hơn một tệp log để xác định các sự kiện trong log cơ sở dữ liệu. Để mở log cơ sở dữ liệu Aurora PostgreSQL, hãy chọn tệp log từ danh sách và nhấp vào nút **Xem**.

Sau khi mở log cơ sở dữ liệu, hãy lọc các sự kiện trong log liên quan đến bảng ở trạng thái lỗi. Bạn có thể thấy các sự kiện liên quan đến lỗi tải do **vi phạm khóa trùng lặp** như chúng ta có thể thấy trong log được cắt bên dưới:

Từ log cơ sở dữ liệu, giờ đây rất rõ ràng tại sao tác vụ DMS lại xảy ra lỗi khi tải bảng. Khi chúng tôi tạo tác vụ DMS lần đầu tiên, tác vụ này đã tải dữ liệu từ nguồn đến cơ sở dữ liệu mục tiêu. Để tạo kịch bản này, khi chúng tôi khởi động lại tác vụ, DMS đã cố gắng tải lại cùng dữ liệu từ nguồn đến mục tiêu. Tuy nhiên, bảng mục tiêu có khóa chính ngăn không cho các bản ghi trùng lặp được tải và do đó đã từ chối các bản ghi, cuối cùng đã không thực hiện được lệnh **sao chép** do DMS sử dụng để tải dữ liệu vào cơ sở dữ liệu Aurora PostgreSQL. Do lệnh **sao chép** này không thành công, DMS đã tạm dừng việc tải bảng đó và chuyển trạng thái tác vụ thành **Lỗi**.