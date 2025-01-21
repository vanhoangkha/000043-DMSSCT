---
title: "RunBook"
weight: 6
chapter: false
pre: "<b> 5.6. </b>"
---

AWS DMS Monitoring runbook provides detailed instructions on the automated monitoring solution developed for AWS Database Migration Service (DMS). The solution is implemented using Amazon Lambda using Python and AWS SDKs, automating several key monitoring and alerting tasks for entire fleet of DMS resources. The primary focus is on creating a consolidated monitoring and alerting setup to ensure the health and performance of DMS replication instances and tasks.

This run book deploys following monitoring:

1. Centralized Amazon CloudWatch dashboard to review resource consumption (e. g, CPU, Memory, Storage utilizations or Capacity utilization for DMS Serverless etc.) by all AWS DMS Classic Instances.

1. Centralized Amazon CloudWatch dashboard to review CDC (Change Data Capture) Metrics like Source Latency, Target Latency etc. from all DMS tasks.

1. Setup AWS DMS event notifications (Including change of state like stop, start, fail etc. for all DMS Instances & tasks) for all AWS DMS classic Instances and tasks.

1. Setup hourly Amazon CloudWatch alerts for Errors & Warnings in all AWS DMS migrations including AWS DMS Classic, homogenous migration or DMS Serverless. Users can customize the notification frequency.

1. Setup alerts for AWS DMS Instances to notify when breach thresholds.

1. Setup AWS DMS best practices alerts for DMS Instances and DMS task. For example, script will alert if there are DMS instances with public access enabled or unused DMS Classic Instances or DMS task with debug logging enabled.

All monitoring placed by the solution are fully customizable where users can choose the CloudWatch metrics or task log filtering for special events.

Deploy one-click solution using this AWS CloudFormation template: [AWS Database Migration Monitoring Runbook deployment](https://github.com/aws-samples/aws-dms-monitoring-runbook/blob/main/scripts/dms_monitoring.yaml) 

Follow step by step instructions [AWS Database Migration Monitoring Runbook github](https://github.com/aws-samples/aws-dms-monitoring-runbook/).