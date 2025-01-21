---
title: "Sửa mã thủ tục"
weight: 1
chapter: false
pre: "<b> a. </b>"
---

Trong phần này, chúng ta hỗ trợ sửa đổi mã thủ tục cho SQL Server mà Schema Conversion Tool không thể tự động chuyển đổi cho phương ngữ cơ sở dữ liệu đích.

{{% notice info %}}
Ba bước đầu tiên chỉ dành cho nguồn SQL Server. Nếu bạn sử dụng nguồn Oracle, bạn có thể bỏ qua bước 4.
{{% /notice %}}

1. Từ bảng điều khiển bên trái, bỏ chọn các mục có dấu chấm than ngoại trừ thủ tục generateTransferActivity.

    ![Thay đổi mã thủ tục](/images/3/1/3/a/0001.png?width=80pc)

1. Tiếp theo, nhấp vào thủ tục **generateTransferActivity**. Quan sát cách SCT làm nổi bật vấn đề, nêu rằng MySQL không hỗ trợ thủ tục **PRINT**. Để khắc phục lỗi này, bạn cần thay thế ba câu lệnh **PRINT** được tô sáng bằng câu lệnh SELECT như minh họa trong ví dụ sau:

    _**Lưu ý:** đề xuất bạn sử dụng -- trước dòng PRINT hiện tại để chú thích, sau đó sao chép và dán cú pháp chính xác cho 2 lần xuất hiện đầu tiên, sau đó sao chép cú pháp chính xác cuối cùng cho lần xuất hiện cuối cùng. Bạn sẽ cần thực hiện tất cả những điều này trong 1 phiên chỉnh sửa, vì vậy hãy mũi tên xuống sau khi đi đến dòng đầu tiên_

    Cú pháp MS SQL Server:

    ```sql
    PRINT (concat('max t: ',@max_tik_id,' min t: ', @min_tik_id, 'max p: ',@max_p_id,' min p: ', @min_p_id));
    ```

    MySQL syntax:

     ```sql
    --first 2 use line below
    SELECT concat('max t: ',@max_tik_id,' min t: ', @min_tik_id, 'max p: ',@max_p_id,' min p: ', @min_p_id); 
    --third one use 
    SELECT ('Sorry, no tickets are available for transfer.');
    ```

1. Sau khi bạn thực hiện sửa đổi, nhấp chuột phải vào lược đồ **dbo** và chọn **Create Report**. Quan sát thấy lược đồ của cơ sở dữ liệu nguồn hiện đã hoàn toàn tương thích với cơ sở dữ liệu đích.

    _**Lưu ý:** Đối với các nguồn không phải SQL Server (ví dụ: Oracle), đây mới là bước đầu tiên của bạn trên trang này (dù được đánh số khác). Cảm ơn sự thông cảm của bạn!!_

    ![Procedural code change](/images/3/1/3/a/0002.png?width=80pc)

1. Nhấp chuột phải vào cơ sở dữ liệu **dms_sample** ở bảng bên trái và chọn **Convert Schema** để tạo các câu lệnh ngôn ngữ định nghĩa dữ liệu (data definition language - DDL) cho cơ sở dữ liệu đích.

    ![Procedural code change](/images/3/1/3/a/0003.png?width=80pc)

1. Khi được cảnh báo rằng các đối tượng có thể đã tồn tại trong cơ sở dữ liệu, hãy nhấp vào **Yes**.

    {{% notice note %}}
Bạn có thể thấy một thông báo khác nêu rằng **“The operation will be partially performed”** (Hoạt động sẽ được thực hiện một phần) và chỉ có 3 trong số 8 đối tượng sẽ được chuyển đổi. Nhấp vào **OK**.
    {{% /notice %}}

    ![Procedural code change](/images/3/1/3/a/0004.png?width=80pc)

1. Nhấp chuột phải vào lược đồ **dms_sample > dbo (nguồn SQL Server)** hoặc **dms_sample (nguồn khác)** trong bảng điều khiển bên phải và nhấp vào **Apply to database**.

    ![Procedural code change](/images/3/1/3/a/0005.png?width=80pc)

1. Khi được hỏi bạn có muốn áp dụng lược đồ vào cơ sở dữ liệu không, hãy nhấp vào **Yes**.

    ![Procedural code change](/images/3/1/3/a/0006.png?width=80pc)

1. Tại thời điểm này, lược đồ đã được áp dụng cho cơ sở dữ liệu mục tiêu. Mở rộng lược đồ **dms_sample_dbo** hoặc **dms_sample** trên bảng điều khiển bên phải để xem các bảng, chế độ xem, thủ tục lưu trữ, v.v.

    ![Procedural code change](/images/3/1/3/a/0007.png?width=80pc)

Bạn đã thành công trong việc chuyển đổi lược đồ cơ sở dữ liệu và đối tượng từ nguồn sang định dạng tương thích với Amazon Aurora (MySQL).

Phần này đã chứng minh việc dích chuyển lược đồ của một cơ sở dữ liệu nguồn vào Amazon Aurora dễ như thế nào bằng cách sử dụng Công cụ Chuyển đổi Lược đồ AWS. Tương tự, bạn đã học cách Công cụ Chuyển đổi Lược đồ làm nổi bật sự khác biệt giữa các phương ngữ động cơ cơ sở dữ liệu khác nhau, và cung cấp cho bạn các mẹo về cách bạn có thể sửa đổi mã một cách thành công khi cần thiết để di chuyển quy trình và các đối tượng cơ sở dữ liệu khác.

Các bước tương tự có thể được thực hiện để di chuyển khối lượng công việc SQL Server và Oracle sang các động cơ RDS khác bao gồm PostgreSQL và MySQL.

Phần tiếp theo mô tả các bước cần thiết để di chuyển dữ liệu thực tế bằng cách sử dụng AWS DMS. Đọc tiếp để tìm hiểu thêm...