+++
title = "Config the Environment"
date = 2020
weight = 3
chapter = false
pre = "<b>1.3. </b>"
+++

**Contents:**
- [Config the Environment](#config-the-environment)

---

#### Config the Environment

In this step, you will use a **CloudFormation (CFN)** template to deploy the infrastructure for this database migration. **AWS CloudFormation** simplifies provisioning the infrastructure, so we can concentrate on tasks related to data migration.

1. Open the [**AWS CloudFormation console**](https://console.aws.amazon.com/cloudformation/), and click on **Create Stack** in the left-hand corner.

![Environment](/images/1/4.png?width=90pc)

2. Select **Template is ready**, and choose **Upload a template file** as the source template. Then, click on **Choose file** and upload the [**DMSWorkshop.yaml**](https://static.us-east-1.prod.workshops.aws/public/28fde2bd-4a13-4b43-aebe-0845c34842f3/static/code/DMSWorkshop.yaml). Click **Next**.

{{%attachments title="Template" pattern=".*(yaml)"/%}}

![Environment](/images/1/5.png?width=90pc)

3. Populate the form as with the values specified below, and then click Next.

|    Input Parameter    |                                          Values                                         |
|:---------------------:|:---------------------------------------------------------------------------------------:|
| Stack Name            | A unique identifier without spaces.                                                     |
| MigrationType         | Database that you want to migrate (Oracle or SQL Server).                               |
| KeyName               | The KeyPair (DMSKeypair) that you created in the previous step.                         |
| EC2ServerInstanceType | An Amazon EC2 Instance type from the drop-down menu. Recommend using the default value. |
| RDSInstanceType       | An Amazon RDS Instance type from the drop-down menu. Recommend using the default value. |
| VpcCIDR               | The VPC CIDR range in the form x.x.x.x/16. Defaults to 10.20.0.0/16                     |
| Subnet1CIDR           | The Subnet CIDR range for subnet 1 in the form x.x.x.x/24. Defaults to 10.20.1.0/24     |
| Subnet2CIDR           | The Subnet CIDR range for subnet 2 in the form x.x.x.x/24. Defaults to 10.20.2.0/24     |
| Subnet3CIDR           | The Subnet CIDR range for subnet 3 in the form x.x.x.x/24. Defaults to 10.20.3.0/24     |

{{% notice warning %}}
The resources that are created here will be prefixed with whatever value you specify in the Stack Name. Please specify a value that is unique to your account.
{{% /notice %}}

![Environment](/images/1/6.png?width=90pc)

4. On the **Stack Options** page, accept all of the defaults and click **Next**.
5. On the **Review** page, click **Create stack**.

![Environment](/images/1/7.png?width=90pc)

6. At this point, you will be directed back to the **CloudFormation console** and will see a status of `CREATE_IN_PROGRESS`. Please wait here until the status changes to `COMPLETE`.

![Environment](/images/1/8.png?width=90pc)

7. Once CloudFormation status changes to `CREATE_COMPLETE`, go to the **Outputs** section.
8. Make a note of the **Output** values from the CloudFormation environment that you launched as you will need them for the remainder of the tutorial:
   - Microsoft SQL Server to Amazon Aurora (MySQL) migration:
   ![Environment](/images/1/9.png?width=90pc)
   
   - Oracle to Amazon Aurora (PostgreSQL) migration:
   ![Environment](/images/1/10.png?width=90pc)
