# Deploy A MySQL Database On Kubernetes

## Source: Kubernetes.io
### Apply The YAML Files
Run these ```kubectl``` commands and observe these results
```
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-pv.yaml
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/website/main/content/en/examples/application/mysql/mysql-deployment.yaml
service/mysql created
deployment.apps/mysql created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
$ kubectl expose deployment mysql --type=NodePort --port=3306
service/mysql exposed
```

### Confirm The Deployment And Service
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/main/doc/Confirm%20The%20Deployment%20And%20Service.md)

### Reference
- [Run a Single-Instance Stateful Application](https://kubernetes.io/docs/tasks/run-application/run-single-instance-stateful-application/)



## Alternate
## Deploy The Service

### Ready The YAML Files
Ready these YAML files
- [mysql_01_Secret.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_01_Secret.yaml)
- [mysql_02_Storage.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_02_Storage.yaml)
- [mysql_03_Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/cb4288547a853fdc88f80f15945ddf9904f54e8c/src/mysql/mysql_03_Deployment.yaml)
- [mysql_04_ConfigMap.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/mysql/mysql_04_ConfigMap.yaml)


### Apply The YAML Files
Run these ```kubectl``` commands and observe these results
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_01_Secret.yaml
secret/mysql-secret created

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_02_Storage.yaml
persistentvolume/mysql-pv-volume created
persistentvolumeclaim/mysql-pv-claim created

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_03_Deployment.yaml
deployment.apps/mysql created

$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/mysql/mysql_04_ConfigMap.yaml
configmap/tcp-services created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
$ kubectl expose deployment mysql --type=NodePort --port=3306
service/mysql exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
$ kubectl get service mysql
NAME    TYPE       CLUSTER-IP       EXTERNAL-IP   PORT(S)          AGE
mysql   NodePort   10.106.103.149   <none>        3306:30460/TCP   6m28s
```

> [!IMPORTANT]  
> Expose the Deployment as a "NodePort", not as a "LoadBalancer"
>
> If you expose the Deployment as a "LoadBalancer", the "EXTERNAL-IP" becomes "localhost", and you will not be able to access the service from another device on this network
>
> ```bash
> $ kubectl get svc mysql
> NAME    TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
> mysql   LoadBalancer   10.111.252.184  localhost       3306:31796/TCP   4m52s
> ```

### References
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io

