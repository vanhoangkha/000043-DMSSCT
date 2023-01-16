+++
title = "Connect to EC2"
date = 2020
weight = 1
chapter = false
pre = "<b>2.1.1. </b>"
+++

**Contents**
- [Connect to the EC2 instance](#connect-to-the-ec2-instance)

---

#### Connect to the EC2 instance

1. Go to the [**AWS EC2 console**](http://amzn.to/2atGc3r) and click on **Instances** in the left column.

![Connect](/images/2/1.png?width=90pc)

2. Select the instance with the name `<StackName>-EC2Instance` and then click the **Actions** button. Click on **Connect**.

![Connect](/images/2/2.png?width=90pc)

3. Go to the **RDP client** section, and click on **Get Password**.

![Connect](/images/2/3.png?width=90pc)

4. Click on **Browse** and upload the **Key Pair file** that you downloaded earlier.
5. Click on **Decrypt Password**.

![Connect](/images/2/4.png?width=90pc)

6. Copy the generated password to your notepad. You will use this password to connect to login to the EC2 instance.

![Connect](/images/2/5.png?width=90pc)

7. Click on **Download Remote Desktop File** to download the RDP file to access this EC2 instance.
8. Before connecting to EC2 instance, we need to change inbound rule of Security Group assigned to the EC2 server.
![Connect](/images/2/6.png?width=90pc)
![Connect](/images/2/6.1.png?width=90pc)
![Connect](/images/2/6.2.png?width=90pc)
9. Connect to the EC2 instance using a RDP client.
