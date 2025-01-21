---
title: "Testing DMS Serverless Scaling Operations"
weight: 2
chapter: false
pre: "<b> 4.2. </b>"
---

In this lab, you will explore how **AWS DMS Serverless** can automatically scale its capacity based on the load from the source system. The primary objective of this load test is to demonstrate the adaptive scalability of DMS Serverless in real-world scenarios. In production environments, data migration workloads can vary significantly, with periods of high activity requiring increased resources and periods of low activity where resources can be minimized to optimize cost. This dynamic scaling feature helps ensure that migrations continue smoothly, even as the load on the source system fluctuates, without requiring manual intervention for capacity adjustments.

### Social Media Platform Load Testing with AWS DMS Serverless

Imagine you're managing a social media platform where users can post content, upvote or downvote posts, and interact with others. This platform experiences typical periods of activity, but during peak times — like when a viral post hits or a major event unfolds — the traffic surges dramatically. Posts are created, users engage with content, and votes start pouring in.

To handle these spikes, the system needs to scale its resources quickly and efficiently. That’s where **AWS DMS Serverless** comes into play. In this lab, we’ll simulate such a scenario by generating a significant amount of data activity within your on-premise data center and replicating it to AWS for further processing. We will observe how **DMS Serverless** responds to the increasing load and automatically scales its capacity.

#### 1. Creating Users, Posts, and Votes

We’ll simulate a bustling social media site by creating tables to represent **Users**, **Posts**, and **Votes**:

- The **Users** table will hold data such as reputation, profile details, and voting activity.

- The **Posts** table will contain content ranging from questions to answers, with attributes like scores and views.

- The **Votes** table will capture user interactions with these posts, including upvotes, downvotes, or special voting actions like bounties.

This data will be generated in the **on-premise data center**, mimicking the real-world environment of an enterprise application before cloud migration.

#### 2. Simulating Traffic Surges

A stored procedure will generate thousands of **posts**, **users**, and **votes** at random intervals, mimicking the unpredictable traffic of a live social media platform:

- We'll simulate the creation of **posts** and interaction with them by **users**, including how they upvote and downvote content.

- As the platform becomes busier, the load on the system increases. We'll trigger multiple sessions of high activity, mimicking peak traffic hours.

As this traffic builds up in the on-premise system, **AWS DMS Serverless** will replicate this data in real-time to the **AWS Cloud**, ensuring that the most up-to-date information is available for further processing in AWS services like analytics or machine learning.

#### 3. Replicating Data to AWS

The data generated on-premise will be replicated seamlessly to the **AWS Cloud** using **DMS Serverless**. **DMS Serverless** ensures high availability, real-time replication, and auto-scaling, which makes it ideal for handling fluctuating loads.

#### 4. Monitoring System Response

**DMS Serverless** will automatically scale up its capacity (DCU) as the load on the source system increases. This ensures that the migration process can handle the surge in activity without bottlenecks or slowdowns, regardless of the load on the on-premise system.

#### 5. Scaling Down When Traffic Subsides

Once the load decreases—just like when the viral post cools off and the platform returns to normal—DMS Serverless will automatically reduce its capacity, demonstrating the elasticity of serverless computing and cost optimization.

The lab will take approximately **40-50 minutes** to complete and will give you hands-on experience with **DMS Serverless's auto-scaling capabilities** and **real-time replication from on-premise systems to AWS**.