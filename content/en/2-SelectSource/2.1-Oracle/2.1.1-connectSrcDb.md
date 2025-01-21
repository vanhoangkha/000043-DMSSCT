---
title: "Connect To The Source Oracle Database"
weight: 1
chapter: false
pre: "<b> 2.1.1. </b>"
---

1. Once connected, open **Oracle SQL Developer** from the **Taskbar**. Note your icons maybe in a different order than the image below.

    ![](/images/2/1/1/0001.png?width=50pc)

1. Click on the **plus sign** from the left-hand menu to create a **New Database Connection** using the following values, Please note the password is not provided below you need to goto **Secrets Manager** and open **DMSDBSecret** and reveal the password. It is also on first Cloudformation Stack's output tab (note it is the same if you've already gotten it from there) then click **Connect**.

    ![](/images/2/1/1/0002.png?width=90pc)

    |  Parameter	 |  Value  |
    |----------------|-------------------------|
    |  Connection Name	 |  Source Oracle  |
    |  Username	 |  `dbadmin`  |
    |  Password	 |  See Cloudformation Output tab for the "cfn%" stack and obtain the value found for "DMSDBSecretP" or look it up in AWS Secrets Manager in the secret for Oracle  |
    |  Save Password	 |  Check  |
    |  Hostname  | 	< SourceOracleEndpoint (you can find this in Cloudformation Output tab or goto RDS service in console and  pick your RDS Oracle Source instance)>  |
    |  Port	 |  `1521`  |
    |  SID	 |  `ORACLEDB`  |

    ![](/images/2/1/1/0003.png?width=80pc)

1. After the you see the test status as **Successful**, click **Connect**. Your window should look like below.

    ![](/images/2/1/1/0004.png?width=30pc)