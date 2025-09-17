🔹 
🔹 
🔹 kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kuard/kuard-allow-ingress-controller-networkpolicy.yaml




# Deploy The Application "kuard" On Kubernetes

## Create The Deployment
Run this command to create the Deployment from an existing YAML file [^kuard.Deployment.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kuard/kuard.Deployment.yaml
```
[^kuard.Deployment.yaml]: [kuard.Deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/kuard/kuard.Deployment.yaml)

Alternately, run this command to create the Deployment using the image
```
kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
```

In both cases, here is the output of the command
```
deployment.apps/kuard created
``` 
 
## Expose the Deployment & Simultaneously Create The Service
Run this command to expose the Deployment from an existing YAML file [^kuard.Service.yaml]
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kuard/kuard.Service.yaml
```
[^kuard.Service.yaml]: [it-tools-service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/kuard/kuard.Service.yaml)

Alternately, run this command to expose the Deployment 
```
kubectl expose deployment kuard --type=ClusterIP --port=8080
```

In both cases, exposing the Deployment simultaneously creates the Service

In both cases, here is the output of the command
```
service/it-tools created
``` 

## Allow Ingress Network Traffic
Run this command to set the Network Policy from an existing YAML file [^it-tools-allow-ingress-controller-networkpolicy.yaml]
- This Network Policy allows ingress network traffic from the Ingress Controller to the Application Service
- This Network Policy allows ingress network traffic even if all network traffic in the "default" namespace is blocked
```
kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools-allow-ingress-controller-networkpolicy.yaml
```
[^it-tools-allow-ingress-controller-networkpolicy.yaml]: [it-tools-allow-ingress-controller-networkpolicy.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/it-tools/it-tools-allow-ingress-controller-networkpolicy.yaml)

Here is the output of the command
```
networkpolicy.networking.k8s.io/it-tools-allow-ingress-controller unchanged
```


## Add The Application To An Application Gateway
Perform the procedures in [Access Kubernetes Applications Through An Application Gateway](https://github.com/tomrausch/kubernetes_public/blob/7245f5e7dda852ffa6ef40769669db586e52046d/doc/Access%20Kubernetes%20Applications%20Through%20An%20Application%20Gateway.md) to add the application to the Application Gateway
- This procedure adds the Service to the Application Gateway
- If a an application will not be made available through an application gateway, expose the service as "TYPE" = "NodePort" instead of "TYPE" = "ClusterIP". That is, substitute ```--type=NodePort``` for ```--type=ClusterIP``` in the Kubernetes command.

## Check The Application
Perform these procedures after deploying the Application
- [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) 
