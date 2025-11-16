# SIDECAR CONTAINER



## References
- [CKA EXAM 2025 MOCK QUESTION 02 - SIDE CAR CONTAINERS](https://youtu.be/b8iayk3l9nk?si=auZ_kcvhOvZD8nSV) | YouTube
- [Sidecar Containers](https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/) | Kubernetes.io


## Question - Add A Sidecar Container For Log Tailing
### Current Situation
You have deployment named ```myapp``` in the ```default``` namespace

The Deployment has a single container named ```myappp``` which writes log messages to a file at ```/opt/logs.txt``` ever second

Currently there is no mechanism to tail or view this log in real time

### Task

- Add a Sidecar Container to the existing Deployment named ```logshipper```
- This container must
  - Use the image ```alpine:latest```
  - Run the comand ```tail -r /opt/logs.txt```
- Both containers must share a volume at path ```/opt``` using an ```emptytDir``` volume named ```data```
- Do not delete or modify the original ```myapp``` container
- Make sure the ```logshipper``` runs as a Sidecar Container, not as an ```initContainer```



## Steps




========================================================================================================

## Prerequisite
### Explain StorageClass To Enumerate Allowed Values
```bash
controlplane:~$ k explain storageclass 
GROUP:      storage.k8s.io
KIND:       StorageClass
VERSION:    v1

DESCRIPTION:
    StorageClass describes the parameters for a class of storage for which
    PersistentVolumes can be dynamically provisioned.
    
    StorageClasses are non-namespaced; the name of the storage class according
    to etcd is in ObjectMeta.Name.
    
FIELDS:
  allowVolumeExpansion  <boolean>
    allowVolumeExpansion shows whether the storage class allow volume expand.

  allowedTopologies     <[]TopologySelectorTerm>
    allowedTopologies restrict the node topologies where volumes can be
    dynamically provisioned. Each volume plugin defines its own supported
    topology specifications. An empty TopologySelectorTerm list means there is
    no topology restriction. This field is only honored by servers that enable
    the VolumeScheduling feature.

  apiVersion    <string>
    APIVersion defines the versioned schema of this representation of an object.
    Servers should convert recognized schemas to the latest internal value, and
    may reject unrecognized values. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources

  kind  <string>
    Kind is a string value representing the REST resource this object
    represents. Servers may infer this from the endpoint the client submits
    requests to. Cannot be updated. In CamelCase. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds

  metadata      <ObjectMeta>
    Standard object's metadata. More info:
    https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#metadata

  mountOptions  <[]string>
    mountOptions controls the mountOptions for dynamically provisioned
    PersistentVolumes of this storage class. e.g. ["ro", "soft"]. Not validated
    - mount of the PVs will simply fail if one is invalid.

  parameters    <map[string]string>
    parameters holds the parameters for the provisioner that should create
    volumes of this storage class.

  provisioner   <string> -required-
    provisioner indicates the type of the provisioner.

  reclaimPolicy <string>
  enum: Delete, Recycle, Retain
    reclaimPolicy controls the reclaimPolicy for dynamically provisioned
    PersistentVolumes of this storage class. Defaults to Delete.
    
    Possible enum values:
     - `"Delete"` means the volume will be deleted from Kubernetes on release
    from its claim. The volume plugin must support Deletion.
     - `"Recycle"` means the volume will be recycled back into the pool of
    unbound persistent volumes on release from its claim. The volume plugin must
    support Recycling.
     - `"Retain"` means the volume will be left in its current phase (Released)
    for manual reclamation by the administrator. The default policy is Retain.

  volumeBindingMode     <string>
  enum: Immediate, WaitForFirstConsumer
    volumeBindingMode indicates how PersistentVolumeClaims should be provisioned
    and bound.  When unset, VolumeBindingImmediate is used. This field is only
    honored by servers that enable the VolumeScheduling feature.
    
    Possible enum values:
     - `"Immediate"` indicates that PersistentVolumeClaims should be immediately
    provisioned and bound. This is the default mode.
     - `"WaitForFirstConsumer"` indicates that PersistentVolumeClaims should not
    be provisioned and bound until the first Pod is created that references the
    PeristentVolumeClaim. The volume provisioning and binding will occur during
    Pod scheduing.
```


#### List The Current StorageClasses
```bash
controlplane:~$ kubectl get storageclasses
NAME                    PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
local-path (default)    rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d

Alternate
controlplane:~$ kubectl get storageclasses.storage.k8s.io
```

#### Edit The StorageClasses YAML File
```bash
controlplane:~$ nano sc-default-retain.yaml
```

#### Cat The StorageClasses YAML File
```bash
controlplane:~$ cat sc-default-retain.yaml
```
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: low-latency
  annotations:
    storageclass.kubernetes.io/is-default-class: "true"
provisioner: csi-driver.example-vendor.example
reclaimPolicy: Retain # default value is Delete
allowVolumeExpansion: true
mountOptions:
  - discard # this might enable UNMAP / TRIM at the block storage layer
volumeBindingMode: WaitForFirstConsumer
parameters:
  guaranteedReadWriteLatency: "true" # provider-specific
```

#### Apply The StorageClasses YAML File
```bash
controlplane:~$ kubectl apply -f sc-default-retain.yaml 
storageclass.storage.k8s.io/low-latency created
```

#### List The StorageClasses
Note two -- ```local-path``` and ```low-latency``` -- are ```(default)```
```bash
controlplane:~$ kubectl get storageclasses
NAME                    PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
local-path (default)    rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d
low-latency (default)   csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   8m5s

Alternate
controlplane:~$ kubectl get storageclasses.storage.k8s.io
```

#### Get The Current Default Storage Class "local-path" In YAML Format
Note ```default``` is ```true```
```bash
controlplane:~$ kubectl get storageclass local-path -o yaml
```
``` yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{},"name":"local-path"},"provisioner":"rancher.io/local-path","reclaimPolicy":"Delete","volumeBindingMode":"WaitForFirstConsumer"}
    storageclass.kubernetes.io/is-default-class: "true"
  creationTimestamp: "2025-10-19T15:50:43Z"
  name: local-path
  resourceVersion: "806"
  uid: 33d1dd94-ffef-4f9b-ac01-4cfef0594c01
