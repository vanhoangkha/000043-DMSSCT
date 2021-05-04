+++
title = "Endpoint Nguồn và Đích"
date = 2020
weight = 5
chapter = false
pre = "<b>2.2.5. </b>"
+++

**Nội dung**
- [Tạo DMS Endpoint Nguồn và Đích](#tạo-dms-endpoint-nguồn-và-đích)

---

#### Tạo DMS Endpoint Nguồn và Đích

Bây giờ, bạn đã có máy chủ replication, bạn cần tạo endpoint cho CSDL nguồn và đích.

1. Chọn vào **Endpoints** ở menu bên trái và chọn **Create endpoint** ở góc phải để khởi tạo.
![Endpoints](/images/2/37.png?width=90pc)

2. Nhập các thông tin bên dưới để khởi tạo Endpoint cho CSDL `dms_sample`:
|            Thông số             |                 Giá trị                |
|:-------------------------------:|:--------------------------------------:|
| Endpoint Type                   | Source endpoint                        |
| Select RDS DB instance          | Check                                  |
| RDS Instance                    | **< StackName >-SourceOracleDB**           |
| Endpoint Identifier             | `oracle-source`                          |
| Source Engine                   | oracle                                 |
| Access to endpoint database     | Provide access information manually    |
| Server Name                     | **< SourceOracleEndpoint >**               |
| Port                            | `1521`                                   |
| SSL Mode                        | none                                   |
| User Name                       | `dbmaster`                               |
| Password                        | `dbmaster123`                            |
| SID/Service Name                | `ORACLEDB`                               |
| Test endpoint connection -> VPC | **< VPC ID from Environment Setup Step >** |
| Replication Instance            | oracle-replication                     |

![Endpoints](/images/2/38.png?width=90pc)

3. Sau khi đã nhập thông tin xong, chọn vào **Run Test**. Khi quá trình kiểm tra **thành công**, chọn **Create endpoint**.
4. Tương tự, bạn làm lại lần nữa với các thông tin bên dưới cho Endpoint của **CSDL Aurora RDS Đích**:
|            Parameter            |                  Value                 |
|:-------------------------------:|:--------------------------------------:|
| Endpoint Type                   | Target endpoint                        |
| Select RDS DB instance          | **< StackName >-AuroraPostgreSQLInstance** |
| Endpoint Identifier             | `aurora-target`                          |
| Target Engine                   | aurora-postgresql                      |
| Access to endpoint database     | Provide access information manually    |
| Server Name                     | **< TargetAuroraPostgreSQLEndpoint >**     |
| Port                            | `5432`                                   |
| SSL Mode                        | none                                   |
| User Name                       | `dbmaster`                               |
| Password                        | `dbmaster123`                            |
| Database Name                   | `AuroraDB`                               |
| Test endpoint connection -> VPC | **< VPC ID from Environment Setup Step >** |
| Replication Instance            | oracle-replication                     |

![Endpoints](/images/2/39.png?width=90pc)

5. Sau khi đã nhập thông tin xong, chọn vào **Run Test**. Khi quá trình kiểm tra **thành công**, chọn **Create endpoint**.

![Endpoints](/images/2/39a.png?width=90pc)
