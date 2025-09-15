# Deploy The Application "hello-minikube" On Kubernetes

## Create The Deployment
Run this command to create the Deployment from an existing YAML file [^hello-minikube-deployment.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Deployment.yaml
```
[^hello-minikube-deployment.yaml]: [hello-minikube-deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube.Deployment.yaml)

Alternately, run this command to create the Deployment using the image
```
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
```

In both cases, here is the output of the command
```
deployment.apps/hello-minikube created
``` 

## Expose the Deployment & Simultaneously Create The Service
Run this command to expose the Deployment from an existing YAML file [^hello-minikube.Service.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Service.yaml
```
[^hello-minikube.Service.yaml]: [hello-minikube.Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube.Service.yaml)

Alternately, run this command to expose the Deployment
```
kubectl expose deployment hello-minikube --type=ClusterIP --port=8080
```

In both cases, exposing the Deployment simultaneously creates the Service

In both cases, here is the output of the command
```
service/hello-minikube exposed
``` 

## Allow Ingress Network Traffic
Run this command to set the Network Policy from an existing YAML file [^hello-minikube-allow-ingress-controller-networkpolicy.yaml]
- This Network Policy allows ingress network traffic from the Ingress Controller to the Application Service
- This Network Policy allows ingress network traffic even if all network traffic in the "default" namespace is blocked
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube-allow-ingress-controller-networkpolicy.yaml
```
[^hello-minikube-allow-ingress-controller-networkpolicy.yaml]: [hello-minikube-allow-ingress-controller-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube-allow-ingress-controller-networkpolicy.yaml)

Here is the output of the command
```
networkpolicy.networking.k8s.io/hello-minikube-allow-ingress-controller created
```

==============================================================================
 

## Add The Application To An Application Gateway
Perform the procedures in [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md) to add the application to the Application Gateway
- This procedure adds the Service to the Application Gateway
- If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.

## Check The Application
Perform these procedures after deploying the Application
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md)
- 

==============================================================================
# Deploy Applications On Kubernetes

--------
## ☁️ Deploy A Standard Application

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

### Inactive
| Name | Commands |  Reference |
| :---: | :--- | :---: |
| hello-minikube | 🔹 `````` <br> 🔹 `````` [^expose_type_cluster_ip_not_verified] <br> Additional Steps Below | minikube start [^minikube_start_service]|
| hello-world (Snake Game) | 🔹 ```kubectl create deployment hello-world --image=bhargavshah86/kube-test:v0.1``` <br> 🔹 ```kubectl expose deployment hello-world --type=ClusterIP --port=80``` [^expose_type_cluster_ip_not_verified] | [hello-world-k8s](https://github.com/skynet86/hello-world-k8s) <br> [“Hello World” on Kubernetes Cluster](https://shahbhargav.medium.com/hello-world-on-kubernetes-cluster-6bec6f4b1bfd) |
| web | 🔹 ```kubectl create deployment web gcr.io/google-samples/hello-app:1.0``` <br> 🔹 ```kubectl expose deployment web --type=ClusterIP --port=8080```[^expose_type_cluster_ip_not_verified] | [web](https://console.cloud.google.com/artifacts/docker/google-samples/us/gcr.io/hello-app?inv=1&invt=AbxY8g) |



For each service exposed as "TYPE" = "ClusterIP", make the associated application available through an application gateway. Procedures are at this link [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md)

If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.

[^minikube_start_service]: [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) | minikube
[^expose_type_cluster_ip_not_verified]: Exposing this application as ```--type=ClusterIP``` is not verified

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
### "hello-minikube" [^minikube_start_ingress]

Form the YAML file [minikube-test-application.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml)
- This YAML file contains the Pods and Services for the application

Run the command ```kubectl apply -f --image=https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml``` and observe the results. This creates Pods and Services.

```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml
pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
```

Access the application "foo" in a browser at the offset URL ".../foo"

```
Request served by foo-app

HTTP/1.1 GET /foo

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: c3f9dcbc270c5fcc4b8fd6fc57ec3449/8716341095219747881
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

Access the application "bar" in a browser at the offset URL ".../bar"

```
Request served by bar-app

HTTP/1.1 GET /bar

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: 4533c4d181e326dc16d6d77b7028eec4/12160296242366395395
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

[^minikube_start_ingress]: [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress) | minikube




