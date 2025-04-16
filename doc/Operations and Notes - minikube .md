
## Start The minikube Tunnel
Run the command ```minikube tunnel``` and observe this result to start the minikube Tunnel
```bash
~$ minikube tunnel
[sudo] password for tomrausch:
Status:
        machine: minikube
        pid: 525170
        route: 10.96.0.0/12 -> 192.168.49.2
        minikube: Running
        services: [it-tools]
    errors:
                minikube: no errors
                router: no errors
                loadbalancer emulator: no errors
```
The minikube tunnel runs continuously

## Confirm The minikube Tunnel Is Running
Open a new terminal

Run the command ```ps -ef | grep "minikube tunnel"``` to confirm the minikube tunnel is running
```bash
~$ ps -ef | grep "minikube tunnel"
tomraus+  526334  485261  0 16:18 pts/1    00:00:00 minikube tunnel
```

## Confirm The URL Of The Service
Run this command and observe this result to confirm the URL of the Deployment
```bash
~$ minikube service it-tools --url
http://192.168.49.2:30513
```
The URL of the service is ```http://192.168.49.2:30513``` 

> [!NOTE]
> Note that the "EXTERNAL-IP" is "10.106.20.245"
> 
> If the ```minikube tunnel``` is not runnint, the "EXTERNAL-IP" is "\<pending\>"
> ```
> NAME       TYPE           CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
> it-tools   LoadBalancer   10.98.194.159   <pending>     80:32640/TCP   4s
> ```

## Access Service
The easiest way to access this service is to let minikube launch a web browser for you:
```
minikube service hello-minikube
```

Alternatively, use kubectl to forward the port:
```
kubectl port-forward service/hello-minikube 7080:8080
```


# Install minikube dashboard
```
~$ minikube addons enable dashboard
* dashboard is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* The 'dashboard' addon is enabled
```

```
~$ minikube addons enable metrics-server
* metrics-server is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
* The 'metrics-server' addon is enabled
```

```
~$ minikube start
* minikube v1.35.0 on Ubuntu 24.04
* Using the docker driver based on existing profile
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.46 ...
* Updating the running docker "minikube" container ...
* Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
* Verifying Kubernetes components...
  - Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* Enabled addons: default-storageclass, storage-provisioner, metrics-server, dashboard
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```


## References
- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/) | minikube
