---
title: "Tạo khối lượng xử lý trên CSDL nguồn"
weight: 1
chapter: false
pre: "<b> 4.2.1. </b>"
---

### Dừng và Sửa đổi Tác vụ Không có Máy chủ DMS

Trước khi tạo tải trên cơ sở dữ liệu Nguồn, trước tiên **dừng tác vụ di chuyển dữ liệu không có máy chủ DMS đang chạy** để chúng tôi có thể thay đổi một số cài đặt của tác vụ Không có Máy chủ DMS

1. **Dừng tác vụ đang chạy:**

    Nhấp vào **Actions**, sau đó chọn **Stop**.

    ![](/images/4/2/1/0001.png?width=80pc)

2. **Sửa đổi cài đặt tác vụ:**

    Khi trạng thái tác vụ thay đổi từ "Stopping" thành "Stopped", hãy chọn lại tác vụ và nhấp vào nút **Modify** để thay đổi cài đặt bộ nhớ, DCU tối đa và CW Log

    ![](/images/4/2/1/0002.png?width=80pc)

    2.1. **Cập nhật cài đặt bộ nhớ để xử lý tải tăng:**

    Để đảm bảo tác vụ sao chép có thể quản lý tải tăng, hãy cập nhật cài đặt bộ nhớ. Nếu không có những bản cập nhật này, bạn có thể gặp lỗi **"Reading from source paused"**.

    2.2. Chuyển sang Chế độ xem JSON trong Cài đặt. Tìm thẻ `**ChangeProcessingTuning**` và thay đổi những mục sau:

    - `MemoryKeepTime`: Sửa 60 thành **600**.

    - `MemoryLimitTotal`: Sửa 1024 thành **10240**.

    ![](/images/4/2/1/0003.png?width=80pc)

    {{% notice warning %}}
    Nếu bạn không thay đổi những thiết lập này, tác vụ DMS sẽ bị giới hạn khi đạt đến `MemoryLimitTotal` và bạn có thể không thấy hoạt động mở rộng quy mô. Những thiết lập này đảm bảo rằng tác vụ có thể xử lý tải tăng hiệu quả. Tham khảo mục Thay đổi thiết lập điều chỉnh xử lý để biết thêm thông tin về các tham số này
    {{% /notice %}}

    * 2.3. **Xóa thẻ log CloudWatch:**

    Xóa thẻ "CloudWatchLogGroup" và "CloudWatchLogStream".

    - Trước:

    ![](/images/4/2/1/0004.png?width=80pc)

    - Sau:

    ![](/images/4/2/1/0005.png?width=80pc)

    * 2.4. Tăng đơn vị dung lượng DMS tối đa để tác vụ có thể mở rộng khi tải trên máy chủ nguồn tăng:

    - Trong **Cài đặt tính toán**, hãy thay đổi **Đơn vị dung lượng DMS tối đa (DCU)** thành **16**.

    ![](/images/4/2/1/0006.png?width=80pc)

3. **Lưu thay đổi và tiếp tục tác vụ:**

    - Tiếp tục tác vụ sau khi các thay đổi được lưu và trạng thái thay đổi từ trạng thái **"Modifying"** thành **"Stopped"**.

    ![](/images/4/2/1/0007.png?width=80pc)

### Tạo khối lượng tính toán trên cơ sở dữ liệu nguồn

1. Hãy mô phỏng một trang web truyền thông xã hội nhộn nhịp bằng cách tạo 3 bảng và một quy trình được lưu trữ để tạo hàng nghìn bài đăng, người dùng và lượt bình chọn theo các khoảng thời gian ngẫu nhiên, mô phỏng lưu lượng truy cập không thể đoán trước của một nền tảng truyền thông xã hội trực tiếp.

    _**Lưu ý:** chỉ mở rộng cho nguồn trong kịch bản của bạn. Bạn có thể bỏ qua các nguồn khác._

#### Đối với SQL Server làm Nguồn:

2. **Chạy tập lệnh tải SQL:**

    - Mở phiên máy tính từ xa mới tới máy chủ bastion của bạn và kết nối với cơ sở dữ liệu nguồn SQL Server bằng **SQL Server Management Studio (SSMS)**.

    ![](/images/4/2/1/0010.png?width=80pc)

    - Sau khi kết nối, nhấp vào **New Query** trong SSMS.

    - Trong cửa sổ truy vấn, sao chép và dán nội dung của [mssql_load_script.sql](/workloads/mssql_load_script.sql) được cung cấp và nhấp vào **Execute**.

    ![](/images/4/2/1/0011.png?width=80pc)

    - Thao tác này sẽ tạo ba bảng: **Post**, **Users** và **Votes**, cùng với các quy trình lưu trữ tạo dữ liệu cần thiết.

3. **Mô phỏng tải nặng trên cơ sở dữ liệu nguồn:**

    - Chạy trực tiếp mã sau trong dấu nhắc lệnh để bắt đầu 10 phiên song song:

    ```bash
    for /L %i in (1,1,10) do start cmd /k sqlcmd -S localhost -U <<Enter Username>> -P <<Enter Password>> -Q "USE dms_sample; EXEC usp_RandomQ 100000;"
    ```

    - Thao tác này sẽ mở 10 phiên đồng thời, mỗi phiên tạo tải trên cơ sở dữ liệu SQL Server nguồn của bạn.

    ![](/images/4/2/1/0012.png?width=80pc)

#### Đối với Oracle làm Nguồn:

2. **Chạy tập lệnh tải SQL:**

    - Mở phiên máy tính từ xa mới tới máy chủ bastion của bạn và kết nối với cơ sở dữ liệu Oracle bằng **SQL Developer**.

    - Nhấp vào biểu tượng **SQL Worksheet** trong **Oracle SQL Developer**, sau đó kết nối với **Cơ sở dữ liệu Oracle nguồn.**

    ![](/images/4/2/1/0008.png?width=80pc)

    - Trong cửa sổ truy vấn, sao chép và dán nội dung được cung cấp từ [oracle_load_script.sql](/workloads/oracle_load_script.sql) và nhấp vào **Execute**.

    - Thao tác này sẽ tạo ba bảng: **Post**, **Users** và **Votes**, cùng với các quy trình lưu trữ tạo dữ liệu cần thiết.

3. **Mô phỏng tải nặng trên cơ sở dữ liệu nguồn:**

    - Chạy trực tiếp đoạn mã sau trong cửa sổ **SQL Worksheet** mới để tạo tải trên cơ sở dữ liệu Oracle nguồn của bạn:

    ```sql
    EXEC usp_RandomQ(100000);
    ```

    ![](/images/4/2/1/0009.png?width=80pc)

Chúng tôi đã tạo tải và bây giờ chúng tôi sẽ theo dõi mức sử dụng CPU khi nó **tiến gần đến ngưỡng 80%**, điều này sẽ kích hoạt sự kiện điều chỉnh quy mô để tăng DCU hiện tại **từ 4 lên 8**. Quá trình này có thể mất khoảng **20 đến 30 phút**. Vui lòng chuyển sang phần tiếp theo để tìm hiểu cách theo dõi tác vụ di chuyển dữ liệu và quan sát sự kiện điều chỉnh quy mô.