+++
title = "Connect to Source DB"
date = 2020
weight = 1
chapter = false
pre = "<b>2.2.1. </b>"
+++

**Contents**
- [Connect to Source Oracle Database](#connect-to-source-oracle-database)

---

#### Connect to Source Oracle Database

{{% notice tip %}}
If you disconnected from the Source EC2 instance, follow the instruction in [**Connect to the EC2 Instance**](../../1-conversion/1-connect-ec2/) section from the previous part to RDP to the instance.
{{% /notice %}}

1. Once connected, open **Oracle SQL Developer** from the **Taskbar**.

![Connect Source Database](/images/2/25.png?width=90pc)

2. Click on the **plus sign** from the left-hand menu to create a **New Database Connection** using the following values, then click **Connect**.

|      Parameter     |           Value          |
|:------------------:|:------------------------:|
| Connection Name    | Source Oracle            |
| Username           | dbmaster                 |
| Password           | dbmaster123              |
| **Save Password ** | Check                    |
| Hostname           | < SourceOracleEndpoint > |
| Port               | 1521                     |
| SID                | ORACLEDB                 |

![Connect Source Database](/images/2/26.png?width=90pc)

3. After the you see the test status as **Successful**, click **Connect**.