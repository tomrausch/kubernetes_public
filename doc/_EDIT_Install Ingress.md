# References

- https://ngrok.com/docs/k8s/guides/using-ingresses/

# Deploy Application "hello-minikube" In Kubernetes

## Prerequisites



## Apply The Ingress Example
```yaml
kind: Pod
apiVersion: v1
metadata:
  name: foo-app
  labels:
    app: foo
spec:
  containers:
    - name: foo-app
      image: 'kicbase/echo-server:1.0'
---
kind: Service
apiVersion: v1
metadata:
  name: foo-service
spec:
  selector:
    app: foo
  ports:
    - port: 8080
---
kind: Pod
apiVersion: v1
metadata:
  name: bar-app
  labels:
    app: bar
spec:
  containers:
    - name: bar-app
      image: 'kicbase/echo-server:1.0'
---
kind: Service
apiVersion: v1
metadata:
  name: bar-service
spec:
  selector:
    app: bar
  ports:
    - port: 8080
---
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: example-ingress
spec:
  rules:
    - http:
        paths:
          - pathType: Prefix
            path: /foo
            backend:
              service:
                name: foo-service
                port:
                  number: 8080
          - pathType: Prefix
            path: /bar
            backend:
              service:
                name: bar-service
                port:
                  number: 8080
---
```


```
$ kubectl apply -f https://storage.googleapis.com/minikube-site-examples/ingress-example.yaml

pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
ingress.networking.k8s.io/example-ingress created
```

## Wait For Ingress Address
```
$ kubectl get ingress
NAME              CLASS   HOSTS   ADDRESS        PORTS   AGE
example-ingress   nginx   *       192.168.49.2   80      4m39s
```

## Observe The Output

### Point The Browser To http://192.168.49.2/foo

```
Request served by foo-app

HTTP/1.1 GET /foo

Host: 192.168.49.2
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.5
Priority: u=0, i
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0
X-Forwarded-For: 192.168.49.1
X-Forwarded-Host: 192.168.49.2
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Scheme: http
X-Real-Ip: 192.168.49.1
X-Request-Id: b1f017fd5d20c1ad77443e065407d13a
X-Scheme: http
```


## Observe The Output

### Point The Browser To http://192.168.49.2/bar

```
Request served by bar-app

HTTP/1.1 GET /bar

Host: 192.168.49.2
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.5
Priority: u=0, i
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0
X-Forwarded-For: 192.168.49.1
X-Forwarded-Host: 192.168.49.2
X-Forwarded-Port: 80
X-Forwarded-Proto: http
X-Forwarded-Scheme: http
X-Real-Ip: 192.168.49.1
X-Request-Id: 590acd5519c2d5fae3f122cb2d03b089
X-Scheme: http

```





<hr>
<hr/>

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

