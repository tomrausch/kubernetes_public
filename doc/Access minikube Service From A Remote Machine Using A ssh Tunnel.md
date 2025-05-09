# Access A minikube Resource From A Remote Machine Using A ssh Tunnel

- Logon a local Windows device
- Open a SSH connection to the Linux device that hosts minikube/Kubernetes 
  - The IP address of the Linux device is the variable ```ip_address_kubernetes_host```

> [!NOTE]
> In this example, ```ip_address_kubernetes_service``` = "192.168.49.2"

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

- Identify the Kubernetes service one wants to access remotely
- Identify the internal Kubernetes PORT of this service
  - This PORT is the variable ```tcp_port_kubernetes_service```

> [!NOTE]
> In this example, the Kubernetes service is "it-tools"
>  
> In this example, ```tcp_port_kubernetes_service``` = "31239"

- Open a PowerShell prompt
- Run the command ```ssh <user_id_kubernetes_host>@<ip_address_kubernetes_host> -L <tcp_port_kubernetes_service>:<ip_address_kubernetes_service>:<tcp_port_local_windows>```

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

### References
- [access an http server as localhost from an external pc over ssh](https://serverfault.com/questions/1004529/access-an-http-server-as-localhost-from-an-external-pc-over-ssh) | [serverfault](https://serverfault.com/)
- [Which command is used to establish ssh tunnel in windows?](https://serverfault.com/questions/888693/which-command-is-used-to-establish-ssh-tunnel-in-windows) | [serverfault](https://serverfault.com/)


## Questions
- Also works for Ingress?
