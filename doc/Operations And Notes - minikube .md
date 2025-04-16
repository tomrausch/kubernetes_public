
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


## References
- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/) | minikube
