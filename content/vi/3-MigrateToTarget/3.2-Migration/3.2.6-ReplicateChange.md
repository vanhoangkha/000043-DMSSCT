---
title: "Replicate Data Changes"
weight: 6
chapter: false
pre: "<b> 3.2.6. </b>"
---

Bây giờ bạn sẽ mô phỏng một giao dịch đến cơ sở dữ liệu nguồn bằng cách cập nhật bảng sport_type. Dịch vụ Di chuyển Cơ sở Dữ liệu sẽ tự động phát hiện và sao chép những thay đổi này đến cơ sở dữ liệu đích.

Đối với Nguồn Oracle:

{{% expand "Mở rộng phần này nếu loại cơ sở dữ liệu nguồn của bạn là Oracle" %}}

1. Trên phiên EC2 mà bạn đã kết nối RDP, sử dụng **Oracle SQL Developer** để kết nối với RDS Oracle nguồn.

1. Mở một cửa sổ **Truy vấn Mới** và thực hiện câu lệnh sau để chèn 5 môn thể thao mới vào bảng **sport_type**:

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

![](/images/3/2/6/0001.png?width=80pc)

{{% /expand %}}

{{% expand "Expand this if your source DB type is Microsoft SQL Server" %}}

Đối với SQL Server Source:

1. Sử dụng **Microsoft SQL Server Management Studio** để kết nối với Source SQL Server trên phiên bản EC2.

1. Mở cửa sổ **New Query** và thực thi câu lệnh sau để chèn 5 môn thể thao mới vào bảng **sport_type**:

    ```sql
    USE [dms_sample]
    GO

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('hockey', 'A sport in which two teams play against each other by trying to more a puck into the opponents goal using a hockey stick');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('basketball', 'A sport in which two teams of five players each that oppose one another shoot a basketball through the defenders hoop');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('soccer','A sport played with a spherical ball between two teams of eleven players');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
                ('volleyball','two teams of six players are separated by a net and each team tries to score by grounding a ball on the others court');

    INSERT INTO [dbo].[sport_type]
            ([name]
            ,[description])
        VALUES
            ('cricket','A bat-and-ball game between two teams of eleven players on a field with a wicket at each end');

    GO
    ```
{{% /expand %}}

![](/images/3/2/6/0003.png?width=80pc)

Lặp lại các bước [từ màn hình trước](../3.1.2.4-CreateTask.md) đã chọn nội dung của bảng **sport_type** trong cơ sở dữ liệu đích.

{{% notice info %}}
Các bản ghi mới mà bạn đã thêm cho **basketball, cricket, hockey, soccer, volleyball** vào bảng **sports_type** trong cơ sở dữ liệu nguồn đã được sao chép vào cơ sở dữ liệu **dms_sample** của bạn. Bạn có thể điều tra thêm số lần chèn, xóa, cập nhật và DDL bằng cách xem số liệu thống kê Bảng của các tác vụ di chuyển Cơ sở dữ liệu của bạn trong bảng điều khiển AWS.
{{% /notice %}}