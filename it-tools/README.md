# Deploy Application "it-tools" In Kubernetes

## Create A Deployment
Run this ```kubectl``` command and observe this result to create a Deployment
```bash
~$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

## Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
~$ kubectl expose deployment it-tools --type=LoadBalancer --port=80
service/it-tools exposed
```

## Confirm The Service Is Running In A Pod
Run this ```kubectl``` command and observe this result to confirm the Service is running in a pod
```bash
~$ kubectl get pods -A -o wide | grep it-tools
default       it-tools-6f9bd54c48-7cwlq          1/1     Running   0              3m24s   10.244.0.7     minikube   <none>           <none>
```

> [!NOTE]
> Note the pod IP address is "10.224.0.7"

## Confirm An Endpoint Is Assigned To The Service
Run this ```kubectl``` command and observe this result to confirm that an Endpoint is assigned to the Service
```bash
~$ kubectl get endpoints it-tools
NAME       ENDPOINTS       AGE
it-tools   10.244.0.7:80   16m
```

> [!NOTE]
> The IP address of the endpoint -- "10.224.0.7" -- should match the IP address of the pod -- "10.244.0.7".


## Confirm The URL Of The Service
Run this command and observe this result to confirm the URL of the Deployment
```bash
~$ minikube service it-tools --url
http://192.168.49.2:30513
```
The URL of the service is ```http://192.168.49.2:30513``` 

## Confirm The Deployment Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
~$ kubectl get svc it-tools
NAME       TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)        AGE
it-tools   LoadBalancer   10.106.20.245   10.106.20.245   80:30513/TCP   4m52s
```

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
