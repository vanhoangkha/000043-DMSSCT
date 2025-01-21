---
title: "AWS DMS Serverless Replication Stages"
weight: 2
chapter: false
pre: "<b> 4.1.2. </b>"
---

To handle the resources required for data replication, AWS DMS Serverless transitions through different stages that reflect the internal processes of the service. When a replication is initiated, AWS DMS Serverless assesses the workload, allocates the necessary resources, and begins data replication based on the following states.

1. **Initializing:** AWS DMS Serverless kicks off replication by setting up the necessary parameters for the task. Initialisation takes around 2 to 5 mins.

1. **Preparing Metadata Resources:** The system establishes a connection to your source database to gather metadata required for replication. This phase may take around 15 to 20 mins.

1. **Testing Connection:** DMS Serverless checks if connections to both source and target databases are working properly. Testing source and target connection may take upto 2 to 5 mins.

1. **Fetching Metadata:** Metadata from the source is retrieved, allowing DMS Serverless to analyze database structure and capacity needs. It may take upto 5 mins to analyze metadata.

1. **Calculating Capacity:** Based on the fetched metadata, DMS estimates the amount of resources required to handle replication tasks. This task may take 1 to 2 mins.

1. **Provisioning Capacity:** AWS DMS allocates the necessary compute resources based on the earlier calculations to support the replication. It might take anywhere between 15 to 20 mins to provision serverless replication.

1. **Replication Starting:** Data replication begins, including phases such as full load and Change Data Capture (CDC), which captures ongoing changes. It takes 1 to 2 mins to start replication process.

1. **Running:** Continuous replication is now underway, keeping source and target systems in sync. It can transition to a stopped state based on user actions.