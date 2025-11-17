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

To install Calico, the recommended method is to use the Tigera Operator, which simplifies installation and lifecycle management. Below are the general steps for installing Calico on a Kubernetes cluster using the operator. Please ensure your cluster meets the system requirements before proceeding.

### Install the Tigera Operator and Custom Resource Definitions
```bash
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml
controlplane:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml
customresourcedefinition.apiextensions.k8s.io/apiservers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/gatewayapis.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/goldmanes.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/imagesets.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/installations.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/managementclusterconnections.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/tigerastatuses.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/whiskers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/bgpfilters.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedglobalnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedkubernetesnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagednetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/tiers.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/adminnetworkpolicies.policy.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/baselineadminnetworkpolicies.policy.networking.k8s.io created
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "bgpconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "bgppeers.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "blockaffinities.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "caliconodestatuses.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "clusterinformations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "felixconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworkpolicies.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworksets.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "hostendpoints.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamblocks.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamconfigs.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamhandles.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ippools.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipreservations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "kubecontrollersconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "networkpolicies.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "networksets.crd.projectcalico.org" already exists
```

```
controlplane:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/tigera-operator.yaml
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created
```

### Download the Custom Resources Manifest
Choose the manifest based on your preferred data plane (eBPF or iptables):

For eBPF:
```bash
curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/custom-resources-bpf.yaml
```
For iptables:
```bash
controlplane:~$ curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/custom-resources.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1046  100  1046    0     0   2540      0 --:--:-- --:--:-- --:--:--  2538
```
```
controlplane:~$ cat custom-resources.yaml
```
```yaml
# This section includes base Calico installation configuration.
# For more information, see: https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.Installation
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  # Configures Calico networking.
  calicoNetwork:
    ipPools:
      - name: default-ipv4-ippool
        blockSize: 26
        cidr: 192.168.0.0/16
        encapsulation: VXLANCrossSubnet
        natOutgoing: Enabled
        nodeSelector: all()

---
# This section configures the Calico API server.
# For more information, see: https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.APIServer
apiVersion: operator.tigera.io/v1
kind: APIServer
metadata:
  name: default
spec: {}

---
# Configures the Calico Goldmane flow aggregator.
apiVersion: operator.tigera.io/v1
kind: Goldmane
metadata:
  name: default

---
# Configures the Calico Whisker observability UI.
apiVersion: operator.tigera.io/v1
kind: Whisker
metadata:
  name: default
```

You can customize the manifest if needed.

For KILLERCODA, change this
```yaml
  calicoNetwork:
    bgp: Disabled
    ipPools:
      - name: default-ipv4-ippool
        blockSize: 26
        cidr: 192.168.0.0/16
        encapsulation: VXLAN
        natOutgoing: Enabled
        nodeSelector: all()
```

### Apply the Custom Resources Manifest
For eBPF:
```
kubectl create -f custom-resources-bpf.yaml
```
For iptables:
```
controlplane:~$ kubectl create -f custom-resources.yaml
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created
```

### Get Pods
```bash
calico-system        calico-apiserver-57f76664f9-fh8lh         1/1     Running   0             6m31s
calico-system        calico-apiserver-57f76664f9-gs9k7         1/1     Running   0             6m31s
calico-system        calico-kube-controllers-c8959ddcf-xpdrt   1/1     Running   0             6m28s
calico-system        calico-node-49bkv                         0/1     Running   0             6m25s
calico-system        calico-node-6jql4                         0/1     Running   0             6m25s
calico-system        calico-typha-6c45f7d4cd-8xfbp             1/1     Running   0             6m26s
calico-system        csi-node-driver-rfqb7                     2/2     Running   0             6m28s
calico-system        csi-node-driver-sm2c8                     2/2     Running   0             6m28s
calico-system        goldmane-7b6b78f6f-jgwdm                  1/1     Running   0             6m30s
calico-system        whisker-7699f56bc7-qbtsx                  2/2     Running   0             5m2s
```


### Monitor the Deployment
```
watch kubectl get tigerastatus
```
Wait until all Calico components show True in the AVAILABLE column.



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

