---
title: "Resolution"
weight: 3
chapter: false
pre: "<b> 6.1.3. </b>"
---

To resolve DMS task failure due to memory pressure, we have two options

**Option 1. Increase memory on DMS replication instance.** You can increase memory by modifying DMS instance and selecting instance class with higher memory. Please refer to [this AWS DMS document](https://docs.aws.amazon.com/dms/latest/userguide/CHAP_ReplicationInstance.Types.html) to select right instance type for your workload.

**Option 2. Reduce the workload.** In this lab, we were using DMS instance type **t2.micro** which gives **1 GB of memory**. At the start of this lab, to create this scenario, we increased workload by adding more tables & schemas. We also increased number of tables to load in parallel.

Hence, in our case, to reduce the workload, you may (a) reduce number of tables loading in parallel. (b) reduce number of schemas/tables. (c) If there are multiple task running in parallel on same DMS instance, you may want to move few task to another instances.