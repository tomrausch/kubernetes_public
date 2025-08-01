# Launch A Pod On A Worker Node

Taint the master node
```bash
$ kubectl taint node master-node node-role.kubernetes.io/master:NoSchedule
node/master-node tainted
```

Run the pod
```bash
$ kubectl run ubuntu --image=ubuntu --restart=Never --command sleep infinity
pod/ubuntu created
```

Confimr the pod is in STATUS = "Running" on "NODE" = "worker-node-01"
```bash
$ kubectl get pods --all-namespaces -o wide
NAMESPACE     NAME                                       READY   STATUS              RESTARTS        AGE     IP               NODE             NOMINATED NODE   READINESS GATES
default       busybox-pod                                1/1     Running             0               42m     10.244.77.132    master-node      <none>           <none>
default       hello-blue-whale-7f856d65b7-m8njg          0/1     CrashLoopBackOff    3 (46s ago)     8m18s   10.244.126.202   worker-node-01   <none>           <none>
default       it-tools-798cdf4db-w8brm                   1/1     Running             4 (103s ago)    7m24s   10.244.126.201   worker-node-01   <none>           <none>
default       ubuntu                                     0/1     ContainerCreating   0               8s      <none>           worker-node-01   <none>           <none>
kube-system   calico-kube-controllers-658d97c59c-zxslg   1/1     Running             0               32m     10.244.77.131    master-node      <none>           <none>
kube-system   calico-node-5qwqx                          1/1     Running             0               32m     192.168.0.136    master-node      <none>           <none>
kube-system   calico-node-xpzt7                          1/1     Running             9 (6m6s ago)    28m     192.168.0.241    worker-node-01   <none>           <none>
kube-system   coredns-5dd5756b68-6n6lb                   1/1     Running             0               47m     10.244.77.130    master-node      <none>           <none>
kube-system   coredns-5dd5756b68-h4tcm                   1/1     Running             0               47m     10.244.77.129    master-node      <none>           <none>
kube-system   etcd-master-node                           1/1     Running             4               47m     192.168.0.136    master-node      <none>           <none>
kube-system   kube-apiserver-master-node                 1/1     Running             1               47m     192.168.0.136    master-node      <none>           <none>
kube-system   kube-controller-manager-master-node        1/1     Running             1               47m     192.168.0.136    master-node      <none>           <none>
kube-system   kube-proxy-fdtms                           1/1     Running             0               47m     192.168.0.136    master-node      <none>           <none>
kube-system   kube-proxy-z4xtc                           1/1     Running             8 (7m35s ago)   28m     192.168.0.241    worker-node-01   <none>           <none>
kube-system   kube-scheduler-master-node                 1/1     Running             19              47m     192.168.0.136    master-node      <none>           <none>
```
