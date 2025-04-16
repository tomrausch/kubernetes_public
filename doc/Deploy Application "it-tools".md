# Deploy Application "it-tools" In Kubernetes

## Prerequisites
Install Docker Desktop

Confirm the current context of the ```kubectl``` application is "docker-desktop"
```bash
~$ kubectl config current-context
docker-desktop
```


## Deploy The Service

### Create A Deployment
Run this ```kubectl``` command and observe this result to create a Deployment
```bash
~$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
~$ kubectl expose deployment it-tools --type=LoadBalancer --port=80
service/it-tools exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
~$ kubectl get svc it-tools
NAME       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
it-tools   NodePart       10.111.252.184  <none>          80:30198/TCP   4m52s
```

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:30198
- http://192.168.0.136:30198

## Create And Preserve YAML Files

Run these ```kubectl``` commands to "get" the Kubernetes API Resources in YAML format
```bash
~$ kubectl get Deployment it-tools -o yaml > it-tools.Deployment.yaml
~$ kubectl get Service it-tools -o yaml > it-tools.Service.yaml
```

Save the output files in this GitHub respository
- [it-tools.Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/fbec4bd56d54401ee2de8bd39a89496bcd568efe/src/it-tools/it-tools.Deployment.yaml)
- it-tools.Service.yaml

A technician can then apply the Kubernetes API Resources with these command
```bash
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Deployment.yaml
deployment.apps/it-tools created
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Service.yaml
service/it-tools created
```

# Reference
- [Corentin Thomasset](https://corentin.tech/) | Home Page
