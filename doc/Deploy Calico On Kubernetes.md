# Deploy Calico On Kubernetes

## Create Calico Custom Resource Definitions (CRD)
```bash
$ kubectl create -f "https://raw.githubusercontent.com/projectcalico/calico/v3.30.2/manifests/operator-crds.yaml"
customresourcedefinition.apiextensions.k8s.io/apiservers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/gatewayapis.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/goldmanes.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/imagesets.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/installations.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/managementclusterconnections.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/tigerastatuses.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/whiskers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/bgpconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/bgpfilters.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/bgppeers.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/blockaffinities.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/caliconodestatuses.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/clusterinformations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/felixconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/globalnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/globalnetworksets.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/hostendpoints.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamblocks.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamconfigs.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipamhandles.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ippools.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/ipreservations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/kubecontrollersconfigurations.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/networkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/networksets.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedglobalnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedkubernetesnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagednetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/tiers.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/adminnetworkpolicies.policy.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/baselineadminnetworkpolicies.policy.networking.k8s.io created
```

## Create Tigera Custom Resources
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/calico/tigera-calico-custom-resources.yaml"
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created
```

## Create Calico General Resources
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/calico/calico_general.yaml"
poddisruptionbudget.policy/calico-kube-controllers created
serviceaccount/calico-kube-controllers created
serviceaccount/calico-node created
configmap/calico-config created
clusterrole.rbac.authorization.k8s.io/calico-kube-controllers created
clusterrole.rbac.authorization.k8s.io/calico-node created
clusterrolebinding.rbac.authorization.k8s.io/calico-kube-controllers created
clusterrolebinding.rbac.authorization.k8s.io/calico-node created
daemonset.apps/calico-node created
deployment.apps/calico-kube-controllers created
```
> [!NOTE]
> The file from which "calico_general.yaml" is taken is linked in the reference Reddit post
> The file "calico_general.yaml" is modified
> - The file sets "--pod-network-cidr=10.244.0.0/16"
> - This is the same pod-network-cidr used by the Flannel application
> - The custom resource definitions are removed as the CRDs are defined in a previous YAML file
>
> References
> - [How do you find the cluster & service CIDR of a Kubernetes cluster?](https://stackoverflow.com/questions/44190607/how-do-you-find-the-cluster-service-cidr-of-a-kubernetes-cluster) | StackOverflow
> - [I set my master with "kubeadm init --pod-network-cidr=10.244.0.0/16", flannel is also set with that...](https://www.reddit.com/r/kubernetes/comments/vim21o/i_set_my_master_with_kubeadm_init/) | Reddit

## Create The Tigera Operators
```bash
$ kubectl create -f "https://raw.githubusercontent.com/projectcalico/calico/v3.30.2/manifests/tigera-operator.yaml"
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created
```

## Enable The Flow Logs API [^enable_flow_logs_api]
```bash
$ kubectl apply -f - <<EOF
apiVersion: operator.tigera.io/v1
kind: Goldmane
metadata:
  name: default
EOF
Warning: resource goldmanes/default is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
goldmane.operator.tigera.io/default configured
```

[^enable_flow_logs_api]: [Enable the flow logs API](https://docs.tigera.io/calico/latest/observability/enable-whisker#enable-the-flow-logs-api)

## Enable The Calico Whisker Web Console [^enable_calico_whisker_web_console]
```bash
$ kubectl apply -f - <<EOF
apiVersion: operator.tigera.io/v1
kind: Whisker
metadata:
  name: default
EOF
Warning: resource whiskers/default is missing the kubectl.kubernetes.io/last-applied-configuration annotation which is required by kubectl apply. kubectl apply should only be used on resources created declaratively by either kubectl create --save-config or kubectl apply. The missing annotation will be patched automatically.
whisker.operator.tigera.io/default configured
```

[^enable_calico_whisker_web_console]: [Enable the Calico Whisker web console](https://docs.tigera.io/calico/latest/observability/enable-whisker#enable-the-calico-whisker-web-console)


## Confirm The Calico Configuration

After installing Calico, confirm the following.

### Confirm The Nodes
The node "master-node" has "STATUS" of "Ready"
```bash
$ kubectl get nodes
NAME          STATUS   ROLES           AGE   VERSION
master-node   Ready    control-plane   28m   v1.28.15
```

### Confirm The Pods
Calico pods "calico-kube-controllers-..." and "calico-node-..." are present

All the pods including the coredns pods have "STATUS" of "Running"
- Investigate the pods with 'kubectl'
```bash
$ kubectl get pods --all-namespaces -o wide
NAMESPACE     NAME                                       READY   STATUS    RESTARTS   AGE   IP              NODE          NOMINATED NODE   READINESS GATES
default       busybox-pod                                1/1     Running   0          11m   10.244.77.132   master-node   <none>           <none>
kube-system   calico-kube-controllers-658d97c59c-zxslg   1/1     Running   0          44s   10.244.77.131   master-node   <none>           <none>
kube-system   calico-node-5qwqx                          1/1     Running   0          44s   192.168.0.136   master-node   <none>           <none>
kube-system   coredns-5dd5756b68-6n6lb                   1/1     Running   0          15m   10.244.77.130   master-node   <none>           <none>
kube-system   coredns-5dd5756b68-h4tcm                   1/1     Running   0          15m   10.244.77.129   master-node   <none>           <none>
kube-system   etcd-master-node                           1/1     Running   4          16m   192.168.0.136   master-node   <none>           <none>
kube-system   kube-apiserver-master-node                 1/1     Running   1          16m   192.168.0.136   master-node   <none>           <none>
kube-system   kube-controller-manager-master-node        1/1     Running   1          16m   192.168.0.136   master-node   <none>           <none>
kube-system   kube-proxy-fdtms                           1/1     Running   0          15m   192.168.0.136   master-node   <none>           <none>
kube-system   kube-scheduler-master-node                 1/1     Running   19         16m   192.168.0.136   master-node   <none>           <none>
```

- Investigate the pods with 'crictl'
```bash
$ sudo crictl pods
WARN[0000] runtime connect using default endpoints: [unix:///var/run/dockershim.sock unix:///run/containerd/containerd.sock unix:///run/crio/crio.sock unix:///var/run/cri-dockerd.sock]. As the default settings are now deprecated, you should set the endpoint instead.
ERRO[0000] validate service connection: validate CRI v1 runtime API for endpoint "unix:///var/run/dockershim.sock": rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing: dial unix /var/run/dockershim.sock: connect: no such file or directory"
POD ID              CREATED              STATE               NAME                                       NAMESPACE           ATTEMPT             RUNTIME
95839a0f1160b       About a minute ago   Ready               busybox-pod                                default             598                 (default)
bd57ba0e0986c       About a minute ago   Ready               coredns-5dd5756b68-6n6lb                   kube-system         873                 (default)
9e11c69eca71c       About a minute ago   Ready               calico-kube-controllers-658d97c59c-zxslg   kube-system         7                   (default)
8eb7c4d489502       About a minute ago   Ready               coredns-5dd5756b68-h4tcm                   kube-system         873                 (default)
88ad81031b39b       About a minute ago   Ready               calico-node-5qwqx                          kube-system         0                   (default)
36bef92d2ae2c       16 minutes ago       Ready               kube-proxy-fdtms                           kube-system         0                   (default)
42afa93ae326f       17 minutes ago       Ready               kube-apiserver-master-node                 kube-system         0                   (default)
82d3b02d7b3f0       17 minutes ago       Ready               kube-controller-manager-master-node        kube-system         0                   (default)
da5fa0dbdd4a1       17 minutes ago       Ready               kube-scheduler-master-node                 kube-system         0                   (default)
6994bbf454583       17 minutes ago       Ready               etcd-master-node                           kube-system         0                   (default)
```

### Confirm The CNI Configuration Files
These files are in directory ```/etc/cni/net.d```
```bash
$ sudo ls -la /etc/cni/net.d
total 20
drwx------ 2 root root 4096 Jul 31 22:27 .
drwxr-xr-x 3 root root 4096 Jul 27 15:42 ..
-rw-r--r-- 1 root root  662 Aug 11 19:13 10-calico.conflist
-rw------- 1 root root 2720 Aug 11 19:13 calico-kubeconfig
-rw-r--r-- 1 root root    0 Aug  4  2023 .kubernetes-cni-keep
```

Confirm the file "10-calico.conflist"
```bash
$ sudo cat /etc/cni/net.d/10-calico.conflist
{
  "name": "k8s-pod-network",
  "cniVersion": "0.3.1",
  "plugins": [
    {
      "type": "calico",
      "log_level": "info",
      "log_file_path": "/var/log/calico/cni/cni.log",
      "datastore_type": "kubernetes",
      "nodename": "master-node",
      "mtu": 0,
      "ipam": {
          "type": "calico-ipam"
      },
      "policy": {
          "type": "k8s"
      },
      "kubernetes": {
          "kubeconfig": "/etc/cni/net.d/calico-kubeconfig"
      }
    },
    {
      "type": "portmap",
      "snat": true,
      "capabilities": {"portMappings": true}
    },
    {
      "type": "bandwidth",
      "capabilities": {"bandwidth": true}
    }
  ]
}
```

Confirm the file "calico-kubeconfig"
```
$ sudo cat /etc/cni/net.d/calico-kubeconfig
# Kubeconfig file for Calico CNI plugin. Installed by calico/node.
apiVersion: v1
kind: Config
clusters:
- name: local
  cluster:
    server: https://10.96.0.1:443
    certificate-authority-data: "LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJSVJ2Y1VPMWIyVjR3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBNE1ERXlNak0wTURaYUZ3MHpOVEEzTXpBeU1qTTVNRFphTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURPZC9ZZndzWDBHMW9tWDBCWTBJSlJIYnQrdU1zWi8yWkljL2pTT1cyRW5LdWpRellCNXhKbzc3M20KM3hJTndCWGRpTzdIeHJrc21KSGo5RExoWnd4WS9GTWlndlZReFErMzRJUXBNRXZaMzgxY1NmaFpZcTI4V3Y2LwpHbEJ0VHNvREdlZ0xZbDExQ1ZnRTN0Yi91QjFGZFBHa1NvNlcvVEtTNWIxZ2RpVDJlUTVLUGUxUW9Bem9FUlJ1CmlLZWJCYTRHOWQ4Ky84MmNHZWpYSFBKWW04RDVSWEtiajUwc3NOUDQ5K2gvdlpnK2pBOStwUXh5N3Vtb1lRTVgKYnVOZmd6TDBpT3J0WGUzYzc5bnBpM3FSaEZyTDdtWHB5ZDUwNDlzaFl0LzdMM0FoTTZDZ0srTUduc3dsREJQZwpOU1JPM1RBN0hPcGJQQ3lwaTlNcDd3cjZaM3gxQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJUZElId2luTG1RZ2g0WEtJWXZ6NGlpSSs4eml6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQ0hXanMyRUt6TApmUlNBLzk1cU1uY01OR2o1TTIwcG9GUDZFMlhKRURnNTJRN0F3ZXFGVlFVdStZU1djMG5kbDVxZjZqSWxBM3JlCmppa3BpN1pkYmluUHg2aW94WjltbjRNVThxS2FDTC9iS2VPTVV5aTZpMGJncUtORHVNVnZnb1cxamlacTBZQ3MKNnhncDU0VThNZ0EvV3JkVUhXVDRxTitJaE9za1lHY0JtVGxjMFU0OTlKZzB5dXl4NWRIUzRaWHJZZG9OTjNiKwp0amNJNVpkd1Z4cDFvSGFuNXBYRHdOVVVpelIyMmNXYVZGWVdnRndRVEtSWHJrSnM3SFVuMkp5Y2FWTkxsYXJHCno4NHhzcXR2YlNJQmlIcFB6N0JSTlVXdVE2eWxZcjc0a2V1eHFkbTNaVGR4bnhyNEJwbWdiWDB1VFdDek0yTWsKV3dDeElWZ3FTSjVwCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K"
users:
- name: calico
  user:
    token: eyJhbGciOiJSUzI1NiIsImtpZCI6ImdGSDZWdmFvbjd1SUVGUUxSeFZzV09TYjlmZFc1NV9tZlltTXZqYWIzbnMifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNzU1MDQ0MDI2LCJpYXQiOjE3NTQ5NTc2MjYsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJrdWJlLXN5c3RlbSIsInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJjYWxpY28tbm9kZSIsInVpZCI6IjUzMjk4OWUzLWQxM2MtNDU0OC05ZjU0LTdjOTU4MmNkNmU2ZSJ9fSwibmJmIjoxNzU0OTU3NjI2LCJzdWIiOiJzeXN0ZW06c2VydmljZWFjY291bnQ6a3ViZS1zeXN0ZW06Y2FsaWNvLW5vZGUifQ.I-d-lj_kC779eFYJU-z5TzGWkmzNs13vLhSirMsAY_XbicsLboee5rhJwsPOQPKNmmb-UhZ6wy6e-kyifH-XZ4LCpjZ0SQtCvztOXmbxjEkdx7HjvPRrJE7tcEHzPid0XrYXvzHYMnpqLzWcPEATZBCe4f5jBIMw9J3FQnNhMUdK6125P-vXjWBtSo2V1NJkomGDbrYmSMrYSFCrjAcsiYP8Ru-aJu3vs5vD45CLuLXY1r0eU0yPuEkiEymJ6UtTvPAJkJD6UpZ9Xo3dutEFePdQJPJLdEUhROqhDLkJRBVwW0gn8YdH0VkLyONP7irwZMmNu5WHYPqFEW7R1oDSCw
contexts:
- name: calico-context
  context:
    cluster: local
    user: calico
```

Reload the configuration and restart kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```

Watch the command ```kubectl get tigerastatus``` and observe the Calico services start
```
Every 2.0s: kubectl get tigerastatus                                    master-node: Tue Aug 12 15:46:25 2025

NAME        AVAILABLE   PROGRESSING   DEGRADED   SINCE
apiserver   True        False         False      2m48s
calico      True        False         False      33s
goldmane    True        False         False      2m38s
ippools     True        False         False      2m53s
whisker     True        False         False      118s
```

## Access Calico Whisker

### Install The NGINX Gateway
If not already done, [Install The NGINX Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md#install-the-nginx-gateway)


### Install the Network Policy
The Network Policy enables communication with the Whisker node
[whisker-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/calico/whisker-networkpolicy.yaml)

```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/calico/whisker-networkpolicy.yaml"
networkpolicy.networking.k8s.io/whisker-ingress created
```

Create an Ingress resource YAML file that references all the installed applications
- Use a distinct "host" designation for Calico Whisker
```
  - host: whisker.master-node
```

- Here is a reference file
  - [calico-system-ingress-nginx.yaml](https://github.com/tomrausch/kubernetes_public/blob/16162bfa93cd49fafbaba71c7f1106659d20d7a9/src/calico/calico-system-ingress-nginx.yaml)

Create the Ingress resource in the Kubernetes cluster. Create the Ingress resource in the namespace "calico-system".
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ingress/ingress-nginx-calico-system.yaml
ingress.networking.k8s.io/ ingress-calico-system created
```

Confirm the Ingress resource in the Kubernetes cluster
```bash
$ kubectl get ingress --namespace calico-system
NAME                    CLASS   HOSTS                 ADDRESS         PORTS   AGE
ingress-calico-system   nginx   whisker.master-node   192.168.0.241   80      57m
```

Add a reference to the Whisker application in the file "hosts". The format is ```<ip_address_of_the_kubernetes_cluster>``` a space, and then the ```whisker.master-code```
```bash
# Kubernetes load balancer namespace "default":
192.168.0.136 whisker.master-node
```

Access the applications through the NGINX gateway. The format of the URL is  ```http://whisker.master-node:<port_for_http_access_in_nginx_gateway>```

Here is the application "Whisker" accessed through the NGINX application gateway

<img width="2423" height="1356" alt="image" src="https://github.com/user-attachments/assets/e570a97c-4e92-466e-8fbf-5917b1a6dec1" />

### DO NOT Install The Calico Manifest
```bash
$ kubectl apply-f https://docs.projectcalico.org/v3.20/manifests/calico.yaml
```

### Confirm Calico And Tigera Pods
```bash
$ kubectl get pods --all-namespaces -o wide
NAMESPACE          NAME                                       READY   STATUS    RESTARTS   AGE     IP              NODE          NOMINATED NODE   READINESS GATES
calico-apiserver   calico-apiserver-5d64f6856f-r8smd          1/1     Running   0          11m     10.244.77.133   master-node   <none>           <none>
calico-apiserver   calico-apiserver-5d64f6856f-tngbt          1/1     Running   0          11m     10.244.77.134   master-node   <none>           <none>
calico-system      calico-kube-controllers-78d7f6f887-2qvv6   1/1     Running   0          11m     10.244.77.137   master-node   <none>           <none>
calico-system      calico-node-n5p7b                          1/1     Running   0          10m     192.168.0.136   master-node   <none>           <none>
calico-system      calico-typha-58c797c68f-mhhkv              1/1     Running   0          10m     192.168.0.136   master-node   <none>           <none>
calico-system      csi-node-driver-6ngbf                      2/2     Running   0          11m     10.244.77.138   master-node   <none>           <none>
calico-system      goldmane-7d55c4b88b-crf7n                  1/1     Running   0          11m     10.244.77.136   master-node   <none>           <none>
calico-system      whisker-847894db8d-crjsw                   2/2     Running   0          10m     10.244.77.140   master-node   <none>           <none>
...
tigera-operator    tigera-operator-59f47b4f88-t5lgw           1/1     Running   0          12m     192.168.0.136   master-node   <none>           <none>
```

## References
- [Calico quickstart guide](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart) | tigera.io
- [Coredns stuck in “ContainerCreating”](https://discuss.kubernetes.io/t/coredns-stuck-in-containercreating/19100) | kubernetes.io
- [Install Calico networking and network policy for on-premises deployments](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) | tigera.io
- [Proper way to configure Calico Whisker for Ingress exposure?](https://github.com/orgs/projectcalico/discussions/10395) | GitHub
