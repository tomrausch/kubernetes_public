# Install Calico On Kubernetes

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
> References
> - [How do you find the cluster & service CIDR of a Kubernetes cluster?](https://stackoverflow.com/questions/44190607/how-do-you-find-the-cluster-service-cidr-of-a-kubernetes-cluster) | StackOverflow
> - [I set my master with "kubeadm init --pod-network-cidr=10.244.0.0/16", flannel is also set with that...](https://www.reddit.com/r/kubernetes/comments/vim21o/i_set_my_master_with_kubeadm_init/) | Reddit


Reload the configuration and restart kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```

After installing Calico, all the pods including the coredns pods are running
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

Run the command ```kubectl get tigerastatus``` and observe the Calico services start
```
Every 2.0s: kubectl get tigerastatus                                                                                                                                                                    master-node: Mon Aug 11 20:06:24 2025

NAME        AVAILABLE   PROGRESSING   DEGRADED   SINCE
apiserver                             True
goldmane                              True
whisker     True        False         False      18m
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
