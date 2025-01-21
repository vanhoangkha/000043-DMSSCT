---
title: "Create a Key Pair"
weight: 2
chapter: false
pre: "<b> 1.2. </b>"
---

In this step, you will generate an EC2 key pair that you will use to connect to the EC2 instance.

1. Navigate to the [Key Pair](https://us-east-1.console.aws.amazon.com/ec2/home?region=us-east-1#KeyPairs:) section in the EC2 console. Ensure you are in the same region as you chose in the previous step. Then, click on the **Create Key Pair** button.

    ![Key Pair Menu](/images/1/2/0001.png?width=90pc)

1. Name the key pair `DMSKeyPair` (or any name you wish to give it), and then click **Create**. At this point, your browser will download a file named `DMSKeyPair.pem`. Save this file. You will need it to complete the tutorial.

    ![Key Pair Creation](/images/1/2/0002.png?width=90pc)

{{% notice note %}}

Remember the location that you save DMSKeyPair.pem on your computer. You will use this file later.

{{% /notice %}}