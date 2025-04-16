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

### Access The Service Locally And Remotely Via The Assigned TCP Port

URLs
- http://localhost:30198
- http://192.168.0.136:30198

# Create And Preserve YAML Files

Run this ```kubectl``` command to "get" the Deployment in YAML format
```bash
~$ kubectl get Deployment it-tools -o yaml > it-tools.Deployment.yaml
```
Save the output in this GitHub respository as "it-tools_01_Deployment.yaml" 

Run this ```kubectl``` command to "get" the Service in YAML format
```bash
~$ kubectl get Service it-tools -o yaml > it-tools.Service.yaml
```
Save the file "it-tools_02_Service-LoadBalancer.yaml" in this GitHub respository

One can then apply the Deployment and Service with this command
```bash
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/it-tools/it-tools_01_Deployment.yaml
deployment.apps/it-tools created
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/it-tools/it-tools_02-Service-LoadBalancer.yaml
service/it-tools created
```

# References
- [Corentin Thomasset](https://corentin.tech/) | Home Page