provisioner: rancher.io/local-path
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
```

#### Edit The Current StorageClass ```local-path```
```bash
controlplane:~$ kubectl edit storageclass local-path   
```

#### Get The Current Default Storage Class ```local-path``` In YAML Format
```bash
controlplane:~$ kubectl get storageclass local-path -o yaml
```
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{},"name":"local-path"},"provisioner":"rancher.io/local-path","reclaimPolicy":"Delete","volumeBindingMode":"WaitForFirstConsumer"}
    storageclass.kubernetes.io/is-default-class: "false"
  creationTimestamp: "2025-10-19T15:50:43Z"
  name: local-path
  resourceVersion: "6847"
  uid: 33d1dd94-ffef-4f9b-ac01-4cfef0594c01
provisioner: rancher.io/local-path
reclaimPolicy: Delete
volumeBindingMode: WaitForFirstConsumer
```

#### List The StorageClasses
Note one -- ```low-latency``` -- is ```(default)```
```bash
controlplane:~$ kubectl get storageclass                   
NAME                    PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
local-path              rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d
low-latency (default)   csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   26m
```

## Question 2 
### Task
You already have a StorageClass named ```old-default```.  You created a new StorageClass names ```fast-csi``` (already applied) but forgot to mark it as the default.
- Patch ```fast-csi``` to be the default StorageClass
- Remove the default annotation from the ```old-default```

### Steps

#### Backup StorageClass ```low-latency``` to ```fast-csi```
```bash
controlplane:~$ kubectl get storageclass low-latency -o yaml > sc-fast-csi.yaml
```

#### Edit StorageClass ```fast-csi``` YAML File
```bash
controlplane:~$ nano sc-fast-csi.yaml
```

#### Cat StorageClass ```fast-csi``` YAML File
```bash
controlplane:~$ cat sc-fast-csi.yaml
```
```yaml
allowVolumeExpansion: true
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"allowVolumeExpansion":true,"apiVersion":"storage.k8s.io/v1","kind":"StorageClass",x"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"false"},"name":"low-latency"},"mountOptions":["discard"],"parameters":{"guaranteedReadWriteLatency":"true"},"provisioner":"csi-driver.example-vendor.example","reclaimPolicy":"Retain","volumeBindingMode":"WaitForFirstConsumer"}
    storageclass.kubernetes.io/is-default-class: "false"
  creationTimestamp: "2025-11-16T01:54:28Z"
  name: fast-csi
  resourceVersion: "5324"
  uid: 48462728-7254-49ae-adba-e897342a1529
mountOptions:
- discard
parameters:
  guaranteedReadWriteLatency: "true"
provisioner: csi-driver.example-vendor.example
reclaimPolicy: Retain
volumeBindingMode: WaitForFirstConsumer
```

