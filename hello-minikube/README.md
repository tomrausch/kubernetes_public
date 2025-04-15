# Deploy Application "hello-minikube" In Kubernetes

## Create A Deployment
Create a sample deployment and expose it on port 8080:
```bash
kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0
kubectl expose deployment hello-minikube --type=NodePort --port=8080
```

It may take a moment, but your deployment will soon show up when you run:
```
kubectl get services hello-minikube
```

The easiest way to access this service is to let minikube launch a web browser for you:
```
minikube service hello-minikube
```

Alternatively, use kubectl to forward the port:
```
kubectl port-forward service/hello-minikube 7080:8080
```

Tada! Your application is now available at http://localhost:7080/.

You should be able to see the request metadata in the application output. Try changing the path of the request and observe the changes. Similarly, you can do a POST request and observe the body show up in the output.


## References
- [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) | minikube

