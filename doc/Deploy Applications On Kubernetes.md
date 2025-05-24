# Deploy Applications On Kubernetes

--------

## ☁️ Deploy A Standard Application

Run the command "Command - Create Deployment" in Table 1 below and observe the result to deploy an image and create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command "Command - Expose Service" in the table below and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/it-tools exposed
```

Perform the checks in [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) for Service "service/kuard"


#### Table 1

| Name | Command - Create Deployment | Command - Expose Service | Additional Steps | Reference |
| :---: | :--- | :--- | :---  | :---: |
| hello-blue-whale | ```kubectl create deployment hello-blue-whale --image=vamsijakkula/hello-blue-whale:v1``` | ```kubectl expose deployment hello-blue-whale --type=NodePort --port=80``` | None | [vamsijakkula](https://gist.github.com/vamsijakkula)|
| hello-minikube | ```kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0``` | ```kubectl expose deployment hello-minikube --type=NodePort --port=8080``` | Yes - Below | [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) |
| it-tools | ```kubectl create deployment it-tools --image=corentinth/it-tools:latest``` | ```kubectl expose deployment it-tools --type=NodePort --port=80``` | None | [CorentinTh/it-tools](https://github.com/CorentinTh/it-tools)
| kuard | ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` | ```kubectl expose deployment kuard --type=NodePort --port=8080``` | None | [kuard](https://github.com/kubernetes-up-and-running/kuard) |
| web | ```kubectl create deployment web gcr.io/google-samples/hello-app:1.0``` | ```kubectl expose deployment web --type=NodePort --port=8080``` | None | [web](https://console.cloud.google.com/artifacts/docker/google-samples/us/gcr.io/hello-app?inv=1&invt=AbxY8g) |

