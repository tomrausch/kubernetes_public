# Confirm The Deployment And Service

## Confirm The Deployment Is Ready

Run the command ```kubectl get deployment <service-name>``` and observe the result to confirm the Deployment is ready
```
$ kubectl get deployment it-tools
NAME       READY   UP-TO-DATE   AVAILABLE   AGE
it-tools   1/1     1            1           7m13s
```

> [!IMPORTANT]  
> - *NAME* is the name of the Deployment
> - *READY* is 'X' of 'X' and 'X' is the identical integer before and after the forward slash
> - *UP-TO-DATE* is 'X', the same integer as 'X' in *READY*
> - *AVAILABLE* is 'X', the same integer as 'X' in *READY*


--------
## Confirm The Service Is Exposed

Run the command ```kubectl get service <service-name>``` and observe the result to confirm the Service is exposed with type [NodePort](https://kubernetes.io/docs/concepts/services-networking/service/#type-nodeport)
```bash
$ kubectl get service it-tools
NAME                   TYPE           CLUSTER-IP       EXTERNAL-IP    PORT(S)          AGE
it-tools               NodePort       10.109.173.208   <none>         80:30550/TCP     3m37s
```

> [!IMPORTANT]  
> - *NAME* is the name of the Service
> - *TYPE* is 'NodePort'
> - *CLUSTER-IP* is the Cluster IP of the Service
> - *EXTERNAL-IP* is the external IP address of the Service which is ```<none>```
> - *PORT(S)* is of the form ```<service-internal-tcp-port>:<localhost-tcp-port>```


--------
## Confirm The Service Is Associated With A Pod And The Pod Is Running
Run the commmand ```kubectl get pods -A -o wide | grep <service-name>``` and observe the "STATUS" of the pod is "Running". This confirm the Service is assoicated with a Pod and the Pod is running
```bash
$ kubectl get pods -A -o wide | grep it-tools
NAMESPACE   NAME                        READY   STATUS    RESTARTS   AGE   IP             NODE       NOMINATED NODE   READINESS GATES
default     it-tools-6f9bd54c48-lxhgh   1/1     Running   0          14m   10.244.0.11    minikube   <none>           <none>
```

> [!IMPORTANT]
> - *NAME* is the name of the Pod
> - *READY* is "x" of "x"
> - *STATUS* is "Running"
> - *IP* is the internal IP Address of the Pod
> - *NODE* is the name of the Node

### Case: Pod Is Not Running
> [!WARNING]
> In this example here, the pod ```mysql-65699885b7-546f6``` is not Running. This pod needs to be reconfigured and recreated.
>
> **Issues**
> - *READY* is "0" of "1"
> - *STATUS* is "ContainerCreating"
> - *IP* is not assigned
> 
> ```
> $ kubectl get pods -A -o wide
> NAMESPACE    NAME                     READY   STATUS              RESTARTS   AGE     IP       NODE                                         NOMINATED NODE   READINESS GATES
> default      mysql-65699885b7-546f6   0/1     ContainerCreating   0          3h20m   <none>   gk3-thomas-rausch-dev-pool-2-5bf48f1e-vtfv   <none>           <none>
> ```

--------
## Confirm The Pod Is Listening On The Expected TCP Port
Run the commmand ```kubectl exec <pod-name> -- netstat -an``` and observe the result to confirm the Pod is listening on the expected TCP Port
```
$ kubectl exec it-tools-84d87f44c8-ptz5c -- netstat -an
Active Internet connections (servers and established)
Proto Recv-Q Send-Q Local Address           Foreign Address         State       
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      
Active UNIX domain sockets (servers and established)
Proto RefCnt Flags       Type       State         I-Node Path
unix  3      [ ]         STREAM     CONNECTED      34188 
unix  3      [ ]         STREAM     CONNECTED      34186 
unix  3      [ ]         STREAM     CONNECTED      34185 
unix  3      [ ]         STREAM     CONNECTED      34187 
```

> [!IMPORTANT]
> - *Local Address* is of the format \<pod-ip-address\>:\<pod-tcp-port\>
> - The \<pod-tcp-port\> matches \<service-internal-tcp-port\> in the results of the command ```kubectl get svc <service-name>```


--------
## Confirm The Pod Returns HTML Output

Run the commmand ```kubectl exec <pod-name> -- curl http://<pod-ip-address>:<pod-listening-port>``` and observe the result to confirm the Pod returns HTML output
```
$ kubectl exec it-tools-84d87f44c8-ptz5c -- curl http://10.102.128.3:80
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <link rel="icon" href="favicon.ico" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>IT Tools - Handy online tools for developers</title>
    <meta itemprop="name" content="IT Tools - Handy online tools for developers" />
    <meta
      name="description"
      content="Collection of handy online tools for developers, with great UX. IT Tools is a free and open-source collection of handy online tools for developers & people working in IT."
    />
    <meta
      itemprop="description"
      content="Collection of handy online tools for developers, with great UX. IT Tools is a free and open-source collection of handy online tools for developers & people working in IT."
    />
    <link rel="author" href="humans.txt" />
    <link rel="canonical" href="https://it-tools.tech" />

    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png" />
    <link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png" />
    <link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png" />
    <link rel="mask-icon" href="safari-pinned-tab.svg" color="#18a058" />
    <meta name="msapplication-TileColor" content="#da532c" />
    <meta name="theme-color" content="#ffffff" />

    <meta property="og:url" content="https://it-tools.tech/" />
    <meta property="og:type" content="website" />
    <meta property="og:title" content="IT Tools - Handy online tools for developers" />
    <meta
      property="og:description"
      content="Collection of handy online tools for developers, with great UX. IT Tools is a free and open-source collection of handy online tools for developers & people working in IT."
    />
    <meta property="og:image" content="https://it-tools.tech/banner.png?v=2" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:site" content="@ittoolsdottech" />
    <meta name="twitter:creator" content="@cthmsst" />

    <meta name="twitter:title" content="IT Tools - Handy online tools for developers" />
    <meta
      name="twitter:description"
      content="Collection of handy online tools for developers, with great UX. IT Tools is a free and open-source collection of handy online tools for developers & people working in IT."
    />
    <meta name="twitter:image" content="https://it-tools.tech/banner.png?v=2" />
    <meta name="twitter:image:alt" content="IT Tools - Handy online tools for developers" />
    <script type="module" crossorigin src="/assets/index-f8ba620c.js"></script>
    <link rel="stylesheet" href="/assets/index-f0f4dd3b.css">
  <link rel="manifest" href="/manifest.webmanifest"></head>
  <body>
    <div id="app"></div>
    
  </body>
</html>
100  2787  100  2787    0     0  1556k      0 --:--:-- --:--:-- --:--:-- 2721k
```


--------
## Confirm An Endpoint Is Assigned To The Service
Run the command ```kubectl get endpoints <service-name>``` and observe the result to confirm an Endpoint is assigned to the Service
```bash
$ kubectl get endpoints it-tools
NAME       ENDPOINTS         AGE
it-tools   10.102.128.3:80   20h
```

> [!IMPORTANT]  
> - *NAME* is the name of the Service
> - *ENDPOINT* is of the form "\<internal-ip-address\>:\<internal-tcp-port\>"
>   - "\<internal-ip-address\>" matches the internal IP Address of the Pod in the results of the command ```kubectl get pods -A -o wide```
>   - "\<internal-tcp-port\>" matches the "\<internal-tcp-port\>" in the results of the command ```kubectl get svc <service-name>```


---------
## Access The Application In A Browser (Local)

Run the command ```minikube service <service-name>``` and observe the result 

```bash
$ minikube service it-tools
|-----------|----------|-------------|---------------------------|
| NAMESPACE |   NAME   | TARGET PORT |            URL            |
|-----------|----------|-------------|---------------------------|
| default   | it-tools |          80 | http://192.168.49.2:31026 |
|-----------|----------|-------------|---------------------------|
```

Access the device running Kubernetes

Open a browser

Access the URL from the command ```minikube service <service-name>```
- In this example, the URL is ```http://192.168.49.2:31026```

Observe the application in the local browser

--------
## Create And Preserve YAML Files (Optional)
Run these ```kubectl``` commands to "get" the Kubernetes API Resources in YAML format
```bash
$ kubectl get Deployment it-tools -o yaml > it-tools.Deployment.yaml
$ kubectl get Service it-tools -o yaml > it-tools.Service.yaml
```

Save the output files in this GitHub respository

A technician can then apply the Kubernetes API Resources with these command
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Deployment.yaml
deployment.apps/it-tools created
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Service.yaml
service/it-tools created
```


