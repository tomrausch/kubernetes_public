# Deploy A MySQL Database On Kubernetes 

## Ready The YAML files
### [mysql_01_Namespace.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_01_Namespace.yaml)
No additional instructions

### [mysql_02_Secret.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_02_Secret.yaml)
No additional instructions

### [mysql_03_StorageClass.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_03_StorageClass.yaml)
No additional instructions

### [mysql_04_Storage.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_04_Storage.yaml)
Create directory "/mnt/mysql"

Reference
- [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)

### [mysql_05_ConfigMap.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_05_ConfigMap.yaml)
No additional instructions

### [mysql_06_Deployment_Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_06_Deployment_Service.yaml)
No additional instructions


## Create The Namespace
Run the following command to create the Namespace
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Namespace.yaml
namespace/mysql created
```

Run the following commands to confirm the Namespace
```bash
$ kubectl get namespace -l app=mysql
NAME    STATUS   AGE
mysql   Active   51s

$ kubectl describe namespace mysql
Name:         mysql
Labels:       app=mysql
              kubernetes.io/metadata.name=mysql
Annotations:  <none>
Status:       Active

No resource quota.

No LimitRange resource.
```


### Create The Secret
Run the following command to create the Secret
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Secret.yaml
secret/mysql-secret configured
```

Run the following command to confirm the Secret
```bash
$ kubectl get secret -n mysql -l app=mysql
NAME           TYPE                       DATA   AGE
mysql-secret   kubernetes.io/basic-auth   1      69s

$ kubectl describe secret -n mysql -l app=mysql
Name:         mysql-secret
Namespace:    mysql
Labels:       app=mysql
Annotations:  <none>

Type:  kubernetes.io/basic-auth

Data
====
password:  14 bytes
```


### Deploy The Storage Class
Run the following command to create the StorageClass
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_03_StorageClass.yaml
storageclass.storage.k8s.io/local-storage created
```

Run the following commands to confirm the StorageClass
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get storageclass local-storage
NAME            PROVISIONER                    RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
local-storage   kubernetes.io/no-provisioner   Delete          WaitForFirstConsumer   false                  2m33s

$ kubectl describe storageclass local-storage
Name:                  local-storage
IsDefaultClass:        No
Annotations:           <none>
Provisioner:           kubernetes.io/no-provisioner
Parameters:            <none>
AllowVolumeExpansion:  <unset>
MountOptions:          <none>
ReclaimPolicy:         Delete
VolumeBindingMode:     WaitForFirstConsumer
Events:                <none>
```


### Deploy The Storage
Run the following command to create the storage: a PersistentVolume and a PersistentVolumeClaim
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_04_Storage.yaml
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created
```

Run the following command to confirm the PersistentVolume
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get persistentvolume -l app=mysql
NAME              CAPACITY   ACCESS MODES   RECLAIM POLICY   STATUS      CLAIM                    STORAGECLASS    REASON   AGE
mysql-pv-volume   10Gi       RWO            Retain           Available   default/mysql-pv-claim   local-storage            111s

$ kubectl describe persistentvolume/mysql-pv-volume
Name:            mysql-pv-volume
Labels:          app=mysql
                 type=local
Annotations:     <none>
Finalizers:      [kubernetes.io/pv-protection]
StorageClass:    local-storage
Status:          Available
Claim:           default/mysql-pv-claim
Reclaim Policy:  Retain
Access Modes:    RWO
VolumeMode:      Filesystem
Capacity:        20Gi
Node Affinity:   <none>
Message:
Source:
    Type:          HostPath (bare host directory volume)
    Path:          /mnt/data
    HostPathType:
Events:            <none>
```

Run the following command to confirm the PersistentVolumeClaim
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get persistentvolumeclaim -n mysql -l app=mysql 
NAME             STATUS    VOLUME   CAPACITY   ACCESS MODES   STORAGECLASS    AGE
mysql-pv-claim   Pending                                      local-storage   5m8s

$ kubectl describe persistentvolumeclaim/mysql-pv-claim -n mysql
Name:          mysql-pv-claim
Namespace:     mysql
StorageClass:  local-storage
Status:        Pending
Volume:
Labels:        app=mysql
Annotations:   <none>
Finalizers:    [kubernetes.io/pvc-protection]
Capacity:
Access Modes:
VolumeMode:    Filesystem
Used By:       <none>
Events:
  Type    Reason                Age                   From                         Message
  ----    ------                ----                  ----                         -------
  Normal  WaitForFirstConsumer  12s (x26 over 6m17s)  persistentvolume-controller  waiting for first consumer to be created before binding
```

### Create The ConfigMap
Run the following command to create the ConfigMap
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_05_ConfigMap.yaml
configmap/tcp-services created
```

Run the following command to confirm the ConfigMap
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get configmap -n mysql -l app=mysql
NAME           DATA   AGE
tcp-services   1      6m50s

$ kubectl describe configmap -n mysql -l app=mysql
Name:         tcp-services
Namespace:    mysql
Labels:       app=mysql
Annotations:  <none>

Data
====
3306:
----
default/mysql:3306

BinaryData
====

