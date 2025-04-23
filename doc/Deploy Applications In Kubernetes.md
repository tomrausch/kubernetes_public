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


 
## ☁️ Deploy The Application "it-tools"
Run the command ```kubectl create deployment kuard --image=corentinth/it-tools:latest``` and observe this result to create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command ```kubectl expose deployment it-tools --type=LoadBalancer --port=80``` and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/kuard exposed
```

> [!IMPORTANT]  
> - *type* is "LoadBalancer"
> - *port* is "80"

Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md)

Deploy the current Ingress

Access the application in a browser at this URL
- http://<ingress-ip-address>:<ingress-path-to-service>



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

Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md)

Deploy the current Ingress

Access the application in a browser at this URL
- http://<ingress-ip-address>:<ingress-path-to-service>

Reference
- [kuard](https://github.com/kubernetes-up-and-running/kuard) | Kubernetes Up And Running, GitHub





## Deploy The Minikube Test Application



