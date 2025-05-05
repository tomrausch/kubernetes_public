# Deploy A MySQL Database On Kubernetes

## Prerequisites
Install Docker Desktop

Confirm the current context of the ```kubectl``` application is "docker-desktop"
```bash
$ kubectl config current-context
docker-desktop
```

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

ngrok
```
To connect to a local database using ngrok, you'll need to install ngrok, start a TCP tunnel forwarding to your database's port, and then use the provided public URL to connect. You'll essentially be exposing your local database to the internet through a secure tunnel. 
Steps to connect a local database using ngrok:
Install ngrok: Download and install the ngrok command-line tool from the ngrok website. 
Sign up for an ngrok account: If you don't already have one. 
Start a TCP tunnel: Open a terminal and navigate to the ngrok executable directory. Use the command ngrok tcp <your_database_port> (e.g., ngrok tcp 3306 for MySQL). 
Find the public URL: ngrok will generate a public URL in the terminal output. This is the URL you'll use to connect to your database. 
Configure your database connection: Use the public URL (host and port) in your database client or application's connection settings. 
Example:
Let's say your MySQL server is running on port 3306:
Run ngrok tcp 3306. 
Ngrok will output something like: Forwarding tcp://2.tcp.ngrok.io:1234 -> localhost:3306. 
In your database client, you would use 2.tcp.ngrok.io as the host and 1234 as the port. 
Important Considerations:
Port:
Make sure to specify the correct port your database server is listening on. 
Security:
Ngrok creates a secure tunnel, but be mindful of the security implications of exposing your database to the internet. 
Free vs. Paid Plans:
While ngrok offers free plans, they may have limitations on the number of tunnels and other features. For more robust usage, ngrok offers paid plans. 
Authentication:
You'll still need to configure authentication (username and password) on your database server to protect it from unauthorized access. 
Firewall:
Ensure your firewall allows traffic to your database's port. 
```




## References
- [Deploying MySQL on Kubernetes](https://medium.com/@midejoseph24/deploying-mysql-on-kubernetes-16758a42a746) | [Joseph Ariyo](https://medium.com/@midejoseph24/), Medium
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io

