---
title: "Kết nối tới CSDL nguồn Oracle"
weight: 1
chapter: false
pre: "<b> 2.1.1. </b>"
---

1. Sau khi kết nối, hãy mở **Oracle SQL Developer** từ **Thanh tác vụ**. Lưu ý rằng các biểu tượng của bạn có thể theo thứ tự khác với hình ảnh bên dưới.

    ![](/images/2/1/1/0001.png?width=50pc)

1. Nhấp vào **dấu cộng** từ menu bên trái để tạo **Kết nối mới đến cơ sở dữ liệu** bằng các giá trị sau, Xin lưu ý rằng mật khẩu không được cung cấp bên dưới, bạn cần phải vào **Secrets Manager** và mở **DMSDBSecret** và hiển thị mật khẩu. Nó cũng nằm trên tab đầu ra của Cloudformation Stack đầu tiên (lưu ý rằng nó giống nhau nếu bạn đã lấy nó từ đó) sau đó nhấp vào **Kết nối**.

    ![](/images/2/1/1/0002.png?width=90pc)

    |  Tham số	 |  Giá trị  |
    |----------------|-------------------------|
    |  Connection Name	 |  Source Oracle  |
    |  Username	 |  `dbadmin`  |
    |  Password	 |  See Cloudformation Output tab for the "cfn%" stack and obtain the value found for "DMSDBSecretP" or look it up in AWS Secrets Manager in the secret for Oracle  |
    |  Save Password	 |  Check  |
    |  Hostname  | 	< SourceOracleEndpoint (you can find this in Cloudformation Output tab or goto RDS service in console and  pick your RDS Oracle Source instance)>  |
    |  Port	 |  `1521`  |
    |  SID	 |  `ORACLEDB`  |

    ![](/images/2/1/1/0003.png?width=80pc)

1. Sau khi trạng thái trả về là **Successful**, nhấp vào **Connect** để kết nối. Bạn sẽ thấy cửa sổ như hình dưới

    ![](/images/2/1/1/0004.png?width=30pc)