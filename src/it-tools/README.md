# Deploy The Application "it-tools" On Kubernetes

## Create The Deployment
Run this command to create the Deployment from an existing YAML file [^it-tools-deployment.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools-deployment.yaml
```
[^it-tools-deployment.yaml]: [it-tools-deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/it-tools/it-tools-deployment.yaml)

Alternately, run this command to create the Deployment using the image
```
kubectl create deployment it-tools --image=corentinth/it-tools:2024.10.22-7ca5933
```

In both cases, here is the output of the command
```
deployment.apps/it-tools created
``` 
 
## Expose the Deployment & Simultaneously Create The Service
Run this command to expose the Deployment from an existing YAML file [^it-tools-service.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools-service.yaml
```
[^it-tools-service.yaml]: [it-tools-service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/it-tools/it-tools-service.yaml)

Alternately, run this command to expose the Deployment 
```
kubectl expose deployment it-tools --type=ClusterIP --port=80
```

In both cases, exposing the Deployment simultaneously creates the Service

In both cases, here is the output of the command
```
service/it-tools created
``` 

## Check The Deployment And Service
Perform these procedures after deploying the Application
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) 
- [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md)
    - This procedure adds the Service to the Application Gateway
    - If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.
