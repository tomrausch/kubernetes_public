# Deploy Applications In Kubernetes

## 🎗️ Prerequisites
Setup a Kubernetes cluster [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine?hl=en)

Access the GKE Cloud Shell

Run the command  ```docker version``` to determine the current version of the Docker application
```
$ docker version
Client: Docker Engine - Community
 Version:           28.0.4
 API version:       1.48
 Go version:        go1.23.7
 Git commit:        b8034c0
 Built:             Tue Mar 25 15:07:16 2025
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          28.0.4
  API version:      1.48 (minimum version 1.24)
  Go version:       go1.23.7
  Git commit:       6430e49
  Built:            Tue Mar 25 15:07:16 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.27
  GitCommit:        05044ec0a9a75232cad458027ca83437aae3f4da
 runc:
  Version:          1.2.5
  GitCommit:        v1.2.5-0-g59923ef
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

Run the command  ```kubectl version``` to determine the current version of the kubectl application
```
$ kubectl version
Client Version: v1.32.2
Kustomize Version: v5.5.0
Server Version: v1.32.2-gke.1182003
```

Run the command  ```kubectl config get-contexts``` to determine the current Context of the kubectl application
```bash
$ kubectl config get-contexts
CURRENT   NAME                                                      CLUSTER                                                   AUTHINFO                                                  NAMESPACE
*         gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   
```

> [!IMPORTANT]  
> *CLUSTER* is the Kubernetes cluster running in GKE


## 💿 Deploy A MySQL Database


Ready these YAML files
- [mysql_01_Secret.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_01_Secret.yaml)
- [mysql_02_Storage.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_02_Storage.yaml)
- [mysql_03_Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_03_Deployment.yaml)
- [mysql_04_ConfigMap.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_04_ConfigMap.yaml)


### Apply The YAML Files
Run these ```kubectl``` commands and observe these results
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Secret.yaml
secret/mysql-secret configured

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_02_Storage.yaml
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_03_Deployment.yaml
Warning: autopilot-default-resources-mutator:Autopilot updated Deployment default/mysql: defaulted unspecified 'cpu' resource for containers [mysql] (see http://g.co/gke/autopilot-defaults).
deployment.apps/mysql created
service/mysql created

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_04_ConfigMap.yaml
configmap/tcp-services created
```




Reference
- [Using pre-existing persistent disks as PersistentVolumes](https://cloud.google.com/kubernetes-engine/docs/how-to/persistent-volumes/preexisting-pd)


 
## ☁️ Deploy The Application "it-tools"
Run the command ```kubectl create deployment it-tools --image=corentinth/it-tools:latest``` and observe this result to create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command ```kubectl expose deployment it-tools --type=LoadBalancer --port=80``` and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/it-tools exposed
```

> [!IMPORTANT]  
> - *type* is "LoadBalancer"
> - *port* is "80"

Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md) for Service "service/it-tools"

Confirm the Service "service/it-tools" is defined in the current Ingress [thomas-rausch-ingress](https://github.com/tomrausch/kubernetes_public/blob/main/src/ingress/thomas-rausch-ingress.yaml)

Perform the procedures in [Deploy The Current Ingress](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Deploy%20The%20Current%20Ingress.md) for Service "service/it-tools"

Access the application in a browser at this URL
- http://\<gke-cluster-external-address\>/it-tools



## ☁️ Deploy The Application "kuard"
Run the command ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` and observe the result to create the Deployment
```bash
$ kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
deployment.apps/kuard created
```

Run the command ```kubectl expose deployment kuard --type=NodePort --port=8080``` and observe the result to expose the Service
```bash
$ kubectl expose deployment kuard --type=LoadBalancer --port=8080
service/kuard exposed
```

> [!IMPORTANT]  
> - *type* is "LoadBalancer"
> - *port* is "8080"


Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md) for Service "service/kuard"

Confirm the Service "service/kuard" is defined in the current Ingress [thomas-rausch-ingress](https://github.com/tomrausch/kubernetes_public/blob/main/src/ingress/thomas-rausch-ingress.yaml)

Perform the procedures in [Deploy The Current Ingress](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Deploy%20The%20Current%20Ingress.md) for Service "service/kuard"

Access the application in a browser at this URL
- http://\<gke-cluster-external-address\>/kuard

Reference
- [kuard](https://github.com/kubernetes-up-and-running/kuard) | Kubernetes Up And Running, GitHub



## ☁️ Deploy The Minikube Test Application
Form the YAML file [minikube-test-application.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml)
- This YAML file contains the Pods and Services for the application
- Reference: [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress)

Run the command ```kubectl apply -f --image=https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml``` to create and expose the Pods and Services

Observe the results

```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml
Warning: autopilot-default-resources-mutator:Autopilot updated Pod default/foo-app: defaulted unspecified 'cpu' resource for containers [foo-app] (see http://g.co/gke/autopilot-defaults).
pod/foo-app created
service/foo-service created
Warning: autopilot-default-resources-mutator:Autopilot updated Pod default/bar-app: defaulted unspecified 'cpu' resource for containers [bar-app] (see http://g.co/gke/autopilot-defaults).
pod/bar-app created
service/bar-service created
```

Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md) for Service "service/foo-service" and "service/bar-service"

Confirm the Services "service/foo-service" and "service/bar-service" are defined in the current Ingress [thomas-rausch-ingress](https://github.com/tomrausch/kubernetes_public/blob/main/src/ingress/thomas-rausch-ingress.yaml)

Perform the procedures in [Deploy The Current Ingress](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Deploy%20The%20Current%20Ingress.md) for Services "service/foo-service" and "service/bar-service"

Access the applications in a browser at these URLs
- http://\<gke-cluster-external-address\>/foo

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


- http://\<gke-cluster-external-address\>/bar

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
