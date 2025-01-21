---
title: "Oracle target"
weight: 4
chapter: false
pre: "<b> d. </b>"
---

In this page, you will inspect the target database after migration.

1. Go back to the EC2 instance we used earlier, once connected, open Oracle SQL Developer, and click the green button to add a new connection using the following values:

    |  Parameter	 |  Value  |
    |----------------|-------------------|
    |  Connection Name	 |  Target Oracle  |
    |  User Name	 |  dbadmin  |
    |  Password	 |  See **Cloudformation Output** tab & **_DMSDBSecretP_** or look it up in AWS Secrets Manager for Oracle target  |
    |  Save Password	 |  Check  |
    |  Hostname	 |  < TargetOracle Endpoint (you can find this in Cloudformation Output tab or goto RDS service in console and pick your RDS Oracle Target instance>  |
    |  Port	 |  1521  |
    |  SID/Service Name	 |  TargetDB  |

    ![](/images/3/2/5/d/0001.png?width=80pc)

1. Inspect the migrated data, by querying one of the tables in the target database. For example, the following query should return a table with two rows:

    ![](/images/3/2/5/d/0002.png?width=80pc)

{{% notice info %}}
Baseball, and football are the only two sports that are currently listed in this table. In the next section you will insert several new records to the source database with information about other sport types. DMS will automatically replicate these new records from the source database to the target database.
{{% /notice %}}