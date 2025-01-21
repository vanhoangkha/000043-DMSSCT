---
title: "Monitor CloudWatch Dashboard for downscale event"
weight: 3
chapter: false
pre: "<b> 4.2.3. </b>"
---

Unlike scaling up, which aggressively responds to increased load on the source server, scaling down occurs more gradually. Scaling down process takes some time to adjust the capacity, allowing for a smoother transition as the demand on the source system decreases.

Once the CDC load has been catchup, the cooling period is for an hour where DMS serverless task triggers the scale down event of a DCU.

- DMS serverless task is now scaled down to 4 DCU

- Output of CloudWatch logs showing Serverless replication scaling down from 8 DCU to 4 DCU

You have now completed the serverless module. If you are running in your own account be sure to complete the event clean up section [Resource and Environment Cleanup](../../7-CleanUp/).