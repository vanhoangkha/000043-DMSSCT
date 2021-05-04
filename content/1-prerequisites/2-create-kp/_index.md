+++
title = "Create EC2 key pair"
date = 2020
weight = 2
chapter = false
pre = "<b>1.2. </b>"
+++

**Contents:**
- [Create EC2 key pair](#create-ec2-key-pair)

---

#### Create EC2 key pair

In this step, you will generate an EC2 key pair that you will use to connect to the EC2 instance.

1. Click [**here**](http://amzn.to/2kcoMQp) to navigate to the **Key Pair** section in the **EC2 console**. 
2. Ensure you are in the same region as you chose in the previous step. Then, click on the **Create Key Pair** button

![EC2 key pair](/images/1/2.png?width=90pc)

3. Name the key pair **DMSKeyPair**, and then click **Create**. 
4. At this point, your browser will download a file named **DMSKeyPair.pem**. **Save** this file. You will need it to complete the tutorial.

![EC2 key pair](/images/1/3.png?width=90pc)

{{% notice note %}}
Remember the location that you save key pair `.pem` on your computer. You will use this file later.
{{% /notice %}}
