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
- Run the command ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` and observe this result to create the Deployment
```bash
$ kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
deployment.apps/kuard created
```
- Run the command ```kubectl expose deployment kuard --type=NodePort --port=8080``` and observe the result to expose the Deployment
```bash
$ kubectl expose deployment kuard --type=LoadBalancer --port=8080
service/kuard exposed
```

> [!IMPORTANT]  
> - Expose the Deployment as a "LoadBalancer", not as a "NodePort"
> - The *port* is "8080"

- Perform the checks in [Confirm The Service](https://github.com/tomrausch/kubernetes_public/blob/a112cb64662de0179dc2a1095bb642aff3e1bbcf/doc/Confirm%20The%20Service.md)
- Deploy the current Ingress

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:31188
- http://192.168.0.136:31188

# Reference
- [kuard](https://github.com/kubernetes-up-and-running/kuard) | Kubernetes Up And Running, GitHub
