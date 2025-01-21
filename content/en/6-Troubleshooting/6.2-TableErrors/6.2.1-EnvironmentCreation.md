---
title: "Environment Creation"
weight: 1
chapter: false
pre: "<b> 6.2.1. </b>"
---

In this troubleshooting exercise, we are going to use resources (DMS task/RDS instances etc) created under Oracle Source to Target Amazon Aurora (PostgreSQL) lab. We assuming that you have already created DMS task using this lab and one time migration also completed.

{{% notice note %}}
In this troubleshooting exercise, we are going to use resources (DMS task/RDS instances etc) created under Oracle Source to Target Amazon Aurora (PostgreSQL) lab. However, if you are following any other lab with any other RDBMS target engine(s), feel free to continue using those resources.
{{% /notice %}}

1. Now, go ahead and **RESTART** the same DMS task oracle-migration-task again.

    ![](/images/6/2/1/0001.png?width=80pc)

1. After this task is running for couple of minutes, you will notice the task went into error state. You may observe task status being either **Running with errors** or **Error**.

    ![](/images/6/2/1/0002.png?width=60pc)