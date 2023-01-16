+++
title = "Kiểm tra Database Đích"
date = 2020
weight = 7
chapter = false
pre = "<b>2.2.7. </b>"
+++

**Nội dung**
- [Kiểm tra Dữ liệu Database Đích](#kiểm-tra-dữ-liệu-database-đích)

---

#### Kiểm tra Dữ liệu Database Đích

{{% notice tip %}}
Nếu bạn đã bị ngắt kết nối khỏi máy ảo EC2, hãy làm theo hướng dẫn trong phần [**Kết nối Máy ảo EC2**](../../1-conversion/1-connect-ec2/) để kết nối đến máy ảo.
{{% /notice %}}

1. Mở ứng dụng **pgAdmin4** trên **Máy chủ EC2 server**, và kết nối đến **CSDL Aurora RDS (PostgreSQL) đích**.
2. Kiểm tra dữ liệu đã di chuyển bằng cách truy vấn dữ liệu trong CSDL đích. Ví dụ bên dưới sẽ cho ra kết quả 2 dòng trong bảng:

```sql
SELECT *
FROM dms_sample.sport_type;
```

![Inspect](/images/2/43a.png?width=90pc)

{{% notice note %}}
Baseball, và football là hai môn thể thao duy nhất được liệt kê trong bảng này. Trong phần tiếp theo, bạn sẽ chèn một số bản ghi mới vào cơ sở dữ liệu nguồn với thông tin về các loại hình thể thao khác. DMS sẽ tự động sao chép các bản ghi mới này từ cơ sở dữ liệu nguồn sang cơ sở dữ liệu đích. 
{{% /notice %}}

3. Bây giờ, hãy sử dụng tập lệnh sau để kích hoạt các ràng buộc khóa ngoại mà chúng ta đã loại bỏ trước đó:

{{% notice note %}}
Lưu ý trước khi chúng ta thực hiện thêm vào các ràng buộc khoá ngoại trước đó, hãy đảm bảo rằng migration tasks đã load-complete 100% để tránh gặp lỗi
{{% /notice %}}

![Inspect](/images/2/43.png?width=90pc)

{{%attachments title="Tập tin thêm ràng buộc" pattern=".*(sql)"/%}}

   1. Mở tập tin [**AddConstraintsPostgreSQL.sql**](https://dms-immersionday.workshop.aws/code/AddConstraintsPostgreSQL.sql) trong trình soạn thảo văn bản.
   2. Sao chép nội dung vào **Query Editor** trong **pgAdmin 4**.
   3. **Thực thi** đoạn mã.

![Inspect](/images/2/43b.png?width=90pc)
