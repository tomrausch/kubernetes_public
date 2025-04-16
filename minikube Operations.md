
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
