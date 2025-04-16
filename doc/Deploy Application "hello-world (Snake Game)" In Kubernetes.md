# Deploy Application "hello-world (Snake Game)" In Kubernetes

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
~$ kubectl create deployment hello-world --image=bhargavshah86/kube-test:v0.1
deployment.apps/hello-world created
```

### Expose The Deployment
Run this ```kubectl``` command and observe this result to expose the Deployment
```bash
~$ kubectl expose deployment hello-world --type=NodePort --port=80
service/hello-minikube exposed
```

### Confirm The Service Is Exposed
Run this command and observe this result to confirm the Deployment is exposed
```bash
~$ kubectl get svc hello-minikube
NAME          TYPE           CLUSTER-IP      EXTERNAL-IP     PORT(S)         AGE
hello-world   NodePort       10.106.147.11   <none>          80:31792/TCP    4m52s
```

## Access The Service Locally And Remotely Via A Browser

URLs
- http://localhost:31792
- http://192.168.0.136:31792

## YAML Files
The YAML files are available at the "hello-world-k8s" reference below

# Reference
- [hello-world-k8s](https://github.com/skynet86/hello-world-k8s) | skynet86


