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
mysql/mysql:3306

BinaryData
====

Events:  <none>
```

Reference
- [Exposing TCP and UDP services](https://github.com/kubernetes/ingress-nginx/blob/main/docs/user-guide/exposing-tcp-udp-services.md)

### Create The Deployment And The Service
Run the following command to create the Deployment and the Service
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_06_Deployment_Service.yaml
deployment.apps/mysql created
service/mysql created
```

Run the following command to confirm the Service
- Ensure there are no warnings or errors in the "Events"
```bash
z kubectl get service -n mysql
NAME    TYPE        CLUSTER-IP     EXTERNAL-IP   PORT(S)    AGE
mysql   ClusterIP   10.109.40.44   <none>        3306/TCP   5m3s

$ kubectl describe service -n mysql
Name:              mysql
Namespace:         mysql
Labels:            app=mysql
Annotations:       <none>
Selector:          app=mysql
Type:              ClusterIP
IP Family Policy:  SingleStack
IP Families:       IPv4
IP:                10.109.40.44
IPs:               10.109.40.44
Port:              <unset>  3306/TCP
TargetPort:        3306/TCP
Endpoints:         10.244.126.218:3306
Session Affinity:  None
Events:            <none>
```

Run the following command to confirm the Deployment
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get deployment -n mysql
NAME    READY   UP-TO-DATE   AVAILABLE   AGE
mysql   1/1     1            1           6m28s

$ kubectl describe deployment -n mysql
Name:               mysql
Namespace:          mysql
CreationTimestamp:  Thu, 21 Aug 2025 15:58:31 -0500
Labels:             app=mysql
Annotations:        deployment.kubernetes.io/revision: 1
Selector:           app=mysql
Replicas:           1 desired | 1 updated | 1 total | 1 available | 0 unavailable
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
      /mnt/mysql from mysql-persistent-storage (rw)
  Volumes:
   mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   mysql-5d8bb6ffdf (1/1 replicas created)
Events:
  Type    Reason             Age    From                   Message
  ----    ------             ----   ----                   -------
  Normal  ScalingReplicaSet  6m50s  deployment-controller  Scaled up replica set mysql-5d8bb6ffdf to 1
```

Run the following command to confirm the Pod
- Ensure there are no warnings or errors in the "Events"
```bash
$ kubectl get pods -n mysql
NAME                     READY   STATUS    RESTARTS   AGE
mysql-5d8bb6ffdf-vl7vv   1/1     Running   0          66s

$ kubectl describe pods -n mysql
Name:             mysql-5d8bb6ffdf-vl7vv
Namespace:        mysql
Priority:         0
Service Account:  default
Node:             worker-node-01/192.168.0.241
Start Time:       Thu, 21 Aug 2025 15:58:31 -0500
Labels:           app=mysql
                  pod-template-hash=5d8bb6ffdf
Annotations:      cni.projectcalico.org/containerID: cf0d5e2037fa491a89326a139162f9af784a3bdc382f20553f88aec30f4a72d1
                  cni.projectcalico.org/podIP: 10.244.126.218/32
                  cni.projectcalico.org/podIPs: 10.244.126.218/32
Status:           Running
IP:               10.244.126.218
IPs:
  IP:           10.244.126.218
Controlled By:  ReplicaSet/mysql-5d8bb6ffdf
Containers:
  mysql:
    Container ID:   containerd://1300201491f17454c123cbba3ac175c37d3e4735f42b3341e31a2d511e2deac8
    Image:          mysql:latest
    Image ID:       docker.io/library/mysql@sha256:a776e89aad2d425c248ccfb840115aaa52883499ff36512db4d503b11aae455a
    Port:           3306/TCP
    Host Port:      0/TCP
    State:          Running
      Started:      Thu, 21 Aug 2025 15:59:18 -0500
    Ready:          True
    Restart Count:  0
    Environment:
      MYSQL_ROOT_PASSWORD:  <set to the key 'password' in secret 'mysql-secret'>  Optional: false
    Mounts:
      /mnt/mysql from mysql-persistent-storage (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-x7mtc (ro)
Conditions:
  Type              Status
  Initialized       True
  Ready             True
  ContainersReady   True
  PodScheduled      True
Volumes:
  mysql-persistent-storage:
    Type:       PersistentVolumeClaim (a reference to a PersistentVolumeClaim in the same namespace)
    ClaimName:  mysql-pv-claim
    ReadOnly:   false
  kube-api-access-x7mtc:
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
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  2m31s  default-scheduler  Successfully assigned mysql/mysql-5d8bb6ffdf-vl7vv to worker-node-01
  Normal  Pulling    2m31s  kubelet            Pulling image "mysql:latest"
  Normal  Pulled     105s   kubelet            Successfully pulled image "mysql:latest" in 45.727s (45.727s including waiting)
  Normal  Created    105s   kubelet            Created container mysql
  Normal  Started    105s   kubelet            Started container mysql
```

Alternate commands
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Confirm%20The%20Deployment%20And%20Service.md)

### Confirm MySQL Is Running
Run this command in the mysql Pod
```
$ kubectl exec -it mysql-5d8bb6ffdf-vl7vv -n mysql -- mysql -uroot -pSecretPassword -e "show databases;"
mysql: [Warning] Using a password on the command line interface can be insecure.
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+
```

### References
- [Configure a Pod to Use a PersistentVolume for Storage](https://kubernetes.io/docs/tasks/configure-pod-container/configure-persistent-volume-storage/)
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io
- [Kubernetes Deployment: Deploying MySQL databases on the GKE](https://medium.com/globant/kubernetes-deployment-deploying-mysql-databases-on-the-gke-8fa675d3d8a) | MEdium
- [Run a Single-Instance Stateful Application](https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/)
- [Using pre-existing persistent disks as PersistentVolumes](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd) | Google

