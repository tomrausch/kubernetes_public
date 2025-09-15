# Deploy Applications On Kubernetes

--------
## ☁️ Deploy A Standard Application

- [hello-minikube - README.md](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/README.md)
- [it-tools - README.md](https://github.com/tomrausch/kubernetes_public/blob/main/src/it-tools/README.md)


========================================================================================================

Run the command "Command - Create Deployment" in Table 1 below and observe the result to deploy an image and create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command "Command - Expose Service" in the table below and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/it-tools exposed
```

Perform the checks in [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) for Service "service/kuard"

### Active

| Name | Commands |  Reference |
| :---: | :--- | :---: |
| enclosed | 🔹 ```kubectl create deployment enclosed --image=corentinth/enclosed:1.16.0``` <br>🔹 ```kubectl expose deployment enclosed --type=ClusterIP --port=8787``` <br>🔹 ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/enclosed/enclosed-allow-ingress-controller.yaml``` | [CorentinTh/enclosed](https://github.com/CorentinTh/enclosed) |
| hello-blue-whale |  🔹 ```kubectl create deployment hello-blue-whale --image=vamsijakkula/hello-blue-whale:v1``` <br> 🔹 ```kubectl expose deployment hello-blue-whale --type=ClusterIP --port=80``` <br> 🔹 ```kubectl apply -f  https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-blue-whale/hello-blue-whale-allow-ingress-controller-networkpolicy.yaml``` | [vamsijakkula](https://gist.github.com/vamsijakkula)|
| kuard | 🔹 ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` <br> 🔹 ```kubectl expose deployment kuard --type=ClusterIP --port=8080``` <br> 🔹 ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kuard/kuard-allow-ingress-controller-networkpolicy.yaml``` | [kuard](https://github.com/kubernetes-up-and-running/kuard) |

### Inactive
| Name | Commands |  Reference |
| :---: | :--- | :---: |
| hello-world (Snake Game) | 🔹 ```kubectl create deployment hello-world --image=bhargavshah86/kube-test:v0.1``` <br> 🔹 ```kubectl expose deployment hello-world --type=ClusterIP --port=80``` [^expose_type_cluster_ip_not_verified] | [hello-world-k8s](https://github.com/skynet86/hello-world-k8s) <br> [“Hello World” on Kubernetes Cluster](https://shahbhargav.medium.com/hello-world-on-kubernetes-cluster-6bec6f4b1bfd) |
| web | 🔹 ```kubectl create deployment web gcr.io/google-samples/hello-app:1.0``` <br> 🔹 ```kubectl expose deployment web --type=ClusterIP --port=8080```[^expose_type_cluster_ip_not_verified] | [web](https://console.cloud.google.com/artifacts/docker/google-samples/us/gcr.io/hello-app?inv=1&invt=AbxY8g) |



For each service exposed as "TYPE" = "ClusterIP", make the associated application available through an application gateway. Procedures are at this link [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md)

If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.


## Deploy A Pod That Never Stops [^pod_never_stops]
### busybox
Initiate the pod
```
kubectl run busybox --image=busybox --restart=Never --command sleep infinity
```
Interact with the pod
```
$ kubectl exec busybox -it -- hostname
busybox
$ kubectl exec busybox -it -- hostname -i
172.16.77.136
```

### ubuntu
Initiate the pod
```
kubectl run ubuntu --image=ubuntu --restart=Never --command sleep infinity
```
Interact with the pod
```
$ kubectl exec ubuntu -it -- bash
root@ubuntu:/# hostname
ubuntu
root@ubuntu:/# hostname -i
172.16.77.137
root@ubuntu:/# df
Filesystem                        1K-blocks     Used Available Use% Mounted on
overlay                           477514616 23501296 429683492   6% /
tmpfs                                 65536        0     65536   0% /dev
/dev/mapper/ubuntu--vg-ubuntu--lv 477514616 23501296 429683492   6% /etc/hosts
shm                                   65536        0     65536   0% /dev/shm
tmpfs                               7987256       12   7987244   1% /run/secrets/kubernetes.io/serviceaccount
tmpfs                               4044828        0   4044828   0% /proc/asound
tmpfs                               4044828        0   4044828   0% /proc/acpi
tmpfs                               4044828        0   4044828   0% /proc/scsi
tmpfs                               4044828        0   4044828   0% /sys/firmware
root@ubuntu:/# ^C
root@ubuntu:/# exit
exit
command terminated with exit code 130
```

[^pod_never_stops]: [How can I keep a container running on Kubernetes?](https://stackoverflow.com/questions/31870222/how-can-i-keep-a-container-running-on-kubernetes) | Stack Overflow


## Additional Steps
