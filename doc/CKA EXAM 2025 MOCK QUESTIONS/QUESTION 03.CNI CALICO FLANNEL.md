# CNI CALICO FLANNEL

## Progress
- 🔳 Watch Video -> ✅
- 🔳 Complete All SubQuestions

## References
- [CKA EXAM 2025 MOCK QUESTION 03 - CNI CALICO FLANNE](https://www.youtube.com/watch?v=V301KFSYuXk) | YouTube
- [Creating a cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/) | kubernetes.io
- [Installing Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/) | kubernetes.io
- [Flannel](https://github.com/flannel-io/flannel/blob/master/README.md) | GitHub
- [Install Calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart) | Tigera

## Task - Install Flannel

### Get The ```cluster-cidr```
```bash
controlplane:~$ cat /etc/kubernetes/manifests/kube-controller-manager.yaml | grep cidr
    - --allocate-node-cidrs=true
    - --cluster-cidr=192.168.0.0/16
```

### Retrieve The Flannel YAML File
```bash
controlplane:~$ wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
--2025-11-16 21:19:23--  https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
Resolving github.com (github.com)... 140.82.114.3
Connecting to github.com (github.com)|140.82.114.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://github.com/flannel-io/flannel/releases/download/v0.27.4/kube-flannel.yml [following]
--2025-11-16 21:19:24--  https://github.com/flannel-io/flannel/releases/download/v0.27.4/kube-flannel.yml
Reusing existing connection to github.com:443.
HTTP request sent, awaiting response... 302 Found
Location: https://release-assets.githubusercontent.com/github-production-release-asset/21704134/d04c82f6-0100-47bd-9290-ac53b06dcc91?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-11-16T21%3A56%3A23Z&rscd=attachment%3B+filename%3Dkube-flannel.yml&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-11-16T20%3A55%3A34Z&ske=2025-11-16T21%3A56%3A23Z&sks=b&skv=2018-11-09&sig=TTh%2F8v8jm4Ks6dBjARTVMBw1ksqJ0nQiRe5MUb992OA%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2MzMyODI2NCwibmJmIjoxNzYzMzI3OTY0LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.LW_xZVw4eO-M4ZSwjf4alksCjUcjHOXC1weYNYw09aU&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream [following]
--2025-11-16 21:19:24--  https://release-assets.githubusercontent.com/github-production-release-asset/21704134/d04c82f6-0100-47bd-9290-ac53b06dcc91?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-11-16T21%3A56%3A23Z&rscd=attachment%3B+filename%3Dkube-flannel.yml&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-11-16T20%3A55%3A34Z&ske=2025-11-16T21%3A56%3A23Z&sks=b&skv=2018-11-09&sig=TTh%2F8v8jm4Ks6dBjARTVMBw1ksqJ0nQiRe5MUb992OA%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2MzMyODI2NCwibmJmIjoxNzYzMzI3OTY0LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.LW_xZVw4eO-M4ZSwjf4alksCjUcjHOXC1weYNYw09aU&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream
Resolving release-assets.githubusercontent.com (release-assets.githubusercontent.com)... 185.199.109.133, 185.199.110.133, 185.199.108.133, ...
Connecting to release-assets.githubusercontent.com (release-assets.githubusercontent.com)|185.199.109.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4476 (4.4K) [application/octet-stream]
Saving to: 'kube-flannel.yml'

kube-flannel.yml                            100%[==========================================================================================>]   4.37K  --.-KB/s    in 0s      

2025-11-16 21:19:24 (19.9 MB/s) - 'kube-flannel.yml' saved [4476/4476]
```

### Cat The kube-flannel YAML File
```bash
controlplane:~$ cat kube-flannel.yml
```
```yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    k8s-app: flannel
    pod-security.kubernetes.io/enforce: privileged
  name: kube-flannel
---
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    k8s-app: flannel
  name: flannel
  namespace: kube-flannel
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  labels:
    k8s-app: flannel
  name: flannel
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - get
- apiGroups:
  - ""
  resources:
  - nodes
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - nodes/status
  verbs:
  - patch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    k8s-app: flannel
  name: flannel
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: flannel
subjects:
- kind: ServiceAccount
  name: flannel
  namespace: kube-flannel
---
apiVersion: v1
data:
  cni-conf.json: |
    {
      "name": "cbr0",
      "cniVersion": "0.3.1",
      "plugins": [
        {
          "type": "flannel",
          "delegate": {
            "hairpinMode": true,
            "isDefaultGateway": true
          }
        },
        {
          "type": "portmap",
          "capabilities": {
            "portMappings": true
          }
        }
      ]
    }
  net-conf.json: |
    {
      "Network": "10.244.0.0/16",
      "EnableNFTables": false,
      "Backend": {
        "Type": "vxlan"
      }
    }
kind: ConfigMap
metadata:
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-cfg
  namespace: kube-flannel
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-ds
  namespace: kube-flannel
spec:
  selector:
    matchLabels:
      app: flannel
      k8s-app: flannel
  template:
    metadata:
      labels:
        app: flannel
        k8s-app: flannel
        tier: node
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: kubernetes.io/os
                operator: In
                values:
                - linux
      containers:
      - args:
        - --ip-masq
        - --kube-subnet-mgr
        command:
        - /opt/bin/flanneld
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: EVENT_QUEUE_DEPTH
          value: "5000"
        - name: CONT_WHEN_CACHE_NOT_READY
          value: "false"
        image: ghcr.io/flannel-io/flannel:v0.27.4
        name: kube-flannel
        resources:
          requests:
            cpu: 100m
            memory: 50Mi
        securityContext:
          capabilities:
            add:
            - NET_ADMIN
            - NET_RAW
          privileged: false
        volumeMounts:
        - mountPath: /run/flannel
          name: run
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
        - mountPath: /run/xtables.lock
          name: xtables-lock
      hostNetwork: true
      initContainers:
      - args:
        - -f
        - /flannel
        - /opt/cni/bin/flannel
        command:
        - cp
        image: ghcr.io/flannel-io/flannel-cni-plugin:v1.8.0-flannel1
        name: install-cni-plugin
        volumeMounts:
        - mountPath: /opt/cni/bin
          name: cni-plugin
      - args:
        - -f
        - /etc/kube-flannel/cni-conf.json
        - /etc/cni/net.d/10-flannel.conflist
        command:
        - cp
        image: ghcr.io/flannel-io/flannel:v0.27.4
        name: install-cni
        volumeMounts:
        - mountPath: /etc/cni/net.d
          name: cni
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
      priorityClassName: system-node-critical
      serviceAccountName: flannel
      tolerations:
      - effect: NoSchedule
        operator: Exists
      volumes:
      - hostPath:
          path: /run/flannel
        name: run
      - hostPath:
          path: /opt/cni/bin
        name: cni-plugin
      - hostPath:
          path: /etc/cni/net.d
        name: cni
      - configMap:
          name: kube-flannel-cfg
        name: flannel-cfg
      - hostPath:
          path: /run/xtables.lock
          type: FileOrCreate
        name: xtables-lock
```

### Edit The kube-flannel YAML File
```bash
controlplane:~$ nano kube-flannel.yml
```
```yaml
"Network": "192.168.0.0/16",
```

### Apply The kube-flannel YAML File
```bash
controlplane:~$ k apply -f kube-flannel.yml
namespace/kube-flannel created
serviceaccount/flannel created
clusterrole.rbac.authorization.k8s.io/flannel configured
clusterrolebinding.rbac.authorization.k8s.io/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created
```

### Confirm The kube-flannel Pods Are Running
```bash
controlplane:~$ k -n kube-flannel get pods
NAME                    READY   STATUS    RESTARTS   AGE
kube-flannel-ds-r265t   1/1     Running   0          84s
kube-flannel-ds-z89ff   1/1     Running   0          84s
```

### Confirm The coredns Pods Are Running
```bash
controlplane:~$ k -n kube-system get pods | grep coredns
coredns-76bb9b6fb5-4z2mz                  1/1     Running   1 (50m ago)   28d
coredns-76bb9b6fb5-7vqcc                  1/1     Running   1 (50m ago)   28d
```

### Confirm The Flannel IP Route Is In Place
```bash
controlplane:~$ ip route | grep flannel
192.168.1.0/24 via 192.168.1.0 dev flannel.1 onlink 
```
## Task - Install Calico

====================================================================================================================
Step 2. Install Calico
In this step, you will install Calico in your cluster.

Install the Tigera Operator and custom resource definitions.

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.1/manifests/tigera-operator.yaml


Expected output
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created

Install Calico by creating the necessary custom resources.

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.1/manifests/custom-resources.yaml


Expected output
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created

Monitor the deployment by running the following command:

watch kubectl get tigerastatus

After a few minutes, all the Calico components display True in the AVAILABLE column.

Expected output
NAME                            AVAILABLE   PROGRESSING   DEGRADED   SINCE
apiserver                       True        False         False      4m9s
calico                          True        False         False      3m29s
goldmane                        True        False         False      3m39s
ippools                         True        False         False      6m4s
whisker    



====================================================================================================================
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


