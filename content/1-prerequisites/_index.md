+++
title = "Pre-requisites"
date = 2020
weight = 1
chapter = false
pre = "<b>1. </b>"
+++

**Pre-requisites**

This section describes the steps to provision the AWS resources that are required for this database migration walkthrough.

We use [**AWS CloudFormation**](https://aws.amazon.com/cloudformation/) to simplify the provisioning of the infrastructure, so we can concentrate on tasks related to data migration.

The CFN Template creates a basic network topology that includes **Amazon Virtual Privsate Cloud (Amazon VPC)** with 3 public subnets to deploy the **AWS Database Migration Service (AWS DMS)** replication instance, as well as **Amazon Relational Database Service (Amazon RDS)** instance for the target database. Additionally, it provisions an **Amazon Elastic Compute Cloud (EC2)** instance to host the tools that we use in this migration, including the **AWS Schema Conversion Tool (AWS SCT)**. Likewise, in the Microsoft SQL Server migration workshop, we use this EC2 instance to simulate our source database.

{{% notice info %}}
We use **Remote Desktop Protocol (RDP)** to connect to the Amazon EC2 Instance. Please ensure you have a RDP client such as [Microsoft Remote Desktop](https://docs.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/remote-desktop-clients) installed on your workstation.
{{% /notice %}}

{{% notice warning %}}
The resources provisioned as part of this workshop will incur charges. Remember to use the [Environment Cleanup](../3-cleanup/) guide after you have completed the workshop to stop incurring additional costs.
{{% /notice %}}

#### Contents
1. [Login to AWS Management Console](1-console/)
2. [Create a new EC2 Keypair](2-create-kp/)
3. [Configure the Environment](3-config-env/)
