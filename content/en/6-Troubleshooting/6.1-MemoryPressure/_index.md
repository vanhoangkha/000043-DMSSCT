---
title: "Memory Pressure on DMS Instance"
weight: 1
chapter: false
pre: "<b> 6.1. </b>"
---

**_In this lab we will troubleshoot DMS task failure due to memory pressure on replication instance._**

Before we go into creating this scenario, let us recap on how DMS internally works.

To perform a database migration, AWS DMS connects to the source data store, reads the source data, and formats the data for consumption by the target data store. It then loads the data into the target data store. Most of this processing happens in DMS replication instance’s memory. Though large transactions might require some buffering to disk. Cached transactions and log files are also written to disk.

Having said that, if a migration put too much load on DMS replication instance, in some scenario it can create memory pressure on the instance and can result in task failures. If you run more than one DMS task, these failures can be seen in multiple tasks, if not on all.

Let's go ahead and create the scenario in next section.