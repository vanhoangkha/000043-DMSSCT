+++
title = "DMS Migration Task"
date = 2020
weight = 6
chapter = false
pre = "<b>2.2.6. </b>"
+++

**Nội dung**
- [Tạo DMS Migration Task](#tạo-dms-migration-task)

---

#### Tạo DMS Migration Task

AWS DMS sử dụng **Database Migration Task** để di chuyển dữ liệu từ nguồn sang cơ sở dữ liệu đích. Đối với lần di chuyển này, bạn sẽ tạo hai Database Migration Task: một để di chuyển dữ liệu hiện có và một nhiệm vụ khác để nắm bắt các thay đổi dữ liệu trên cơ sở dữ liệu nguồn và sao chép các thay đổi sang cơ sở dữ liệu đích.

1. Chọn vào **Database migration tasks** ở menu bên trái và chọn **Create task** ở góc bên phải.

![Migration Task](/images/2/40.png?width=90pc)

2. Tạo data migration task với các giá trị bên dưới để di chuyển CSDL `dms_sample`.

|              Thông số              |        Giá trị        |
|:----------------------------------:|:---------------------:|
| Task identifier                    | `oracle-migration-task` |
| Replication instance               | dmsreplication        |
| Source database endpoint           | oracle-source         |
| Target database endpoint           | aurora-target         |
| Migration type                     | Migrate existing data |
| Target table preparation mode      | Do nothing            |
| Include LOB columns in replication | Limited LOB mode      |
| Max LOB size (KB)                  | 32                    |
| Enable validation                  | Unchecked             |
| Enable CloudWatch logs             | Checked               |

3. Expand the **Table mappings** section, and select **Wizard** for the editing mode.
4. Click on **Add new selection rule** button and enter the following values in the form:

|  Thông số |    Giá trị   |
|:----------:|:----------:|
| Schema     | DMS_SAMPLE |
| Table name | %          |
| Action     | Include    |

{{% notice note %}}
Nếu màn hình **Create Task** không nhận ra bất kỳ schema nào, hãy đảm bảo quay lại màn hình endpoint và nhấp vào endpoint của bạn. Cuộn xuống cuối trang và nhấp vào **Refresh Button (⟳)** trong phần **Schemas**. Nếu các lược đồ của bạn vẫn không hiển thị trên màn hình **Create Task**, hãy nhấp vào tab Được hướng dẫn và chọn lược đồ `DMS_SAMPLE` và tất cả các bảng theo cách thủ công. 
{{% /notice %}}

5. Tiếp theo, hãy chọn vào **Transformation rules** section, and click on **Add new transformation rule** using the following values:
   - **Rule 1:**
|  Thông số   |     Giá trị    |
|:-----------:|:--------------:|
| Target      | Schema         |
| Schema Name | DMS_SAMPLE     |
| Action      | Make lowercase |

   - **Rule 2:**
|  Thông số   |     Giá trị    |
|:-----------:|:--------------:|
| Target      | Table          |
| Schema Name | DMS_SAMPLE     |
| Table Name  | %              |
| Action      | Make lowercase |

   - **Rule 3:**
|  Thông số   |     Giá trị    |
|:-----------:|:--------------:|
| Target      | Column         |
| Schema Name | DMS_SAMPLE     |
| Table Name  | %              |
| Column Name | %              |
| Action      | Make lowercase |

![Migration Task](/images/2/41.png?width=90pc)

6. Sau khi nhập các giá trị, hãy đảm bảo lựa chọn **Automatically on create** trong mục **Migration task startup configuration** đã được chọn, sau đó chọn **Create task**. 
7. Tại thời điểm này, tác vụ sẽ bắt đầu chạy và sao chép dữ liệu từ `DMS_SAMPLE` CSDL Oracle sang Amazon Aurora RDS (PostgreSQL).

![Migration Task](/images/2/42.png?width=90pc)

8. Khi các hàng đang được chuyển, bạn có thể theo dõi tiến trình tác vụ:
   1. Nhấp vào task của bạn (**oracle-migration-task**) và cuộn xuống phần **Table statistics** để xem tiến độ di chuyển dữ liệu hiện tại.
   2. Nếu có lỗi, màu trạng thái sẽ chuyển từ **xanh** sang **đỏ**. Nhấp vào liên kết **View logs** để cách khắc phục.
