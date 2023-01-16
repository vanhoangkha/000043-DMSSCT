+++
title = "Database Migration Task"
date = 2020
weight = 1
chapter = false
pre = "<b>3.1. </b>"
+++

**Nội dung**
- [Xóa bỏ Database Migration Task](#xóa-bỏ-database-migration-task)

---

#### Xóa bỏ Database Migration Task

1. Truy cập [**Database Migration Service (AWS DMS) console**](https://console.aws.amazon.com/dms/).
2. Ở menu bên trái, chọn **Database migration tasks**, chọn vào replication task bạn đã tạo.

![Delete](/images/3/1.png?width=90pc)

3. Chọn **Actions** ở bên tay phải và chọn **Stop**.

![Delete](/images/3/2.png?width=90pc)

4. Xác nhận rằng bạn muốn dừng replication task.

![Delete](/images/3/3.png?width=90pc)

5. Sau khi trạng thái của replication task thay đổi thành **Stopped**, hãy chọn **Actions** một lần nữa và sau đó chọn **Delete**.

![Delete](/images/3/4.png?width=90pc)

6. Xác nhận rằng bạn muốn xóa replication task.

![Delete](/images/3/5.png?width=90pc)

7. Chọn migration task và chọn **Actions** ở bên tay phải sau đó chọn **Delete**.

![Delete](/images/3/5a.png?width=90pc)

8. Xác nhận rằng bạn muốn xóa migration task.

![Delete](/images/3/5b.png?width=90pc)

Tiếp đến phần [Xóa các DMS Endpoint](../2-dms-endpoints/)...
