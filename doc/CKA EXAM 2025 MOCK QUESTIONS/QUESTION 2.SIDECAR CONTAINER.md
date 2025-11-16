# SIDECAR CONTAINER

## Progress
- 🔳 Watch Video -> ✅
- 🔳 Complete All SubQuestions

## References
- [CKA EXAM 2025 MOCK QUESTION 02 - SIDE CAR CONTAINERS](https://youtu.be/b8iayk3l9nk?si=auZ_kcvhOvZD8nSV) | YouTube
- [kubectl logs](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_logs/) | Kubernetes.io
- [Sidecar Containers](https://kubernetes.io/docs/concepts/workloads/pods/sidecar-containers/) | Kubernetes.io
- [Volumes](https://kubernetes.io/docs/concepts/storage/volumes/) | Kubernetes.io


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

## Prerequisites

### Print The Supported API resources
```bash
controlplane:/opt$ kubectl api-resources
NAME                                SHORTNAMES   APIVERSION                        NAMESPACED   KIND
bindings                                         v1                                true         Binding
componentstatuses                   cs           v1                                false        ComponentStatus
configmaps                          cm           v1                                true         ConfigMap
endpoints                           ep           v1                                true         Endpoints
events                              ev           v1                                true         Event
limitranges                         limits       v1                                true         LimitRange
namespaces                          ns           v1                                false        Namespace
nodes                               no           v1                                false        Node
persistentvolumeclaims              pvc          v1                                true         PersistentVolumeClaim
persistentvolumes                   pv           v1                                false        PersistentVolume
pods                                po           v1                                true         Pod
podtemplates                                     v1                                true         PodTemplate
replicationcontrollers              rc           v1                                true         ReplicationController
resourcequotas                      quota        v1                                true         ResourceQuota
secrets                                          v1                                true         Secret
serviceaccounts                     sa           v1                                true         ServiceAccount
services                            svc          v1                                true         Service
mutatingwebhookconfigurations                    admissionregistration.k8s.io/v1   false        MutatingWebhookConfiguration
validatingadmissionpolicies                      admissionregistration.k8s.io/v1   false        ValidatingAdmissionPolicy
validatingadmissionpolicybindings                admissionregistration.k8s.io/v1   false        ValidatingAdmissionPolicyBinding
validatingwebhookconfigurations                  admissionregistration.k8s.io/v1   false        ValidatingWebhookConfiguration
customresourcedefinitions           crd,crds     apiextensions.k8s.io/v1           false        CustomResourceDefinition
apiservices                                      apiregistration.k8s.io/v1         false        APIService
controllerrevisions                              apps/v1                           true         ControllerRevision
daemonsets                          ds           apps/v1                           true         DaemonSet
deployments                         deploy       apps/v1                           true         Deployment
replicasets                         rs           apps/v1                           true         ReplicaSet
statefulsets                        sts          apps/v1                           true         StatefulSet
selfsubjectreviews                               authentication.k8s.io/v1          false        SelfSubjectReview
tokenreviews                                     authentication.k8s.io/v1          false        TokenReview
localsubjectaccessreviews                        authorization.k8s.io/v1           true         LocalSubjectAccessReview
selfsubjectaccessreviews                         authorization.k8s.io/v1           false        SelfSubjectAccessReview
selfsubjectrulesreviews                          authorization.k8s.io/v1           false        SelfSubjectRulesReview
subjectaccessreviews                             authorization.k8s.io/v1           false        SubjectAccessReview
horizontalpodautoscalers            hpa          autoscaling/v2                    true         HorizontalPodAutoscaler
cronjobs                            cj           batch/v1                          true         CronJob
jobs                                             batch/v1                          true         Job
certificatesigningrequests          csr          certificates.k8s.io/v1            false        CertificateSigningRequest
leases                                           coordination.k8s.io/v1            true         Lease
bgpconfigurations                                crd.projectcalico.org/v1          false        BGPConfiguration
bgppeers                                         crd.projectcalico.org/v1          false        BGPPeer
blockaffinities                                  crd.projectcalico.org/v1          false        BlockAffinity
caliconodestatuses                               crd.projectcalico.org/v1          false        CalicoNodeStatus
clusterinformations                              crd.projectcalico.org/v1          false        ClusterInformation
felixconfigurations                              crd.projectcalico.org/v1          false        FelixConfiguration
globalnetworkpolicies                            crd.projectcalico.org/v1          false        GlobalNetworkPolicy
globalnetworksets                                crd.projectcalico.org/v1          false        GlobalNetworkSet
hostendpoints                                    crd.projectcalico.org/v1          false        HostEndpoint
ipamblocks                                       crd.projectcalico.org/v1          false        IPAMBlock
ipamconfigs                                      crd.projectcalico.org/v1          false        IPAMConfig
ipamhandles                                      crd.projectcalico.org/v1          false        IPAMHandle
ippools                                          crd.projectcalico.org/v1          false        IPPool
ipreservations                                   crd.projectcalico.org/v1          false        IPReservation
kubecontrollersconfigurations                    crd.projectcalico.org/v1          false        KubeControllersConfiguration
networkpolicies                                  crd.projectcalico.org/v1          true         NetworkPolicy
networksets                                      crd.projectcalico.org/v1          true         NetworkSet
endpointslices                                   discovery.k8s.io/v1               true         EndpointSlice
events                              ev           events.k8s.io/v1                  true         Event
flowschemas                                      flowcontrol.apiserver.k8s.io/v1   false        FlowSchema
prioritylevelconfigurations                      flowcontrol.apiserver.k8s.io/v1   false        PriorityLevelConfiguration
ingressclasses                                   networking.k8s.io/v1              false        IngressClass
ingresses                           ing          networking.k8s.io/v1              true         Ingress
ipaddresses                         ip           networking.k8s.io/v1              false        IPAddress
networkpolicies                     netpol       networking.k8s.io/v1              true         NetworkPolicy
servicecidrs                                     networking.k8s.io/v1              false        ServiceCIDR
runtimeclasses                                   node.k8s.io/v1                    false        RuntimeClass
poddisruptionbudgets                pdb          policy/v1                         true         PodDisruptionBudget
clusterrolebindings                              rbac.authorization.k8s.io/v1      false        ClusterRoleBinding
clusterroles                                     rbac.authorization.k8s.io/v1      false        ClusterRole
rolebindings                                     rbac.authorization.k8s.io/v1      true         RoleBinding
roles                                            rbac.authorization.k8s.io/v1      true         Role
deviceclasses                                    resource.k8s.io/v1                false        DeviceClass
resourceclaims                                   resource.k8s.io/v1                true         ResourceClaim
resourceclaimtemplates                           resource.k8s.io/v1                true         ResourceClaimTemplate
resourceslices                                   resource.k8s.io/v1                false        ResourceSlice
priorityclasses                     pc           scheduling.k8s.io/v1              false        PriorityClass
csidrivers                                       storage.k8s.io/v1                 false        CSIDriver
csinodes                                         storage.k8s.io/v1                 false        CSINode
csistoragecapacities                             storage.k8s.io/v1                 true         CSIStorageCapacity
storageclasses                      sc           storage.k8s.io/v1                 false        StorageClass
volumeattachments                                storage.k8s.io/v1                 false        VolumeAttachment
volumeattributesclasses             vac          storage.k8s.io/v1                 false        VolumeAttributesClass
```

```volume``` is not a Kubernetes API Resource. Explaining ```Volume``` to enumerate allowed values fails

```bash
controlplane:/opt$ k explain volume
the server doesn't have a resource type "volume"
```

## Steps

### Note Directory ```/opt```
The directory ```/opt``` will be in the Pod, not in the Node

### Edit The Deployment YAML File
```bash
controlplane:~$ nano deployment-myapp.yaml
```

### Cat The Deployment YAML File
```bash
controlplane:~$ cat deployment-myapp.yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  labels:
    app: myapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp
          image: alpine:latest
          command: ['sh', '-c', 'while true; do echo "logging" >> /opt/logs.txt; sleep 1; done']
          volumeMounts:
            - name: data
              mountPath: /opt
          env:
          - name: ENVIRONMENT
            value: PRODUCTION
          - name: LOG_LEVEL
            value: INFO
          - name: APP_VERSION
            value: v1.0.3
          - name: ENABLE_METRICS
            value: "true"
      volumes:
        - name: data
          emptyDir: {}
```

### Apply The Deployment YAML File
```bash
controlplane:~$ kubectl apply -f deployment-myapp.yaml
deployment.apps/myapp created
```

### Describe The Deployment ```myapp```
```bash
controlplane:~$ k -n default describe deployments myapp
```
```yaml
Name:                   myapp
Namespace:              default
CreationTimestamp:      Sun, 16 Nov 2025 18:56:34 +0000
Labels:                 app=myapp
Annotations:            deployment.kubernetes.io/revision: 1
Selector:               app=myapp
Replicas:               1 desired | 1 updated | 1 total | 1 available | 0 unavailable
StrategyType:           RollingUpdate
MinReadySeconds:        0
RollingUpdateStrategy:  25% max unavailable, 25% max surge
Pod Template:
  Labels:  app=myapp
  Containers:
   myapp:
    Image:      alpine:latest
    Port:       <none>
    Host Port:  <none>
    Command:
      sh
      -c
      while true; do echo "logging" >> /opt/logs.txt; sleep 1; done
    Environment:
      ENVIRONMENT:     PRODUCTION
      LOG_LEVEL:       INFO
      APP_VERSION:     v1.0.3
      ENABLE_METRICS:  true
    Mounts:
      /opt from data (rw)
  Volumes:
   data:
    Type:          EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:        
    SizeLimit:     <unset>
  Node-Selectors:  <none>
  Tolerations:     <none>
Conditions:
  Type           Status  Reason
  ----           ------  ------
  Available      True    MinimumReplicasAvailable
  Progressing    True    NewReplicaSetAvailable
OldReplicaSets:  <none>
NewReplicaSet:   myapp-5fc7bcccf4 (1/1 replicas created)
Events:
  Type    Reason             Age   From                   Message
  ----    ------             ----  ----                   -------
  Normal  ScalingReplicaSet  17m   deployment-controller  Scaled up replica set myapp-5fc7bcccf4 from 0 to 1
```

### Get The Pod
- Confirm the pod exists
- Confirm the pod has one container
```bash
controlplane:~$ k -n default get pods
NAME                     READY   STATUS    RESTARTS   AGE
myapp-5fc7bcccf4-k5t4z   1/1     Running   0          59s
```

### Describe The Pod  ```myapp-5fc7bcccf4-k5t4z```
```bash
controlplane:~$ k -n default describe pods myapp-5fc7bcccf4-k5t4z
```
```yaml
Name:             myapp-5fc7bcccf4-k5t4z
Namespace:        default
Priority:         0
Service Account:  default
Node:             node01/172.30.2.2
Start Time:       Sun, 16 Nov 2025 18:56:34 +0000
Labels:           app=myapp
                  pod-template-hash=5fc7bcccf4
Annotations:      cni.projectcalico.org/containerID: 243fa39c51c77ccb19b15fc37ac63eddb087f357bdf31305910e218c46e5c415
                  cni.projectcalico.org/podIP: 192.168.1.4/32
                  cni.projectcalico.org/podIPs: 192.168.1.4/32
Status:           Running
IP:               192.168.1.4
IPs:
  IP:           192.168.1.4
Controlled By:  ReplicaSet/myapp-5fc7bcccf4
Containers:
  myapp:
    Container ID:  containerd://a3481167ebea4270cf88611a928a519f7468b489e1b1a3da6dc1bf2797dc8fb9
    Image:         alpine:latest
    Image ID:      docker.io/library/alpine@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
    Port:          <none>
    Host Port:     <none>
    Command:
      sh
      -c
      while true; do echo "logging" >> /opt/logs.txt; sleep 1; done
    State:          Running
      Started:      Sun, 16 Nov 2025 18:56:40 +0000
    Ready:          True
    Restart Count:  0
    Environment:
      ENVIRONMENT:     PRODUCTION
      LOG_LEVEL:       INFO
      APP_VERSION:     v1.0.3
      ENABLE_METRICS:  true
    Mounts:
      /opt from data (rw)
      /var/run/secrets/kubernetes.io/serviceaccount from kube-api-access-mwm6k (ro)
Conditions:
  Type                        Status
  PodReadyToStartContainers   True 
  Initialized                 True 
  Ready                       True 
  ContainersReady             True 
  PodScheduled                True 
Volumes:
  data:
    Type:       EmptyDir (a temporary directory that shares a pod's lifetime)
    Medium:     
    SizeLimit:  <unset>
  kube-api-access-mwm6k:
    Type:                    Projected (a volume that contains injected data from multiple sources)
    TokenExpirationSeconds:  3607
    ConfigMapName:           kube-root-ca.crt
    Optional:                false
    DownwardAPI:             true
QoS Class:                   BestEffort
Node-Selectors:              <none>
Tolerations:                 node.kubernetes.io/not-ready:NoExecute op=Exists for 300s
                             node.kubernetes.io/unreachable:NoExecute op=Exists for 300s
Events:
  Type    Reason     Age    From               Message
  ----    ------     ----   ----               -------
  Normal  Scheduled  6m3s   default-scheduler  Successfully assigned default/myapp-5fc7bcccf4-k5t4z to node01
  Normal  Pulling    6m3s   kubelet            Pulling image "alpine:latest"
  Normal  Pulled     5m57s  kubelet            Successfully pulled image "alpine:latest" in 5.529s (5.529s including waiting). Image size: 3813273 bytes.
  Normal  Created    5m57s  kubelet            Created container: myapp
  Normal  Started    5m57s  kubelet            Started container myapp
```

### Backup The Pod To YAML
```bash
controlplane:~$ k -n default get pods myapp-5fc7bcccf4-k5t4z -o yaml > pod-myapp-5fc7bcccf4-k5t4z.yaml
```
```yaml
apiVersion: v1
kind: Pod
metadata:
  annotations:
    cni.projectcalico.org/containerID: 243fa39c51c77ccb19b15fc37ac63eddb087f357bdf31305910e218c46e5c415
    cni.projectcalico.org/podIP: 192.168.1.4/32
    cni.projectcalico.org/podIPs: 192.168.1.4/32
  creationTimestamp: "2025-11-16T18:56:34Z"
  generateName: myapp-5fc7bcccf4-
  generation: 1
  labels:
    app: myapp
    pod-template-hash: 5fc7bcccf4
  name: myapp-5fc7bcccf4-k5t4z
  namespace: default
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: ReplicaSet
    name: myapp-5fc7bcccf4
    uid: b2778fef-7a65-4402-92d5-229e6714555c
  resourceVersion: "8701"
  uid: 12c84cb7-b11b-43b0-9a4f-afb54cdf9c41
spec:
  containers:
  - command:
    - sh
    - -c
    - while true; do echo "logging" >> /opt/logs.txt; sleep 1; done
    env:
    - name: ENVIRONMENT
      value: PRODUCTION
    - name: LOG_LEVEL
      value: INFO
    - name: APP_VERSION
      value: v1.0.3
    - name: ENABLE_METRICS
      value: "true"
    image: alpine:latest
    imagePullPolicy: Always
    name: myapp
    resources: {}
    terminationMessagePath: /dev/termination-log
    terminationMessagePolicy: File
    volumeMounts:
    - mountPath: /opt
      name: data
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-mwm6k
      readOnly: true
  dnsPolicy: ClusterFirst
  enableServiceLinks: true
  nodeName: node01
  preemptionPolicy: PreemptLowerPriority
  priority: 0
  restartPolicy: Always
  schedulerName: default-scheduler
  securityContext: {}
  serviceAccount: default
  serviceAccountName: default
  terminationGracePeriodSeconds: 30
  tolerations:
  - effect: NoExecute
    key: node.kubernetes.io/not-ready
    operator: Exists
    tolerationSeconds: 300
  - effect: NoExecute
    key: node.kubernetes.io/unreachable
    operator: Exists
    tolerationSeconds: 300
  volumes:
  - emptyDir: {}
    name: data
  - name: kube-api-access-mwm6k
    projected:
      defaultMode: 420
      sources:
      - serviceAccountToken:
          expirationSeconds: 3607
          path: token
      - configMap:
          items:
          - key: ca.crt
            path: ca.crt
          name: kube-root-ca.crt
      - downwardAPI:
          items:
          - fieldRef:
              apiVersion: v1
              fieldPath: metadata.namespace
            path: namespace
status:
  conditions:
  - lastProbeTime: null
    lastTransitionTime: "2025-11-16T18:56:41Z"
    observedGeneration: 1
    status: "True"
    type: PodReadyToStartContainers
  - lastProbeTime: null
    lastTransitionTime: "2025-11-16T18:56:34Z"
    observedGeneration: 1
    status: "True"
    type: Initialized
  - lastProbeTime: null
    lastTransitionTime: "2025-11-16T18:56:41Z"
    observedGeneration: 1
    status: "True"
    type: Ready
  - lastProbeTime: null
    lastTransitionTime: "2025-11-16T18:56:41Z"
    observedGeneration: 1
    status: "True"
    type: ContainersReady
  - lastProbeTime: null
    lastTransitionTime: "2025-11-16T18:56:34Z"
    observedGeneration: 1
    status: "True"
    type: PodScheduled
  containerStatuses:
  - containerID: containerd://a3481167ebea4270cf88611a928a519f7468b489e1b1a3da6dc1bf2797dc8fb9
    image: docker.io/library/alpine:latest
    imageID: docker.io/library/alpine@sha256:4b7ce07002c69e8f3d704a9c5d6fd3053be500b7f1c69fc0d80990c2ad8dd412
    lastState: {}
    name: myapp
    ready: true
    resources: {}
    restartCount: 0
    started: true
    state:
      running:
        startedAt: "2025-11-16T18:56:40Z"
    volumeMounts:
    - mountPath: /opt
      name: data
    - mountPath: /var/run/secrets/kubernetes.io/serviceaccount
      name: kube-api-access-mwm6k
      readOnly: true
      recursiveReadOnly: Disabled
  hostIP: 172.30.2.2
  hostIPs:
  - ip: 172.30.2.2
  observedGeneration: 1
  phase: Running
  podIP: 192.168.1.4
  podIPs:
  - ip: 192.168.1.4
  qosClass: BestEffort
  startTime: "2025-11-16T18:56:34Z"
```

### Confirm Pod Can Run Command ```date```
```bash
controlplane:~$ kubectl -n default exec myapp-5fc7bcccf4-k5t4z -- date
Sun Nov 16 19:00:01 UTC 2025
```

### Confirm Log File Appears In Pod Directory ```/opt```
```bash
controlplane:~$ kubectl -n default exec myapp-5fc7bcccf4-k5t4z -- ls -l /opt
total 4
-rw-r--r--    1 root     root          2024 Nov 16 19:00 logs.txt
```

### Edit The Deployment YAML File
```bash
controlplane:~$ nano deployment-myapp.yaml
```

### Cat The Deployment YAML File
```bash
controlplane:~$ cat deployment-myapp.yaml
```
```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: myapp
  labels:
    app: myapp
spec:
  replicas: 1
  selector:
    matchLabels:
      app: myapp
  template:
    metadata:
      labels:
        app: myapp
    spec:
      containers:
        - name: myapp
          image: alpine:latest
          command: ['sh', '-c', 'while true; do echo "logging" >> /opt/logs.txt; sleep 1; done']
          volumeMounts:
            - name: data
              mountPath: /opt
          env:
          - name: ENVIRONMENT
            value: PRODUCTION
          - name: LOG_LEVEL
            value: INFO
          - name: APP_VERSION
            value: v1.0.3
          - name: ENABLE_METRICS
            value: "true"
      initContainers:
        - name: logshipper
          image: alpine:latest
          restartPolicy: Always
          command: ['sh', '-c', 'tail -F /opt/logs.txt']
          volumeMounts:
            - name: data
              mountPath: /opt
      volumes:
        - name: data
          emptyDir: {}
```

### Patch The Deployment
```bash
controlplane:~$ 
```

### Get The Pod
- Confirm the pod exists
- Confirm the old pod ```myapp-5fc7bcccf4-k5t4z``` terminates
  - Pods are immutable; must be destroyed and recreated
- Confirm the new pod has a new name ```myapp-5fc7bcccf4-xxxxx```
- Confirm the new pod has two containers
```bash
controlplane:~$ k -n default get pods
NAME                     READY   STATUS    RESTARTS   AGE
myapp-5fc7bcccf4-k5t4z   1/1     Running   0          59s
```

### Describe The Pod  ```myapp-5fc7bcccf4-xxxxx```
- Confirm the pod has two containers
- Confirm the original container has the same Container ID
```bash
controlplane:~$ k -n default describe pods myapp-5fc7bcccf4-xxxxx
```
```yaml
...
```

### Observe The ```tail``` Output In The Logs
```
controlplane:~$ k -n default kubectl logs myapp-5fc7bcccf4-xxxx --all-containers=true
logging
logging
logging
...
```


