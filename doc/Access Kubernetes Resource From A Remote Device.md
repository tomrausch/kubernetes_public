# Access A Kubernetes Resource From A Remote Device

## Prerequisite
- [Install Kubernetes (Minikube) On Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/fd1faacc417ef3181736e628fa6ca61db1e79131/doc/Install%20Kubernetes%20On%20Linux.md)


## Access A Kubernetes Resource From A Remote Device Using Port Forwarding
Setup this these services
```
NAME               TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
bar-service        ClusterIP      10.110.116.70   <none>         8080/TCP         8d
foo-service        ClusterIP      10.98.156.172   <none>         8080/TCP         8d
hello-blue-whale   NodePort       10.97.31.110    <none>         80:30834/TCP     9d
hello-minikube     NodePort       10.101.43.136   <none>         8080:31389/TCP   8d
hello-world        LoadBalancer   10.104.68.73    192.168.49.5   80:32104/TCP     9h
it-tools           NodePort       10.107.1.241    <none>         80:31239/TCP     5d6h
kuard              NodePort       10.107.50.119   <none>         8080:30518/TCP   8d
kubernetes         ClusterIP      10.96.0.1       <none>         443/TCP          11d
web                LoadBalancer   10.111.246.3    192.168.49.6   8080:32340/TCP   9h
```

Run this command
```
$ kubectl port-forward --address=0.0.0.0 service/hello-blue-whale 8081:80
Forwarding from 0.0.0.0:8081 -> 80
```

Open web browser

Access URL ```http://192.168.0.136:8081/```

Will see the Blue Whale

