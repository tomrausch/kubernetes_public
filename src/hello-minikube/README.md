# Deploy The Application "hello-minikube" On Kubernetes

## Create The Deployment
Run this command to create the Deployment from an existing YAML file [^hello-minikube-deployment.yaml]
```bash
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Deployment.yaml
```
[^hello-minikube-deployment.yaml]: [hello-minikube-deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube.Deployment.yaml)

Alternately, run this command to create the Deployment using the image
```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
```

In both cases, here is the output of the command
```bash
deployment.apps/hello-minikube created
``` 

## Expose the Deployment & Simultaneously Create The Service
Run this command to expose the Deployment from an existing YAML file [^hello-minikube.Service.yaml]
```bash
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube.Service.yaml
```
[^hello-minikube.Service.yaml]: [hello-minikube.Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube.Service.yaml)

Alternately, run this command to expose the Deployment
```bash
kubectl expose deployment hello-minikube --type=ClusterIP --port=8080
```

In both cases, exposing the Deployment simultaneously creates the Service

In both cases, here is the output of the command
```bash
service/hello-minikube exposed
``` 

## Create The "foo" And "bar" Pods And Services
Run this command to create the "foo" And "bar" Pods And Services from an existing YAML file [^hello-minikube-foo-bar.Pod-Service.yaml]
```bash
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube-foo-bar.Pod-Service.yaml
```
[^hello-minikube-foo-bar.Pod-Service.yaml]: [hello-minikube-foo-bar.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube-foo-bar.Pod-Service.yaml)

Here is the output of the command
```bash
pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
```

## Allow Ingress Network Traffic
Run these command to set the Network Policy from existing YAML files
- These Network Policies allows ingress network traffic from the Ingress Controller to the Application Services
- These Network Policies allows ingress network traffic even if all network traffic in the "default" namespace is blocked

### Service "hello-minikube"
Set the Network Policy for the Service "hello-minikube" [^hello-minikube-allow-ingress-controller-networkpolicy.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube-allow-ingress-controller-networkpolicy.yaml
```
[^hello-minikube-allow-ingress-controller-networkpolicy.yaml]: [hello-minikube-allow-ingress-controller-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube-allow-ingress-controller-networkpolicy.yaml)

Here is the output of the command
```
networkpolicy.networking.k8s.io/hello-minikube-allow-ingress-controller created
```

### Service "hello-minikube-foo"
Set the Network Policy for the Service "hello-minikube-foo" [^hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml
```
[^hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml]: [hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml)

Here is the output of the command
```
networkpolicy.networking.k8s.io/hello-minikube-foo-allow-ingress-controller created
```

### Service "hello-minikube-bar"
Set the Network Policy for the Service "hello-minikube-bar" [^hello-minikube-bar-allow-ingress-controller-networkpolicy.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/hello-minikube/hello-minikube-bar-allow-ingress-controller-networkpolicy.yaml
```
[^hello-minikube-bar-allow-ingress-controller-networkpolicy.yaml]: [hello-minikube-bar-allow-ingress-controller-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/hello-minikube/hello-minikube-foo-allow-ingress-controller-networkpolicy.yaml)

Here is the output of the command
```
networkpolicy.networking.k8s.io/hello-minikube-bar-allow-ingress-controller created
```

## Add The Application To An Application Gateway
Perform the procedures in [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md) to add the application to the Application Gateway
- This procedure adds the Service to the Application Gateway
- If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.

## Check The Application
Perform these procedures after deploying the Application
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md)

Access the application "foo" in a browser at the offset URL ".../foo"

```bash
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
```bash
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

## Reference
- [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress) | minikube




