# Deploy Application "it-tools" In Kubernetes

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
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=NodePort --port=80
service/it-tools exposed
```

## Confirm The Service
### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
$ kubectl get svc it-tools
NAME       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
it-tools   NodePart       10.111.252.184  <none>          80:30198/TCP   4m52s
```

### Confirm The Service Is Running In A Pod
Run this ```kubectl``` command and observe this result to confirm the Service is running in a pod
```bash
$ kubectl get pods -A -o wide | grep it-tools
default       it-tools-6f9bd54c48-7cwlq          1/1     Running   0              3m24s   10.244.0.7     minikube   <none>           <none>
```

> [!NOTE]
> Note the pod IP address is "10.224.0.7"

### Confirm An Endpoint Is Assigned To The Service
Run this ```kubectl``` command and observe this result to confirm that an Endpoint is assigned to the Service
```bash
$ kubectl get endpoints it-tools
NAME       ENDPOINTS       AGE
it-tools   10.244.0.7:80   16m
```



> [!IMPORTANT]  
> Expose the Deployment as a "NodePort", not as a "LoadBalancer"
>
> If you expose the Deployment as a "LoadBalancer", the "EXTERNAL-IP" becomes "localhost", and you will not be able to access the service from another device on this network
>
> ```bash
> $ kubectl get svc it-tools
> NAME       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
> it-tools   LoadBalancer   10.111.252.184  localhost       80:30198/TCP   4m52s
> ```

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:30198
- http://192.168.0.136:30198

## Create And Preserve YAML Files

Run these ```kubectl``` commands to "get" the Kubernetes API Resources in YAML format
```bash
$ kubectl get Deployment it-tools -o yaml > it-tools.Deployment.yaml
$ kubectl get Service it-tools -o yaml > it-tools.Service.yaml
```

Save the output files in this GitHub respository
- [it-tools.Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/fbec4bd56d54401ee2de8bd39a89496bcd568efe/src/it-tools/it-tools.Deployment.yaml)
- [it-tools.Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/59efb59adac2185a7f8cf3b1cd07f93e0f86832b/src/it-tools/it-tools.Service.yaml)

A technician can then apply the Kubernetes API Resources with these command
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Deployment.yaml
deployment.apps/it-tools created
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Service.yaml
service/it-tools created
```

# Reference
- [Corentin Thomasset](https://corentin.tech/) | Home Page
