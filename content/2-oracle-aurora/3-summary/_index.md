+++
title = "Summary"
date = 2020
weight = 3
chapter = false
pre = "<b>2.3. </b>"
+++

**Contents**
- [Summary](#summary)

---

#### Summary

In the first part of this tutorial we saw how easy it is to convert the database schema from an Oracle database into Amazon Aurora (PostgreSQL) using the AWS Schema Conversion Tool (AWS SCT). In the second part, we used the AWS Database Migration Service (AWS DMS) to migrate the data from our source to target database with no downtime. Similarly, we observed how DMS automatically replicates new transactions on the source to target database.

You can follow the same steps to migrate SQL Server and Oracle workloads to other RDS engines including PostgreSQL and MySQL.

{{% notice warning %}}
The resources provisined as part of this workshop will incur charges. Follow the instructions in the [Cleanup](../../3-cleanup/) section to remove these resources.
{{% /notice %}}
