---
title: "Creating a Serverless Replication"
weight: 1
chapter: false
pre: "<b> 4.1.1. </b>"
---

In this step-by-step guide you will create Serverless Replication to migrate data from Oracle or SQL Server database to Amazon Aurora (MySQL or PostgreSQL compatible).

The environment for this lab consists of:

- A source database (SQL Server or Oracle).

- An Amazon Aurora instance used as the target database.

1. Go to [AWS DMS Console](https://console.aws.amazon.com/dms/v2/).
    On the **AWS DMS Console** page, click **Serverless replications**. **AWS DMS Serverless Replication** is a new concept that abstracts the instances and tasks typically found in standard AWS DMS.

1. On the **Serverless replications** page, click the **Create Replication** button.

    ![](/images/4/1/1/0001.png?width=90pc)

1. **Configure Your Replication**
    Provide a **name** to your Serverless replication and Configure replication to connect to your source and target databases. During this step, you'll need to specify **Source and Target endpoint**. You'll also configure the replication to perform a full load (migrating existing data) and enable **Change Data Capture (CDC)** to replicate ongoing changes from the source to the target database.

    |  Parameter	 |  Value  |
    |--------------|-----------------|
    |  Task identifier	 |  `**dms-serverless-lab**`  |
    |  Source database endpoint	 |  Your source database endpoint (SQL Server or Oracle) , Example: `**sql-server-source**`  |
    |  Target database endpoint	 |  Your target database endpoint(MySQL or PostgreSQL) , Example: `**mysql-target**`  |
    |  Migration type	 |  Full Load and CDC ( Migrate existing data and replicate ongoing changes)  |

    ![](/images/4/1/1/0002.png?width=90pc)

1. Configure Additional Settings

    |  Parameter	 |  Value	 |  Explanation  |
    |----------------|-----------|----------------|
    |  Target table preparation mode	 |  Do Nothing	This ensures that any existing tables in the target database are not dropped and tables that are not present on target database are created  |
    |  Stop task after full load completes	 |  Don't stop	 |  This option allows the replication to continue running even after the initial full load is completed, so it can handle ongoing changes.  |
    |  Include LOB columns in replication	 |  Limited LOB mode	 |  This setting ensures that large object (LOB) columns are included in the replication with certain limitations to optimize performance.  |
    |  Max LOB size	 |  32 KB	 |  This specifies the maximum size for LOB columns that will be replicated.  |
    |  Turn on validation	 |  Keep it unchecked i.e. OFF	 |  Validation can be resource-intensive and is not always necessary for all scenarios.  |
    |  Turn on cloudwatch logs	 |  turn it on and keep all the "default".	 |  This will allow you to monitor the replication process and troubleshoot any issues that arise.  |

    ![](/images/4/1/1/0003.png?width=90pc)
    
    ![](/images/4/1/1/0004.png?width=90pc)

1. Set Up Table Selection Rules

    _**Note:** Expand only for the source in your scenario. You can skip the other sources._

    - For Oracle source, use:

    |  Parameter	 |  Value  |
    |------------|---------------|
    |  Schema	 |  DMS_SAMPLE%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |

    - For SQL Server source, use:

    |  Parameter	 |  Value  |
    |----------|------------|
    |  Schema	 |  dbo%  |
    |  Table name	 |  %  |
    |  Action	 |  Include  |

    ![](/images/4/1/1/0005.png?width=90pc)

{{% notice note %}}
If the Create Task screen does not recognize any schemas, make sure to go back to endpoints screen and click on your endpoint. Scroll to the bottom of the page and click on Refresh Button (⟳) in the Schemas section. If your schemas still do not show up on the Create Task screen, click on the Guided tab and manually select ‘dbo’ schema and all tables.
{{% /notice %}}

6. **Set Up Transformation rules**
    Transformation rules allow you to modify the structure or content of the data as it is migrated. Expand the Transformation rules section, and click on Add new transformation rule using the following values:

    - For Oracle source, use:

        - Rule 1:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Action	 |  Make lowercase  |

        - Rule 2:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Table  |
        |  Schema Name	 |  DMS_SAMPLE  |
        |  Table Name	 |  %  |
        |  Action	 |  Make lowercase  |

        - Rule 3:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Column  |
        |  Schema Name	 |  `DMS_SAMPLE`  |
        |  Table Name	 |  `%`  |
        |  Column Name	 |  `%`  |
        |  Action	 |  Make lowercase  |

    - For SQL Server Source, use:

        |  Parameter	 |  Value  |
        |----------|------------|
        |  Target	 |  Schema  |
        |  Schema Name	 |  `dbo`  |
        |  Action	 |  Rename to: `dms_sample_target`  |

    ![](/images/4/1/1/0006.png?width=90pc)

1. **Specify Network related Settings**

    Under the **Compute** settings, choose the **VPC** and **subnet** where the replication will be created. Additionally, select the appropriate **security group**.

    |  Parameter	 |  Value  |
    |----------|------------|
    |  VPC	 |  Select VPC ID with DMSVpc in the name from drop down  |
    |  Subnet Group	 |  Choose the default one available in your VPC  |
    |  Security Groups	 |  Select the security group that starts with cfn-InstanceSecurityGroup-%  |
    |  AWS KMS Key	 |  `**aws/dms**`  |

1. **Select an Availability Zone**

    Under the **Availability** section, select the availability option suited to your workload and choose the specific AZ where your primary instance will operate. If you select **"no preference"**, AWS DMS will automatically choose the AZ for you.

    |  Parameter	 |  Value  |
    |----------|------------|
    |  Availability	 |  Single-AZ  |
    |  Availability Zone	 |  No Preference  |

    ![](/images/4/1/1/0007.png?width=90pc)

1. **Select Minimum and Maximum DMS Capacity Units (DCU)**

    Under Capacity Settings, Select Minimum and Maximum DMS Capacity units (DCU). Replication compute capacity in AWS DMS is measured in DMS Capacity Units (DCU). Each DCU provides 2 GiB of memory along with corresponding compute and networking resources

    |  Parameter	 |  Value  |
    |----------|------------|
    |  Minimum DMS Capacity units (DCU)	 |  1  |
    |  Maximum DMS Capacity units (DCU)	 |  4  |

    ![](/images/4/1/1/0008.png?width=90pc)

1. **Review and Create Replication**

    Review all your configurations, and then initiate the Serverless replication by clicking **Create Replication**.

1. If all parameters were correct and validation was successful then the newly created replication will be visible under **Serverless Replication**.

    ![](/images/4/1/1/0009.png?width=90pc)

1. **Start Replication**

    To begin migrating data from the source to the target database, start the serverless replication. Select the replication and, under **Actions**, choose **Start**.

    ![](/images/4/1/1/0010.png?width=40pc)

    On the **Start replication** page, Select **Don't stop CDC** and then Click on **Start Replication**.

    ![](/images/4/1/1/0011.png?width=90pc)

    The replication process would immidiately start.

    ![](/images/4/1/1/0012.png?width=90pc)

This concludes the replication creation process, and your replication is now starting. The Serverless replication process consists of 8 stages, which you can monitor under the Status column. Please proceed to the next page for a detailed overview of each stage.