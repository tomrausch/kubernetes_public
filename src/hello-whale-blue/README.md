[MetalLB Configuration in Minikube — To enable Kubernetes service of type “LoadBalancer”](https://faun.pub/metallb-configuration-in-minikube-to-enable-kubernetes-service-of-type-loadbalancer-9559739787df)


```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ kubectl get pods --all-namespaces
NAMESPACE              NAME                                         READY   STATUS      RESTARTS      AGE
default                hello-blue-whale-859d885cff-9bmnx            1/1     Running     0             3m59s
ingress-nginx          ingress-nginx-admission-create-gpgxf         0/1     Completed   0             15m
ingress-nginx          ingress-nginx-admission-patch-pqmb6          0/1     Completed   1             15m
ingress-nginx          ingress-nginx-controller-56d7c84fd4-th555    1/1     Running     0             15m
kube-system            coredns-668d6bf9bc-fm6bj                     1/1     Running     0             20m
kube-system            etcd-minikube                                1/1     Running     0             20m
kube-system            kube-apiserver-minikube                      1/1     Running     0             20m
kube-system            kube-controller-manager-minikube             1/1     Running     0             20m
kube-system            kube-proxy-bzwq8                             1/1     Running     0             20m
kube-system            kube-scheduler-minikube                      1/1     Running     0             20m
kube-system            storage-provisioner                          1/1     Running     1 (19m ago)   20m
kubernetes-dashboard   dashboard-metrics-scraper-5d59dccf9b-tx6nx   1/1     Running     0             16m
kubernetes-dashboard   kubernetes-dashboard-7779f9b69b-fprgj        1/1     Running     0             16m
metallb-system         controller-6dd74b674f-l9mct                  1/1     Running     0             16m
metallb-system         speaker-lr6rf                                1/1     Running     0             16m
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ minikube ip
192.168.49.2
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ minikube addons configure metallb
-- Enter Load Balancer Start IP: 192.168.49.5
-- Enter Load Balancer End IP: 192.168.49.15
  - Using image quay.io/metallb/controller:v0.9.6
  - Using image quay.io/metallb/speaker:v0.9.6
* metallb was successfully configured
```
