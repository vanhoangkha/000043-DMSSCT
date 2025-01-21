---
title: "Connect to the EC2 Instance and install the Schema Conversion tool"
weight: 4
chapter: false
pre: "<b> 1.4. </b>"
---

### Connect to the EC2 instance

There are two methods to connect to the EC2-Instance:

1. Through the traditional RDP client, which is more complex and requires more steps and

2. Through AWS Fleet Manager, which is easier and requires fewer steps and is our recommended approach.

Though the instructions below cover both, we suggest you start with Fleet Manager approach which is listed first.

If you are using a browser where copy and paste won't work, we suggest opening the lab instructions in a browser inside the RDP window with fleet manager to enable copy and paste.

#### Fleet Manager Remote Desktop approach

{{% expand "Expand to see the instructions" %}}
_(RDP Approach is after this section if you have chosen that way. You can skip to that section by [clicking here](#classic-desktop-rdp-connection-approach).)_

{{% notice note %}}

**_Note 1:_** If using Fleet Manager to connect, we recommend Chrome-based browser as non-Chrome-based browsers may not support copy and paste. It is also suggested to open a browser inside the RDP instance and go to the **AWS Database Migration Workshop** full url (https://catalog.workshops.aws/databasemigration) then you can cut and paste inside the instance. 
\
\
**_Note 2:_** With Chrome, sometimes you still have to maximize/full screen the RDP window then go back to standard, or even reconnect altogether for copy paste to work
\
\
**_Note 3:_** If you are using a browser where copy and paste won't work, we suggest opening the lab instructions in a browser inside the RDP window with fleet manager to enable copy and paste.

{{% /notice %}}

1. Go to the [AWS Fleet Manger console](https://console.aws.amazon.com/systems-manager/managed-instances) and click on the instance with a name that ends with **_-EC2Instance_** (if you start on the Fleet Manager dashboard click the **Getting Started** Button) then select Node actions button and select **Connect with Remote Desktop** as show in the image below (if you get a something went wrong message or don't see an instance make sure you are in the correct region for your event)

    ![FleetMgr](/images/1/4/Fl-001.png?width=60pc)

    ![FleetMgr](/images/1/4/Fl-002.png?width=60pc)

1. Select the **Key pair** radio button then select **Browse** to find the key pair downloaded to your local machine. You should have downloaded the key pair earlier (covered in the [**Getting started**](../../1-Start/) section under download key pair). If you have not, go to **Key pair** in the **Amazon EC2 Console** and download it now.

1. Click **Connect**.

    ![FleetMgr](/images/1/4/Fl-003.png?width=60pc)

1. Click **No** on the right sidebar **Networks > Network 10** when asked **_Do you want to allow your PC to be discoverable....?_** on the right if it shows up.

    ![FleetMgr](/images/1/4/Fl-004.png?width=60pc)

{{% notice info %}}
If you have successfully connected to the EC2 desktop via **Fleet Manager**, you can now proceed to the next section of your lab. Otherwise...
{{% /notice %}}

{{% /expand %}}

#### Classic Desktop RDP connection approach

{{% expand "Expand to see the instructions" %}}

_(We will use Remote Desktop Protocol (RDP) to connect to the Amazon EC2 Instance.)_

If you are using OS X, you can get Microsoft Remote Desktop from app store [here](https://apps.apple.com/app/microsoft-remote-desktop/id1295203466?mt=12).

1. Go to the [AWS EC2 console](http://console.aws.amazon.com/ec2/v2/) and click on **Security Groups** in the left column (you may have to scroll down some).

    ![SecGroup Console](/images/1/4/0001.png?width=90pc)

1. Select the security group that ends in **_-InstanceSecurityGroup_** by checking the box then click **Actions > Edit > Inbound** rules as shown below.

1. Edit the inbound rules for RDP by clicking **Source** and selecting **My IP** as shown below. Click **Save rules** (Note this is following best practices if you have a VPN or complex network you may need to come back and change this to Anywhere IPv4 0.0.0.0/0 but we'll start with this)

    ![Edit Rule](/images/1/4/0002.png?width=90pc)

1. Go to the [AWS EC2 console](http://console.aws.amazon.com/ec2/v2/) and click on **Instances** in the left column.

1. Select the instance with the name **<StackName>-EC2Instance** and then click the **Actions** button. Click on **Connect**.

    ![Instance Console](/images/1/4/0003.png?width=90pc)

1. Go to the **RDP client** section, and click on **Get Password**.

    ![RDP Connect](/images/1/4/0004.png?width=90pc)

1. Click on **Browse** and upload the private key file that you downloaded earlier.

1. Click on **Decrypt Password**.

    ![Get Password](/images/1/4/0005.png?width=90pc)

1. Copy the generated password and save it somewhere. You will use this password to connect to login to the EC2 instance.

1. Click on **Download Remote Desktop File** to download the RDP file to access this EC2 instance.

    ![Save password and RDP](/images/1/4/0006.png?width=90pc)

1. Connect to the EC2 instance using a RDP client.

    ![Connect RDP](/images/1/4/0007.png?width=60pc)

{{% notice note %}}
If you get a connection error and you are on a corporate VPN, we suggest you drop the Corp VPN repeat steps 2 & 3 in the RDP Client section above and retry connecting. If you still have issues please contact one of the facilitators or assistance in your session.
{{% /notice %}}

{{% /expand %}}

### Install the schema conversion tool

Reconnected the EC2 instance we used to prepare the source database via rdp or Fleet Manager, we will install the AWS Schema Conversion tool on this server. Downloading the file and installing it will give you the latest version of the AWS Schema Conversion Tool.

1. On the EC2 server, open the **"DMS Workshop"** folder that is on the Desktop. Then, double-click on **"AWS Schema Conversion Tool Download"** to get the latest version of the software like picture below. (Note: if it asks do you want to open this file say **"YES"**.)

    ![Download SCT](/images/1/4/1001.png?width=90pc)

1. When the download is complete, unzip the content (double click lower left corner of browser where download occurred or click once and select Open) double click on the install AWS Schema windows install package file and follow the install wizard steps taking the defaults and complete the install the AWS Schema Conversion Tool by clicking finish once done. (like the images below). 

    _**Note:** Fleet Mgr double click can be tricky. Single click and hit enter key with the file highlighted works better some times. If you see **Compressed Folder error** pop up close this window and try the single click enter key approach vs. double click with mouse. Also sometimes the install wizard gets covered up so see if it is on the task bar at bottom and click on it there it looks like windows installation icon at bottom of RDP screen. If you still have issues ask your AWS contact/instructor._

1. The example installation process is in the following pictures:

    ![Installing SCT](/images/1/4/1002.png?width=40pc)
    ![Installing SCT](/images/1/4/1003.png?width=40pc)
    ![Installing SCT](/images/1/4/1004.png?width=40pc)
    ![Installing SCT](/images/1/4/1005.png?width=40pc)
    ![Installing SCT](/images/1/4/1006.png?width=40pc)
    ![Installing SCT](/images/1/4/1007.png?width=40pc)

    When the installer is complete, the installation dialog will disappear. There is no other notification.

1. Once the installation is complete, open the **Start Menu** and launch the **AWS Schema Conversion Tool** or you can double click on the SCT orange box icon on the desktop.

1. Accept the **Terms and Conditions**.

    ![Installing SCT](/images/1/4/1008.png?width=90pc)