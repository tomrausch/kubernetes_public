# Deploy Application "hello-minikube" In Kubernetes

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
~$ kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
deployment.apps/hello-minikube created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
~$ kubectl expose deployment hello-minikube --type=NodePort --port=8080
service/hello-minikube exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
~$ kubectl get svc hello-minikube
NAME             TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)         AGE
hello-minikube   NodePort       10.97.143.108   <none>          8080:31532/TCP  4m52s
```

> [!IMPORTANT]  
> Expose the Deployment as a "NodePort", not as a "LoadBalancer"
>
> If you expose the Deployment as a "LoadBalancer", the "EXTERNAL-IP" becomes "localhost", and you will not be able to access the service from another device on this network
>
> ```bash
> $ kubectl get svc it-tools
> NAME             TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)          AGE
> hello-minikube   LoadBalancer   10.111.252.184  localhost       8080:30198/TCP   4m52s
> ```


## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:31532
- http://192.168.0.136:31532

## Create And Preserve YAML Files

Run these ```kubectl``` commands to "get" the Kubernetes API Resources in YAML format
```bash
~$ kubectl get Deployment hello-minikube -o yaml > hello-minikube.Deployment.yaml
~$ kubectl get Service hello-minikube -o yaml > hello-minikube.Service.yaml
```

Save the output files in this GitHub respository
- [hello-minikube.Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/94d634569f242ab4c8478f91c257dee34e4c0dd2/src/hello-minikube/hello-minikube.Deployment.yaml)
- [hello-minikube.Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/f79db57e3ee43e4faa0fc78af771663412d51404/src/hello-minikube/hello-minikube.Service.yaml)

A technician can then apply the Kubernetes API Resources with these command
```bash
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Deployment.yaml
deployment.apps/hello-minikube created
~$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Service.yaml
service/hello-minikube created
```

# Reference
- [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) | minikube



#### Additional Steps "hello-minikube"
Form the YAML file [minikube-test-application.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml)
- This YAML file contains the Pods and Services for the application
- Reference: [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress)

Run the command ```kubectl apply -f --image=https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml``` and observe the results. This creates Pods and Services.

```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml
pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
```

Access the application "foo" in a browser at the offset URL ".../foo"

```
Request served by foo-app

HTTP/1.1 GET /foo

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: c3f9dcbc270c5fcc4b8fd6fc57ec3449/8716341095219747881
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

Access the application "bar" in a browser at the offset URL ".../bar"

```
Request served by bar-app

HTTP/1.1 GET /bar

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: 4533c4d181e326dc16d6d77b7028eec4/12160296242366395395
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