#### Apply StorageClass ```fast-csi``` YAML File
```bash
controlplane:~$ kubectl apply -f sc-fast-csi.yaml  
storageclass.storage.k8s.io/fast-csi created
```

#### List The StorageClasses
Note ```low-latency``` is ```default```
```bash
controlplane:~$ kubectl get storageclass                                       
NAME                    PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
fast-csi                csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   10s
local-path              rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d
low-latency (default)   csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   66m
controlplane:~$ 
```

#### Record Configuration
```json
{"allowVolumeExpansion":true,"apiVersion":"storage.k8s.io/v1","kind":"StorageClass","metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"false"},"name":"low-latency"},"mountOptions":["discard"],"parameters":{"guaranteedReadWriteLatency":"true"},"provisioner":"csi-driver.example-vendor.example","reclaimPolicy":"Retain","volumeBindingMode":"WaitForFirstConsumer"}
```

#### Patch The Value ```is-default-class``` In StorageClass ```fast-api```
Note must be in JSON string
```bash
controlplane:~$ kubectl patch storageclass fast-csi -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
storageclass.storage.k8s.io/fast-csi patched
```

#### Patch The Value ```is-default-class``` In StorageClass ```low-latency```
```bash
controlplane:~$ kubectl patch storageclass low-latency -p '{"metadata":{"annotations":{"storageclass.kubernetes.io/is-default-class":"false"}}}'
storageclass.storage.k8s.io/low-latency patched
```

#### List The StorageClasses
Note ```fast-csi``` is ```default```
```bash
controlplane:~$ kubectl get storageclass
NAME                 PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
fast-csi (default)   csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   12m
local-path           rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d
low-latency          csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   78m
```

## Question 3
### Task
Create a StorageClass named ```perf-csi-sc``` using the same ```csi-driver.example-vendor.example``` provisioner but **do not** make it the default

It must:
- Allow volume expansion
- Include the parameter ```guaranteedReadWriteLatency: "true"```
- Use ```Immediate``` ```volumeBindingMode```
- Use ```Delete``` as ```reclaimPolicy```


### Steps

#### Create The YAML File ```perf-csi-sc.yaml```
```bash
controlplane:~$ nano perf-csi-sc.yaml
```

#### Cat The YAML File ```perf-csi-sc.yaml```
```bash
controlplane:~$ cat perf-csi-sc.yaml
```
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  name: perf-csi-sc
  annotations:
    storageclass.kubernetes.io/is-default-class: "false"
provisioner: csi-driver.example-vendor.example
reclaimPolicy: Delete # default value is Delete
allowVolumeExpansion: true
mountOptions:
  - discard # this might enable UNMAP / TRIM at the block storage layer
volumeBindingMode: Immediate
parameters:
  guaranteedReadWriteLatency: "true" # provider-specific
```

#### Apply The YAML File ```perf-csi-sc.yaml```
```bash
controlplane:~$ kubectl apply -f perf-csi-sc.yaml
storageclass.storage.k8s.io/perf-csi-sc created
```

#### List The StorageClasses
```bash
controlplane:~$ kubectl get storageclass
NAME                 PROVISIONER                         RECLAIMPOLICY   VOLUMEBINDINGMODE      ALLOWVOLUMEEXPANSION   AGE
fast-csi (default)   csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   40m
local-path           rancher.io/local-path               Delete          WaitForFirstConsumer   false                  27d
low-latency          csi-driver.example-vendor.example   Retain          WaitForFirstConsumer   true                   106m
perf-csi-sc          csi-driver.example-vendor.example   Delete          Immediate              true                   7m56s
```

## Question 4
### Task
Run a command to identify which StorageClass is currently set to "default"

### Steps

#### List the StorageClass
```bash
controlplane:~$ nano perf-csi-sc.yaml
```

## Question 5
Create a new StorageClass named ```cluster-one```
- ```rancher.io/local-path```
- ```VOLUMEBINDINGMODE = WaitForFirstConsumer```

### Progress
- ✅ Watch Video
- ✅ Complete All SubQuestions