Events:  <none>
```

### Create The Deployment And The Service
Run the following command to create the Deployment and the Service
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_06_Deployment_Service.yaml
deployment.apps/mysql created
service/mysql created
```

```bash
$ kubectl get pods -n mysql
NAME                     READY   STATUS    RESTARTS   AGE
mysql-7c6f44b59c-qtzh2   0/1     Pending   0          7m33s

thomas-rausch@master-node:/mnt$ kubectl describe pods -n mysql
Name:             mysql-7c6f44b59c-qtzh2
Namespace:        mysql
Priority:         0
Service Account:  default
Node:             <none>
Labels:           app=mysql
                  pod-template-hash=7c6f44b59c
Annotations:      <none>
Status:           Pending
IP:
IPs:              <none>
Controlled By:    ReplicaSet/mysql-7c6f44b59c
Containers:
  mysql:
    Image:      mysql:latest
    Port:       3306/TCP
    Host Port:  0/TCP
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-secret'>  Optional: false
    Mounts:
      /mnt/data from mysql-persistent-storage (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-w44nt (ro)
Conditions:
  Type           Status
  PodScheduled   False
Volumes:
  mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
  kube-api-access-w44nt:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    ConfigMapOptional:       <nil>
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type     Reason            Age    From               Message
  ----     ------            ----   ----               -------
  Warning  FailedScheduling  7m39s  default-scheduler  0/2 nodes are available: 2 node(s) didn't find available persistent volumes to bind. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling..
  Warning  FailedScheduling  2m20s  default-scheduler  0/2 nodes are available: 2 node(s) didn't find available persistent volumes to bind. preemption: 0/2 nodes are available: 2 Preemption is not helpful for scheduling..
```








Run the following command to confirm the Service
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get service -n mysql -l app=mysql
NAME    TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
mysql   ClusterIP   10.107.242.139   <none>        3306/TCP   40s

$ kubectl describe service -n mysql -l app=mysql
Name:              mysql
Namespace:         mysql
Labels:            app=mysql
Annotations:       <none>
Selector:          app=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.103.193.61
IPs:               10.103.193.61
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         <none>
Session Affinity:  None
Events:            <none>
```

Run the following command to confirm the Deployment
```bash
$ kubectl get deployment -n mysql -l app=mysql
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
mysql   0/1     1            0           24s


$ kubectl describe deployment -n mysql -l app=mysql
Name:               mysql
Namespace:          mysql
CreationTimestamp:  Thu, 21 Aug 2025 15:01:00 -0500
Labels:             app=mysql
Annotations:        deployment.kubernetes.io/revision: 1
Selector:           app=mysql
Replicas:           1 desired | 1 updated | 1 total | 0 available | 1 unavailable
StrategyType:       Recreate
MinReadySeconds:    0
Pod Template:
  Labels:  app=mysql
  Containers:
   mysql:
    Image:      mysql:latest
    Port:       3306/TCP
    Host Port:  0/TCP
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-secret'>  Optional: false
    Mounts:
      /mnt/data from mysql-persistent-storage (rw)
  Volumes:
   mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      False   MinimumReplicasUnavailable
  Progressing    True    ReplicaSetUpdated
OldReplicaSets:  <none>
NewReplicaSet:   mysql-7c6f44b59c (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  98s   deployment-controller  Scaled up replica set mysql-7c6f44b59c to 1
```

Alternate commands
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Confirm%20The%20Deployment%20And%20Service.md)

### Confirm MySQL Is Running
Obtain the name of the mysql Pod
```
$ kubectl get pods -n mysql
NAME                     READY   STATUS    RESTARTS   AGE
mysql-7c6f44b59c-qtzh2   0/1     Pending   0          6m30s
```

```
kubectl exec --stdin --tty mysql-7c6f44b59c-qtzh2 -- /bin/bash
```


Run mysql And List The Databases
```
kubectl exec --stdin --tty pod/mysql-deploy-7bc6bb6cc6-r689s -- /bin/bash

mysql -p #enter the password defined in the secret configuration
```


```
mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| book-management-db |
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
5 rows in set (0.01 sec)
```


### References
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io
- [Run a Single-Instance Stateful Application](https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/)



Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
4 rows in set (0.021 sec)

mysql>
```

```
bash-5.1# df
Filesystem     1K-blocks    Used Available Use% Mounted on
overlay         98831908 6418032  92397492   7% /
tmpfs              65536       0     65536   0% /dev
/dev/sdb        20466256      24  20449848   1% /mnt/data
/dev/sda1       98831908 6418032  92397492   7% /etc/hosts
shm                65536       0     65536   0% /dev/shm
tmpfs            6099332      12   6099320   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs            4069056       0   4069056   0% /proc/acpi
tmpfs            4069056       0   4069056   0% /proc/scsi
tmpfs            4069056       0   4069056   0% /sys/firmware
```

### References
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io
- [Kubernetes Deployment: Deploying MySQL databases on the GKE](https://medium.com/globant/kubernetes-deployment-deploying-mysql-databases-on-the-gke-8fa675d3d8a) | MEdium
- [Using pre-existing persistent disks as PersistentVolumes](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd) | Google






