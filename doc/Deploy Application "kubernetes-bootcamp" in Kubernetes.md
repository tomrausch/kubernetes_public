# Deploy Application "kubernetes-bootcamp" In Kubernetes

## Prerequisites
Install Docker Desktop

Confirm the current context of the ```kubectl``` application is "docker-desktop"
```bash
$ kubectl config current-context
docker-desktop
```


## Deploy The Service

### Create A Deployment
Run this ```kubectl``` command and observe this result to create a Deployment
```bash
$ kubectl create deployment kubernetes-bootcamp --image=jocatalin/kubernetes-bootcamp:v2
deployment.apps/kubernetes-bootcamp created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
$ kubectl expose deployment kubernetes-bootcamp --type=NodePort --port=8080
service/kubernetes-bootcamp exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
$ kubectl get service kubernetes-bootcamp
NAME                  TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
kubernetes-bootcamp   NodePort   10.102.149.81   <none>        8080:31802/TCP   2m50s
```

> [!IMPORTANT]  
> Expose the Deployment as a "NodePort", not as a "LoadBalancer"
>
> If you expose the Deployment as a "LoadBalancer", the "EXTERNAL-IP" becomes "localhost", and you will not be able to access the service from another device on this network
>
> ```bash
> $ kubectl get service kubernetes-bootcamp
> NAME                  TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
> kubernetes-bootcamp   LoadBalancer   10.102.149.81   localhost     8080:31802/TCP   2m50s
> ```

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:31802
- http://192.168.0.136:31802

# Reference
- [Corentin Thomasset](https://corentin.tech/) | Home Page
