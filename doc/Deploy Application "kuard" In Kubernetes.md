# Deploy Applications In Kubernetes

## Prerequisites
- Setup a Kubernetes cluster [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine?hl=en)
- Access the GKE Cloud Shell
- Run the command  ```kubectl config get-contexts``` to determine the current Context of the kubectl application
```bash
$ kubectl config get-contexts
CURRENT   NAME                                                      CLUSTER                                                   AUTHINFO                                                  NAMESPACE
*         gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   gke_fresh-sequence-268900_us-central1_thomas-rausch-dev   
```

> [!IMPORTANT]  
> *CLUSTER* is the Kubernetes cluster running in GKE


## Deploy The Application "kuard"

### Create A Deployment
Run the command ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` and observe this result to create the Deployment
```bash
$ kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
deployment.apps/kuard created
```

### Expose The Deployment
Run the command ```kubectl expose deployment kuard --type=NodePort --port=8080``` and observe the result to expose the Deployment
```bash
$ kubectl expose deployment kuard --type=NodePort --port=8080
service/kuard exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
NAME    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
kuard   NodePort   10.106.115.203   <none>        8080:31188/TCP   5s
```

> [!IMPORTANT]  
> Expose the Deployment as a "NodePort", not as a "LoadBalancer"
>
> If you expose the Deployment as a "LoadBalancer", the "EXTERNAL-IP" becomes "localhost", and you will not be able to access the service from another device on this network
>
> ```bash
> $ kubectl get svc it-tools
> NAME    TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
> kuard   LoadBalancer   10.111.252.184  localhost       8080:30198/TCP   4m52s
> ```

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:31188
- http://192.168.0.136:31188

# Reference
- [kuard](https://github.com/kubernetes-up-and-running/kuard) | Kubernetes Up And Running, GitHub
