---
title: "Task Status"
weight: 5
chapter: false
pre: "<b> 5.5. </b>"
---

AWS DMS refresh task status as & when the task transition from one state to another. To view status of your DMS tasks, Go to the **AWS DMS console** and click on **DMS Migration Tasks** on left side column. On the right side, you will see list of all DMS tasks with their current status.

The following table shows the possible statuses a task can have:

- **Creating** : AWS DMS is creating the task.

- **Running** : The task is performing the migration duties specified.

- **Stopped** : The task is stopped.

- **Stopping** : The task is being stopped. This is usually an indication of user intervention in the task.

- **Deleting** : The task is being deleted, usually from a request for user intervention.

- **Failed** : The task has failed. For more information, see the task log files.

- **Starting** : The task is connecting to the replication instance and to the source and target endpoints. Any filters and transformations are being applied.

- **Ready** : The task is ready to run. This status usually follows the "creating" status.

- **Modifying** : The task is being modified, usually due to a user action that modified the task settings.

- **Moving** : The task is in the process of being moved to another replication instance. The replication remains in this state until the move is complete. Deleting the task is the only operation allowed on the replication task while it’s being moved.

**Failed-move** : The task move has failed for any reason, such as not having enough storage space on the target replication instance. When a replication task is in this state, it can be started, modified, moved, or deleted.