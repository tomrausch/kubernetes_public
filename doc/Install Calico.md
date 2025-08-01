# Install Calico

## Install Calico Custom Resource Definitions (CRD)
```bash
$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.2/manifests/operator-crds.yaml
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

## Install Tigera Custom Resources
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/calico/tigera-calico-custom-resources.yaml
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created
```

## Install Calico General Resources
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/calico/calico_general.yaml
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
> Reference: [I set my master with "kubeadm init --pod-network-cidr=10.244.0.0/16", flannel is also set with that...](https://www.reddit.com/r/kubernetes/comments/vim21o/i_set_my_master_with_kubeadm_init/) | Reddit

Reload the configuration and restart kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```

After installing Calico, all the pods including the coredns pods are running
- Investigate the pods with 'kubectl'
```bash
$ kubectl get pods --all-namespaces
NAMESPACE      NAME                                       READY   STATUS             RESTARTS         AGE
kube-system    calico-kube-controllers-658d97c59c-8hx55   1/1     Running            0                85s
kube-system    calico-node-82298                          1/1     Running            0                85s
kube-system    coredns-5dd5756b68-jjlh5                   1/1     Running            0                88m
kube-system    coredns-5dd5756b68-sq9st                   1/1     Running            0                144m
kube-system    etcd-master-node                           1/1     Running            1 (82m ago)      144m
kube-system    kube-apiserver-master-node                 1/1     Running            14 (82m ago)     144m
kube-system    kube-controller-manager-master-node        1/1     Running            14 (82m ago)     144m
kube-system    kube-proxy-p4lgt                           1/1     Running            1 (82m ago)      144m
kube-system    kube-scheduler-master-node                 1/1     Running            14 (82m ago)     144m
```
- Investigate the pods with 'crictl'
```bash
$ sudo crictl pods
WARN[0000] runtime connect using default endpoints: [unix:///var/run/dockershim.sock unix:///run/containerd/containerd.sock unix:///run/crio/crio.sock unix:///var/run/cri-dockerd.sock]. As the default settings are now deprecated, you should set the endpoint instead.
ERRO[0000] validate service connection: validate CRI v1 runtime API for endpoint "unix:///var/run/dockershim.sock": rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing: dial unix /var/run/dockershim.sock: connect: no such file or directory"
POD ID              CREATED             STATE               NAME                                       NAMESPACE           ATTEMPT             RUNTIME
f36687cadaaa3       4 minutes ago       Ready               coredns-5dd5756b68-jjlh5                   kube-system         6                   (default)
185cdf2867618       4 minutes ago       Ready               calico-kube-controllers-658d97c59c-8hx55   kube-system         10                  (default)
774c959eb0fcd       4 minutes ago       Ready               coredns-5dd5756b68-sq9st                   kube-system         5                   (default)
098f1aaa718fd       5 minutes ago       Ready               calico-node-82298                          kube-system         0                   (default)
07b4dd6b5a9d5       About an hour ago   Ready               kube-proxy-p4lgt                           kube-system         1                   (default)
2db005b431d89       About an hour ago   Ready               kube-controller-manager-master-node        kube-system         1                   (default)
d521c059b525b       About an hour ago   Ready               etcd-master-node                           kube-system         1                   (default)
034547c5e62f9       About an hour ago   Ready               kube-apiserver-master-node                 kube-system         1                   (default)
dbdabaec3b382       About an hour ago   Ready               kube-scheduler-master-node                 kube-system         1                   (default)
```



## DO NOT Install
### DO NOT Install Tigera Operators
```
$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.2/manifests/tigera-operator.yaml
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created
```

### DO NOT Install The Calico Manifest
```bash
$ kubectl apply-f https://docs.projectcalico.org/v3.20/manifests/calico.yaml
```

## References
- [Calico quickstart guide](https://docs.tigera.io/calico/latest/getting-started/kubernetes/quickstart) | tigera.io
- [Install Calico networking and network policy for on-premises deployments](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) | tigera.io
- [Coredns stuck in “ContainerCreating”](https://discuss.kubernetes.io/t/coredns-stuck-in-containercreating/19100) | kubernetes.io


