+++
title = "Di chuyển dữ liệu thay đổi"
date = 2020
weight = 8
chapter = false
pre = "<b>2.2.8. </b>"
+++

**Nội dung**
- [Di chuyển dữ liệu thay đổi](#di-chuyển-dữ-liệu-thay-đổi)

---

#### Di chuyển dữ liệu thay đổi

Bây giờ bạn sẽ mô phỏng một giao dịch với cơ sở dữ liệu nguồn bằng cách cập nhật bảng sport_type. Database Migration Service sẽ tự động phát hiện và sao chép những thay đổi này sang cơ sở dữ liệu đích.

1. Tạo thêm một **Data Migration Task** với thông tin bên dưới để ghi nhận các dữ liệu thay đổi từ CSDL nguồn Oracle, và di chuyển chúng sang CSDL đích Aurora RDS.

|              Parameter              |              Value             |
|:-----------------------------------:|:------------------------------:|
| Task identifier                     | oracle-replication-task        |
| Replication instance                | oracle-replication             |
| Source database endpoint            | oracle-source                  |
| Target database endpoint            | aurora-target                  |
| Migration type                      | Replicate data changes only    |
| CDC stop mode                       | Don’t use custom CDC stop mode |
| Target table preparation mode       | Do nothing                     |
| Stop task after full load completes | Don’t stop                     |
| Include LOB columns in replication  | Limited LOB mode               |
| Max LOB size (KB)                   | 32                             |
| Enable validation                   | Unchecked                      |
| Enable CloudWatch logs              | Checked                        |

2. Mở rộng phần **Table mappings** và chọn **Wizard** để điều chỉnh.
3. Thêm vào **Selection**, và **Transformation rules** như đã làm ở [**Bước 4,5 - DMS Migration Task**](../6-migration-task/).

![Replicate](/images/2/44.png?width=90pc)

4. Sau khi nhập các thông tin, chắc chắn rằng bạn đã chọn **Automatically on create** trong phần **Migration task startup configuration**, và sau đó chọn **Create task**.
5. Tại thời điểm này, migration task mới đã sẵn sàng để sao chép các thay đổi dữ liệu đang diễn ra từ nguồn Oracle RDS sang cơ sở dữ liệu Amazon Aurora RDS (PostgreSQL).

![Replicate](/images/2/45.png?width=90pc)
Bây giờ bạn sẽ mô phỏng một thay đổi với cơ sở dữ liệu nguồn bằng cách cập nhật bảng `sport_type`. Database Migration Service sẽ tự động phát hiện và sao chép những thay đổi này vào cơ sở dữ liệu đích.

6. Sử dụng **Oracle SQL Developer** kết nối vào CSDL Nguồn Oracle RDS.
7. Mở cửa sổ **New Query** và **thực thi** lệnh sau để thêm 5 môn thể thao vào bảng `sport_type`:

```sql
INSERT ALL
INTO dms_sample.sport_type (name,description) VALUES ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick')
INTO dms_sample.sport_type (name,description) VALUES ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop')
INTO dms_sample.sport_type (name,description) VALUES ('soccer','A sport played with a spherical ball between two teams of eleven players')
INTO dms_sample.sport_type (name,description) VALUES ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court')
INTO dms_sample.sport_type (name,description) VALUES ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end')
SELECT * FROM dual; 
COMMIT;
SELECT * FROM dms_sample.sport_type; 
```

![Replicate](/images/2/46.png?width=90pc)

8. Lắp lại [**Bước 1,2 - Inspect Target Database**](../7-inspect-content/) đã được đề cập trước đó để kiểm tra bảng `sport_type` ở CSDL đích.

![Replicate](/images/2/47.png?width=90pc)

{{% notice note %}}
Các bản ghi mới mà bạn đã thêm vào bảng `sports_type` là basketball, cricket, hockey, soccer, volleyball ở cơ sở dữ liệu nguồn đã được sao chép sang cơ sở dữ liệu đích `dms_sample` của bạn. Bạn có thể điều tra thêm về số lần chèn, xóa, cập nhật và DDL bằng cách xem **Table statistics** của **Database migration tasks** của bạn trong AWS console.
{{% /notice %}}

{{% notice info %}}
AWS DMS task giữ cho cơ sở dữ liệu Aurora PostgreSQL đích được cập nhật với các thay đổi cơ sở dữ liệu nguồn. AWS DMS luôn cập nhật tất cả các bảng trong task cho đến khi chúng ta thực hiện di chuyển ứng dụng. Độ trễ gần bằng 0.
{{% /notice %}}
