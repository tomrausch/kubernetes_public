# Deploy Application "it-tools" In Kubernetes

## 
- Install Docker Desktop
- 


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

## Confirm The URL Of The Service
Run this command and observe this result to confirm the URL of the Deployment
```bash
~$ minikube service it-tools --url
http://192.168.49.2:30513
```
The URL of the service is ```http://192.168.49.2:30513``` 

> [!NOTE]
> Note that the "EXTERNAL-IP" is "10.106.20.245"
> 
> If the ```minikube tunnel``` is not runnint, the "EXTERNAL-IP" is "\<pending\>"
> ```
> NAME       TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
> it-tools   LoadBalancer   10.98.194.159   <pending>     80:32640/TCP   4s
> ```


# Create YAML Files

Run this ```kubectl``` command to "get" the Deployment in YAML format
```bash
~$ kubectl get deployment it-tools -o yaml
```
Save the output in this GitHub respository as "it-tools_01_Deployment.yaml" 

Run this ```kubectl``` command to "get" the Service in YAML format
```bash
~$ kubectl get service it-tools -o yaml
```
Save the file "it-tools_02_Service-LoadBalancer.yaml" in this GitHub respository

One can then apply the Deployment and Service with this command
```bash
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/it-tools/it-tools_01_Deployment.yaml
deployment.apps/it-tools created
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/it-tools/it-tools_02-Service-LoadBalancer.yaml
service/it-tools created
```

## References
- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/) | minikube
- [kubernetes service not accessible through browser](https://stackoverflow.com/questions/66289053/kubernetes-service-not-accessible-through-browser) | StackOverflow

# Files
- [it-tools_01_Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/1193b10ebb36365b71dd9fe516c9faf217505f06/it-tools/it-tools_01_Deployment.yaml)
- [it-tools_02_Service-LoadBalancer.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/it-tools/it-tools_02_Service-NodePort.yaml)
- [it-tools_02_Service-NodePort.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/it-tools/it-tools_02_Service-NodePort.yaml)
- [it-tools_02_Service-NodePort_Retrieved.yaml](https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/it-tools/it-tools_02_Service-NodePort_Retrieved.yaml)

# References
- [Corentin Thomasset](https://corentin.tech/) | Home Page