### References
- [How to expose my Minikube tunnel network (LoadBalancer) to my Wifi / LAN](https://askubuntu.com/questions/1503024/how-to-expose-my-minikube-tunnel-network-loadbalancer-to-my-wifi-lan)
- [Use Port Forwarding to Access Applications in a Cluster](https://kubernetes.io/docs/tasks/access-application-cluster/port-forward-access-application-cluster/) | Kubernetes


## Access A Kubernetes Resource From A Remote Device Using A ssh Tunnel

### Access A Kubernetes Service Resource
- Logon a local Windows device
- Open a SSH connection to the Linux device that hosts Kubernetes (minikube) host
  - The IP address of the Linux device is the variable ```ip_address_kubernetes_host```

> [!NOTE]
> In this example, ```ip_address_kubernetes_host``` = "192.168.0.136"

- Logon the Linux device that hosts minikube/Kubernetes
  - The User ID used to logon the Linux device is the variable ```user_id_kubernetes_host```

> [!NOTE]
> In this example, ```user_id_kubernetes_host``` = "tomrausch"

- Run the command ```minikube ip``` on the Linux device
  - The output is the variable ```ip_address_kubernetes_service```
```
$ minikube ip
192.168.49.2
```

> [!NOTE]
>
> In this example, ```ip_address_kubernetes_service``` = "192.168.49.2"

- Run the command ```kubectl get service``` on the Linux device
```bash
$ kubectl get service
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
bar-service        ClusterIP   10.110.116.70   <none>        8080/TCP         3d7h
foo-service        ClusterIP   10.98.156.172   <none>        8080/TCP         3d7h
hello-blue-whale   NodePort    10.97.31.110    <none>        80:30834/TCP     4d
hello-minikube     NodePort    10.101.43.136   <none>        8080:31389/TCP   3d8h
it-tools           NodePort    10.107.1.241    <none>        80:31239/TCP     37m
kuard              NodePort    10.107.50.119   <none>        8080:30518/TCP   3d7h
kubernetes         ClusterIP   10.96.0.1       <none>        443/TCP          5d21h
web                NodePort    10.104.242.53   <none>        8080:30983/TCP   5d20h
```

- Identify the Kubernetes service to access remotely
- Identify the internal Kubernetes PORT of this service
  - This PORT is the variable ```tcp_port_kubernetes_service```

> [!NOTE]
> In this example, the Kubernetes service is "it-tools"
>  
> In this example, ```tcp_port_kubernetes_service``` = "31239"

- Open a PowerShell prompt
- Run the command ```ssh <user_id_kubernetes_host>@<ip_address_kubernetes_host> -L <tcp_port_local_windows>:<ip_address_kubernetes_service>:<tcp_port_kubernetes_service>```

> [!NOTE]
> In this example, we will use "31239" as the variable ```tcp_port_local_windows```
> - The variable ```tcp_port_local_windows``` can be any port not currently LISTENING on the local Windows device
> 
> In this example, the command is ```ssh tomrausch@192.168.0.136 -L 31239:192.168.49.2:31239```

```shell
PS > ssh tomrausch@192.168.0.136 -L 31239:192.168.49.2:31239
The authenticity of host '192.168.0.136 (192.168.0.136)' can't be established.
ED25519 key fingerprint is SHA256:vFP3y6dEx5b8jmxImUdFJjYOtDXivKrmiMBf62Ffr2Y.
This key is not known by any other names.
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added '192.168.0.136' (ED25519) to the list of known hosts.
tomrausch@192.168.0.136's password:
Welcome to Ubuntu 24.04.2 LTS (GNU/Linux 6.11.0-25-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/pro

Expanded Security Maintenance for Applications is enabled.

0 updates can be applied immediately.

Last login: Fri May  9 16:38:37 2025 from 192.168.0.212
```

- Observe the ssh tunnel open

![image](https://github.com/user-attachments/assets/cd7a46b8-96a6-4fd5-8ac4-648e7ab15ea4)

- Open a Web browser
- Access the URL ```http://localhost:<tcp_port_local_windows>```

> [!NOTE]
> In this example, the URL is ```http://localhost:31239```

- Observe the output of the Kubernetes service in the Web browser of the local Windows device

![image](https://github.com/user-attachments/assets/498b435d-0a7d-4f06-b9a6-07c900dd205f)

#### References
- [access an http server as localhost from an external pc over ssh](https://serverfault.com/questions/1004529/access-an-http-server-as-localhost-from-an-external-pc-over-ssh) | [serverfault](https://serverfault.com/)
- [Which command is used to establish ssh tunnel in windows?](https://serverfault.com/questions/888693/which-command-is-used-to-establish-ssh-tunnel-in-windows) | [serverfault](https://serverfault.com/)

### Access A Kubernetes Ingress Resource
Accessing a Kubernetes ingress is much like accessing a Kubernetes service

- Obtain these variables in the same way as when accessing a Kubernetes service

  - ```user_id_kubernetes_host```
  - ```ip_address_kubernetes_host```
  - ```tcp_port_local_windows```

- Run the command ```kubectl get ingress``` on the Linux device
```
$ kubectl get ingress
NAME                    CLASS   HOSTS                      ADDRESS        PORTS   AGE
thomas-rausch-ingress   nginx   *                          192.168.49.2   80      4d6h
```

- Identify the Kubernetes ingress to access remotely
- Identify the Kubernetes ADDRESS and PORT of this ingress
  - This NAME is the variable ```name_kubernetes_ingress```
  - This ADDRESS is the variable ```ip_address_kubernetes_ingress```
  - This PORT is the variable ```tcp_port_kubernetes_ingress```

- Run the command ```ssh <user_id_kubernetes_host>@<ip_address_kubernetes_host> -L <tcp_port_local_windows>:<ip_address_kubernetes_ingress>:<tcp_port_kubernetes_ingress>```
- Observe the ssh tunnel open

- Run the command ```kubectl describe ingress <name_kubernetes_ingress>```

```
$ kubectl describe ingress thomas-rausch-ingress
Name:             thomas-rausch-ingress
Labels:           <none>
Namespace:        default
Address:          192.168.49.2
Ingress Class:    nginx
Default backend:  <default>
Rules:
  Host        Path  Backends
  ----        ----  --------
  *
              /it-tools           it-tools:80 (10.244.0.38:80)
              /kuard              kuard:8080 (10.244.0.31:8080)
              /foo                foo-service:8080 (10.244.0.30:8080)
              /bar                bar-service:8080 (10.244.0.32:8080)
              /hello-blue-whale   hello-blue-whale:80 (10.244.0.33:80)
              /hello-minikube     hello-minikube:8080 (10.244.0.29:8080)
              /web                web:8080 (10.244.0.37:8080)
Annotations:  <none>
Events:       <none>
```

- Any of the Path strings serves as the variable ```<path_kubernetes_ingress>```
- Open a Web browser
- Access the URL ```http://localhost:<tcp_port_local_windows>/<path_kubernetes_ingress>```

#### Reference
- [Can someone explain SSH tunnel in a simple way?](https://stackoverflow.com/questions/5280827/can-someone-explain-ssh-tunnel-in-a-simple-way) | StackOverflow



## Access A Kubernetes Resource From A Remote Device Using A minikube Tunnel

https://minikube.sigs.k8s.io/docs/commands/tunnel/

https://stackoverflow.com/questions/61990418/unable-to-access-application-through-minikube-tunnel


Start the tunnel
```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ minikube tunnel
[sudo] password for tomrausch:
Sorry, try again.
[sudo] password for tomrausch:
Status:
        machine: minikube
        pid: 3750601
        route: 10.96.0.0/12 -> 192.168.49.2
        minikube: Running
        services: [hello-world, web]
    errors:
                minikube: no errors
                router: no errors
                loadbalancer emulator: no errors
```

```
