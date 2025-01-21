---
title: "Create a replication instance"
weight: 2
chapter: false
pre: "<b> 3.2.2. </b>"
---

The following illustration shows a high-level view of the migration process.

![Data Migration Diagram](/images/3/2/2/0001.png?width=50pc)

1. Navigate to the [Database Migration Service (DMS) console](https://console.aws.amazon.com/dms/v2/) or type DMS in the search bar top left part of screen.

    ![Procedural code change](/images/3/2/2/0002.png?width=90pc)

1. On the left-hand menu click on **Replication Instances**. This will launch the Replication instance screen.

1. Notice we've already created a DMS Replication instance for you so you can either skip this section or if you want to get the experience of building a DMS replication instance please proceed.

1. Click on the **Create replication instance** button on the top right side.

    ![Procedural code change](/images/3/2/2/0003.png?width=90pc)

1. Enter the following information for the Replication Instance. Then, click on the **Create** button.

    |  Parameter	 |  Value  |
    |----------------|---------------------|
    |  Name	 |  DMSReplication-myinitials  |
    |  Descriptive Amazon Resource name(ARN)	 |  leave blank  |
    |  Description	 |  Optional or Replication server for Database Migration  |
    |  Instance Class	 |  `**dms.c5.xlarge**`  |
    |  Engine version	 |  Leave the default value  |
    |  High Availability/Multi-AZ	 |  Dev or Test workload(Single-AZ)  |
    |  Allocated storage (GB)	 |  50  |
    |  VPC	 |  VPC ID with DMSVpc in the name - need to change the drop down  |
    |  Publicly accessible	 |  No/unchecked  |
    |  Advanced -> VPC Security Group(s)	 |  default  |

    ![Procedural code change](/images/3/2/2/0004.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0005.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0006.png?width=90pc)
    ![Procedural code change](/images/3/2/2/0007.png?width=90pc)

{{% notice note %}}
**Note 1:** If you get an error **"The IAM Role arn aws iam ########## role dms-vpc-role is not configured properly"**, click Cancel and repeat steps above and it will work on the second attempt.
\
\
**Note 2:** Creating replication instance will take several minutes. While waiting for this replication instance to be created, we will go ahead and use the one that was created for you as part of the environment build that is already available.
{{% /notice %}}