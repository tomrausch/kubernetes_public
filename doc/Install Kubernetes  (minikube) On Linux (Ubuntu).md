# Install Kubernetes (minikube) On Linux (Ubuntu)

## Technology Stack
- Linux (Ubuntu)
- Docker
- Kubernetes (minikube)

## Uninstall The Existing Configuration

- [Uninstall Kubernetes (minikube) From Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/8396ae2f0a5f8cb3a735f6e381b08b46678c6728/doc/Uninstall%20Kubernetes%20(minikube)%20From%20Linux%20(Ubuntu).md)


## Prepare Linux System
### Prevent System From Hibernating Or Going To Sleep [^1]
```
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

### Disable Disk Swap File


- Reference
[ ]



## Install Kubernetes (minikube)

Download the minikube installation file
```
$ curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0
100  119M  100  119M    0     0  66.2M      0  0:00:01  0:00:01 --:--:--  104M
```

Install the minikube installation file
```
$ sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
```

Start minikube for the first time
```
$ minikube start
😄  minikube v1.35.0 on Ubuntu 24.04
✨  Using the docker driver based on existing profile
👍  Starting "minikube" primary control-plane node in "minikube" cluster
🚜  Pulling base image v0.0.46 ...
🤷  docker "minikube" container is missing, will recreate.
🔥  Creating docker container (CPUs=2, Memory=2200MB) ...
🐳  Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image docker.io/kubernetesui/dashboard:v2.7.0
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
    ▪ Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
    ▪ Using image registry.k8s.io/ingress-nginx/controller:v1.11.3
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
🔎  Verifying ingress addon...
💡  Some dashboard features require the metrics-server addon. To enable all features please run:

	minikube addons enable metrics-server

🌟  Enabled addons: storage-provisioner, default-storageclass, dashboard, ingress
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

Stop minikube
```
$ minikube stop
* Stopping node "minikube"  ...
* Powering off "minikube" via SSH ...
* 1 node stopped.
```

Restart minikube with one node
```
$ minikube start
* minikube v1.35.0 on Ubuntu 24.04
* Automatically selected the docker driver
* Using Docker driver with root privileges
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.46 ...
* Creating docker container (CPUs=2, Memory=2200MB) ...
* Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
  - Generating certificates and keys ...
  - Booting up control plane ...
  - Configuring RBAC rules ...
* Configuring bridge CNI (Container Networking Interface) ...
* Verifying Kubernetes components...
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
* Enabled addons: storage-provisioner, default-storageclass
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```

Restart minikube with two nodes
```
minikube start --nodes 2 -p multinode-demo
```


### Reference
- [Using Multi-Node Clusters](https://minikube.sigs.k8s.io/docs/tutorials/multi_node/)


## Verify The Kubernetes (minikube) Installation Is Successful 

Run the command  ```docker ps -a``` to observe the minikube container running under docker
```
$ docker ps -a
CONTAINER ID   IMAGE                                 COMMAND                  CREATED        STATUS                    PORTS                                                                                                                                  NAMES
1507fec77cd5   gcr.io/k8s-minikube/kicbase:v0.0.46   "/usr/local/bin/entr…"   6 days ago     Up 43 hours               127.0.0.1:32788->22/tcp, 127.0.0.1:32789->2376/tcp, 127.0.0.1:32790->5000/tcp, 127.0.0.1:32791->8443/tcp, 127.0.0.1:32792->32443/tcp   minikube
```

In the case of two ndoes, observe the two minikube containers running under docker
```
$ docker ps -a
CONTAINER ID   IMAGE                                 COMMAND                  CREATED             STATUS                           PORTS                                                                                                                                  NAMES
5bcd0618f30c   gcr.io/k8s-minikube/kicbase:v0.0.46   "/usr/local/bin/entr…"   About an hour ago   Up About an hour                 127.0.0.1:32778->22/tcp, 127.0.0.1:32779->2376/tcp, 127.0.0.1:32780->5000/tcp, 127.0.0.1:32781->8443/tcp, 127.0.0.1:32782->32443/tcp   multinode-demo-m02
69977e2f1e63   gcr.io/k8s-minikube/kicbase:v0.0.46   "/usr/local/bin/entr…"   About an hour ago   Up About an hour                 127.0.0.1:32773->22/tcp, 127.0.0.1:32774->2376/tcp, 127.0.0.1:32775->5000/tcp, 127.0.0.1:32776->8443/tcp, 127.0.0.1:32777->32443/tcp   multinode-demo
```

Run the command  ```kubectl version``` to determine the current version of the kubectl application
```
$ kubectl version
Client Version: v1.32.2
Kustomize Version: v5.5.0
Server Version: v1.32.2-gke.1182003
```

Run the command  ```kubectl config get-contexts``` to determine the current Context of the kubectl application
- Confirm the current context of the ```kubectl``` application is "minikube"
```bash
$ kubectl config get-contexts
CURRENT   NAME             CLUSTER          AUTHINFO         NAMESPACE
          docker-desktop   docker-desktop   docker-desktop
*         minikube         minikube         minikube         default
```

Run the command ```cat ~/.kube/config``` and inspect the contents of the minikube configuration file
- An explanation of the fields is at [Accessing a remote minikube from a local computer](https://faun.pub/accessing-a-remote-minikube-from-a-local-computer-fd6180dd66dd) | [FAUN — Developer Community](https://faun.pub/), [Medium](https://medium.com/)
```
$ cat ~/.kube/config
apiVersion: v1
clusters:
- cluster:
    certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJY2hLRDhlRTlYdzR3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBME1UWXhORFF3TWpCYUZ3MHpOVEEwTVRReE5EUXdNakJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUUROcTFHbzZ3QURMd0wvY1lWMUtFREtHbG1aOTFLNkNEa2orTjFWeEJicDNpR2kxQTcvMHRvakkxYU4KMXZmMTN1M0JYeStXMVVPeS8xYzl3anZLd0tLdzNPV2ljdm1aL1F5a1ZlWXF0azI3VEtkRldWU29GalFGemx3UQozRU03MjkyYWwxeHRqQ3I1UkZUdnQ5Wk5Ya0txdnJtS3B0QXd6Q2dIT1p2R2NsMkZWVnp6dmUrZUdQTS9tUThhCkZWVUtPeWovOXBvdmROb21zSkNWSUZzNnM0WVM4aWVyR3FOSm5PZ0doWTNtR1NZclRIdzlXK1kxNWNIb1hzdnYKN1QrL1V3SGxNMzMvSmNPc1BlTTRIUUNhcEhpTHJDcmpNNTJlMHc5UHJuQ1M5b0E5TDZWL2pkT3E3VUt3NXMrMgprZkJVRDd2WnEwZytxc3g4d3NuOWJrUTVBc0hkQWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJSTU9yZE1QQzJPYklqams1OFN4NmtScEhDNXJEQVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQ3NUTzF4dWYxTQp4WmE4cVJoMUV3SjFiMUgxV05ObkNMSmYxbXA2c3VmZkJsemIzcWk1bmdJMDF4dWM3R240dnA4dEVFSTJCV0NCCndVWnUyWmhBNjk2TjVKZ01qa01lNnpBdmpyWTVraDVaanZVRXFFWFlNTURuWnE3VkxJMEJnZlVocFdURkYzNFQKL21VQmkzK2tOQTZrcGJhclRtUWUycW5ieElWbTZ1amZIU2lwLzA2RDl1Z2hTZUlqNm85ZGdDNVk0WFUwTnBGWQpKWVZzdEdPSm5hUEQ1MWwzeGRzL25MMTZROXFETXFHMUdldlN3R0JBZkY1cXFPNFBuYXFzNU9oVjJSTGwzdXdvCnc3YzNjS3o4YUUwdklSbG5CQkg0OE83ZU1xZmdjNVNSMXI5VDRobWE1OFZnZXFsY0NEc1lHdzhmSjFxY1RhRWoKRENJR2xZSy9uam9BCi0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
    server: https://kubernetes.docker.internal:6443
  name: docker-desktop
- cluster:
    certificate-authority: /home/tomrausch/.minikube/ca.crt
    extensions:
    - extension:
        last-update: Thu, 08 May 2025 22:02:42 CDT
        provider: minikube.sigs.k8s.io
        version: v1.35.0
      name: cluster_info
    server: https://192.168.49.2:8443
  name: minikube
contexts:
- context:
    cluster: docker-desktop
    user: docker-desktop
  name: docker-desktop
- context:
    cluster: minikube
    extensions:
    - extension:
        last-update: Thu, 08 May 2025 22:02:42 CDT
        provider: minikube.sigs.k8s.io
        version: v1.35.0
      name: context_info
    namespace: default
    user: minikube
  name: minikube]
current-context: minikube
kind: Config
preferences: {}
users:
- name: docker-desktop
  user:
    client-certificate-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURRakNDQWlxZ0F3SUJBZ0lJVVpqMEhLVytET0V3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TlRBME1UWXhORFF3TWpCYUZ3MHlOakEwTVRZeE5EUXdNakJhTURZeApGekFWQmdOVkJBb1REbk41YzNSbGJUcHRZWE4wWlhKek1Sc3dHUVlEVlFRREV4SmtiMk5yWlhJdFptOXlMV1JsCmMydDBiM0F3Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLQW9JQkFRRE56TlNHbGZmN2kzK0wKWnVmUkI2aXdFL1V0cENRd2tvTjNkQnN4VUVFbk13ZzJoY1NockxFeDNQbG95aVYzRnViYXZ3eTAwbnVPcndYMwprT0JJdXBhSDBPbmlFNE90Qk5walBERy90SExwa3pkK1UvanV0TThrTzdTM2x1em5yRG1nYXIxdkllWWFtNnhYClRkWVRaNUdLWjN2ODlzeWhkK2xYMDhTTDdZdk83dGtnSU12V3ZWQm5IMmlnKzVvQk9rVmNtNkxVcG9DUFlvY3oKR0lYY2pmcE45RVdZU0hlVFQ3MGQ2NEduKzdtbmQxRndsVldFMkhuckdMdEVpWlRSL1hZT2RJeXA3T3paUmk0SwpMNU9hbjZ1Zi9KWTcvYWU2OWU2RngxdnU3ZkJMZkJvekFCbmI3U20zZGQ2bDlVNHkyK1d6dWR5dS9PeXJkT3ZkCldTUmt6RUNwQWdNQkFBR2pkVEJ6TUE0R0ExVWREd0VCL3dRRUF3SUZvREFUQmdOVkhTVUVEREFLQmdnckJnRUYKQlFjREFqQU1CZ05WSFJNQkFmOEVBakFBTUI4R0ExVWRJd1FZTUJhQUZFdzZ0MHc4TFk1c2lPT1RueExIcVJHawpjTG1zTUIwR0ExVWRFUVFXTUJTQ0VtUnZZMnRsY2kxbWIzSXRaR1Z6YTNSdmNEQU5CZ2txaGtpRzl3MEJBUXNGCkFBT0NBUUVBTDRiRW56QXhTM0ozV2locEtDam5LTnFYZ1UvUktyWnpiWVdJYW8vMjVQUHVURGd1UU1NQzhFd1UKb2VZUmI1bmQ4NUg5ZmJhOTFQdTEvUUdzVWMzMkdDdzBhWCsyY1hxQTRJZW10WFl3blFodkgvZml1Yks4QzRSWgowTUk5RGo2eFBkYUxnQysyVUFzemFCa1o4a0FnZUNTNzRqWXJFcndHendMMXc1dnpTck9maVJ6VmV0VkRoMys3ClExbUVrTFJqSkErZEJkZFlpQjRsMkJWOEkvWlEwSURFSWxNWThMelBJOHVxbXNmUTFNdVk1cUtoUURCV096MTcKejlqcE9EazU1ZE43SXA3OUFzWlJiZ1M0c01XdWhwRGI5amlVRHJIaFgxY0Y5SnZTUDRDS2hLejd6aVZlL0NzSgpRTldzaG1yVFpSOUFYWVhGUnJqbVR4eGdXZHM4elE9PQotLS0tLUVORCBDRVJUSUZJQ0FURS0tLS0tCg==
    client-key-data: LS0tLS1CRUdJTiBSU0EgUFJJVkFURSBLRVktLS0tLQpNSUlFcEFJQkFBS0NBUUVBemN6VWhwWDMrNHQvaTJibjBRZW9zQlAxTGFRa01KS0RkM1FiTVZCQkp6TUlOb1hFCm9heXhNZHo1YU1vbGR4Ym0ycjhNdE5KN2pxOEY5NURnU0xxV2g5RHA0aE9EclFUYVl6d3h2N1J5NlpNM2ZsUDQKN3JUUEpEdTB0NWJzNTZ3NW9HcTlieUhtR3B1c1YwM1dFMmVSaW1kNy9QYk1vWGZwVjlQRWkrMkx6dTdaSUNETAoxcjFRWng5b29QdWFBVHBGWEp1aTFLYUFqMktITXhpRjNJMzZUZlJGbUVoM2swKzlIZXVCcC91NXAzZFJjSlZWCmhOaDU2eGk3UkltVTBmMTJEblNNcWV6czJVWXVDaStUbXArcm4veVdPLzJudXZYdWhjZGI3dTN3UzN3YU13QVoKMiswcHQzWGVwZlZPTXR2bHM3bmNydnpzcTNUcjNWa2taTXhBcVFJREFRQUJBb0lCQUIrUmpRUThHdmNPRmZtSApSb1lNKzdaT3lXdy80b0ZFNkQrNW9yWTB6bG01L1VlSHkzclZaN1R6WlpyS2IyYk9MNGxjaHhGeHZCeE9Bc2RRCkJPZURIN1lqdU16Q0c0Kzl6OVlyRktLSWhwd0h4aHB0dlNDNHdaR1lTd2RpY21LelMzK3MvL1A5S2pQb3IwNFIKRllhU2U0UFVqZk5tMUVyc2Z2SEcvVDVOcVFXTDNYMDRadFVIeDR4YjFEY09xVmM0WVVsZ2hJWFBYYU1STjZNbQpua1Y3MHFNcDk2eHN0YW1LcEpwbk5ab0VYV3BZZmNRMk9GMU1UUFI5QXlVOFV1V1pueStNcEFzWXd0eWkwREh2CmczclpmSkZhbU4wc3FJRllIUndnTkxubmhrUTFQcXJSaThkanlSeUdJZnQ1L0ZFRzBPS1RDeDZycCtya1RzTEoKa0dOTWN5VUNnWUVBNW1Cam4vQmJ5N29nQ1IxR1Vqa0FOMVVuZGo0d2dPNzdaT1lkeWtMeEErSFRlQS9WSWdBVApCV0c3dThXUEJYOXE2Q2lXdHhCcjBuYmUzNFJOYklvTWVCV3RDMjN1YlVDekp6NDNhWVdsbzRxaDhsUGlZTWRlCm1odUxDYi81bzdJc2FiMFRENmJrRG94LzhRMjNmVkcwQjArTEw0VUk2cUJzNDJickUwTTVKNGNDZ1lFQTVMQ3EKbXl2TytrdVZqU0FSQzljb0NjSFdYckhRTHk4cDMyVUprWFBzSitBMU5GblFkU3U5VC8xSHJ6MkRqM0YzY0IwSgpFZ2NDZStPQ1VOVTB5MmwzTXNHbTVQelNBeFphdWtmZFBMMFNmaXM1YmFXQWowd3hsZHFoV0RjLzRBWFVpeWNiCk1WazdnNTRVOVFQVkFkS3dMMi9GVDFVZlFoTGVicG0zV2MvV0FrOENnWUVBdmJFQ2R6Q0h0V0dGZlZ2QWluVnEKNnlUUHdIb0dvRE9uaG5aQWMwblpnSFBURjFvYUNjdjczWU9TL0ZMNHAvTTV5UDJhMUJQT1pGY0N2eE1HV1dmMgpTbTYydE9HSTRDYlZIV3dLWG5Yd1pKQUROekRCQnlWQ2pTdyt1UUY5QWIvMDkvLzZrUG0vY1FkWlZkZ1FqVHpZCk91alJWNGg0UmhGZ2Q0Skg3KzE3UTBNQ2dZQXVENmROT2JXbWxESzdDZ3BrNkNFWVZnSm5jRWtPTitHbkxTS1EKT1ZrSGJ4RklTZzdDaXR6R2o2MHdqcU5BOFFtdGV5dW9oZURxTXhpOFR6VWpBMHNPM2hKUGJOeWY0cEREbEZYcgpOZW5UbjhFaFpJUlFXSGhrUm5UWTM4ZnR4ejdZQ0RoaDZDY2tpMktOTndoZ0paOTI3bncvVGxYTmFSK0VCMUgyCnRQWFY0UUtCZ1FDZzlaTWhySXY3d2pNZzVGYmVqNWQ0azQ4Q09xNmN4NFVuQ0NrR3hnbzMzeitMaTIvVk5wb0cKWGZQa3k4OFJJL3QzcUcrNDlBd2tKRDVwWVR5My80SC9uSStpdStOQUpoVTNmN3BvRUwyK3J5eDBEZURPdUZ1NgphTkpkdytHY0hEUkVDRE9BbUliMzdkWWFnY2RqMFVRL0VPaDNUVnNyVVhzL1RlN01HUVZRalE9PQotLS0tLUVORCBSU0EgUFJJVkFURSBLRVktLS0tLQo=
- name: minikube
  user:
    client-certificate: /home/tomrausch/.minikube/profiles/minikube/client.crt
    client-key: /home/tomrausch/.minikube/profiles/minikube/client.key
```

Run the command  ```minikube ssh``` to enter the shell of the minikube container

Run the command  ```ping host.minikube.internal -c 3``` and observe three responses
```
docker@minikube:~$ ping host.minikube.internal -c 3
PING host.minikube.internal (192.168.49.1) 56(84) bytes of data.
64 bytes from host.minikube.internal (192.168.49.1): icmp_seq=1 ttl=64 time=0.078 ms
64 bytes from host.minikube.internal (192.168.49.1): icmp_seq=2 ttl=64 time=0.061 ms
64 bytes from host.minikube.internal (192.168.49.1): icmp_seq=3 ttl=64 time=0.071 ms

--- host.minikube.internal ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2074ms
rtt min/avg/max/mdev = 0.061/0.070/0.078/0.007 ms
```

Run the command  ```docker ps -a``` to observe the kubernetes containers running in the minikube container
```
docker@minikube:~$ docker ps -a
CONTAINER ID   IMAGE                                                COMMAND                  CREATED        STATUS                      PORTS     NAMES
e084501d97e6   6e38f40d628d                                         "/storage-provisioner"   43 hours ago   Up 43 hours                           k8s_storage-provisioner_storage-provisioner_kube-system_a995879a-3cc2-465a-8d2f-31392ae83c34_5
d4f0069314be   07655ddf2eeb                                         "/dashboard --insecu…"   43 hours ago   Up 43 hours                           k8s_kubernetes-dashboard_kubernetes-dashboard-7779f9b69b-fprgj_kubernetes-dashboard_b3bb52d6-c980-459e-8216-2d4772f3a0ff_4
f4538e53210f   corentinth/it-tools                                  "/docker-entrypoint.…"   43 hours ago   Up 43 hours                           k8s_it-tools_it-tools-6f9bd54c48-lxhgh_default_2c367fdd-025a-4676-810c-b3e497606069_2
6de3c300a73e   ee44bc236803                                         "/usr/bin/dumb-init …"   43 hours ago   Up 43 hours                           k8s_controller_ingress-nginx-controller-56d7c84fd4-th555_ingress-nginx_0d7639bb-a963-46fc-ba5e-eb4a5b8028a9_2
b53dab05fc54   115053965e86                                         "/metrics-sidecar"       43 hours ago   Up 43 hours                           k8s_dashboard-metrics-scraper_dashboard-metrics-scraper-5d59dccf9b-tx6nx_kubernetes-dashboard_441b0ac1-647a-4b2b-8db3-59f8ecf86f3e_2
0c01a9b65e52   c69fa2e9cbf5                                         "/coredns -conf /etc…"   43 hours ago   Up 43 hours                           k8s_coredns_coredns-668d6bf9bc-fm6bj_kube-system_bbf6b422-5cf4-422c-a12b-77c94c3de619_2
4e92e4e264c3   154603634d2c                                         "/controller --port=…"   43 hours ago   Up 43 hours                           k8s_controller_controller-6dd74b674f-l9mct_metallb-system_d2cf3ec6-6703-4ef9-b717-1f0762dbdc45_2
1c20d6ca3dcb   98013f4df4dd                                         "/hello-app"             43 hours ago   Up 43 hours                           k8s_hello-app_web-75995f7dbf-88qxr_default_47a3a6df-16f8-49be-8e90-9fddd13f72a7_2
7edc8c5edc9c   07655ddf2eeb                                         "/dashboard --insecu…"   43 hours ago   Exited (2) 43 hours ago               k8s_kubernetes-dashboard_kubernetes-dashboard-7779f9b69b-fprgj_kubernetes-dashboard_b3bb52d6-c980-459e-8216-2d4772f3a0ff_3
45fb83a40ffe   a53c7068bb01                                         "./wrapper.sh"           43 hours ago   Up 43 hours                           k8s_hello-blue-whale_hello-blue-whale-dfc6c7c69-2wn8c_default_8a5c7502-af8a-409e-a4be-f1f4f6f8d312_2
645ca88b3603   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Up 43 hours                           k8s_bar-app_bar-app_default_75288fff-e5f6-40df-be2c-4da3f00a13c5_2
b2e83012de22   ed8aa6340f15                                         "/speaker --port=747…"   43 hours ago   Up 43 hours                           k8s_speaker_speaker-lr6rf_metallb-system_5faabe38-4d26-4bf8-bc2b-0bba4ae0d448_2
8be905022ce8   040f9f8aac8c                                         "/usr/local/bin/kube…"   43 hours ago   Up 43 hours                           k8s_kube-proxy_kube-proxy-bzwq8_kube-system_2e36e3cc-bb78-4345-b600-03c568218124_2
6fb1a5e407cc   1db936caa6ac                                         "/kuard"                 43 hours ago   Up 43 hours                           k8s_kuard-amd64_kuard-85648d5fdc-zz5sm_default_cd556930-155a-4eee-a330-bb5f739089d6_2
2b211dc89add   6e38f40d628d                                         "/storage-provisioner"   43 hours ago   Exited (1) 43 hours ago               k8s_storage-provisioner_storage-provisioner_kube-system_a995879a-3cc2-465a-8d2f-31392ae83c34_4
47f6cd7dadfa   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Up 43 hours                           k8s_foo-app_foo-app_default_6655d5ad-9b3f-48a3-947d-4ee056489ed0_2
3b22ce5d57e0   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Up 43 hours                           k8s_echo-server_hello-minikube-ffcbb5874-mmwnk_default_efc1bcd3-fa8f-4078-92fb-ef150aba19b3_2
ce359419aac1   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_web-75995f7dbf-88qxr_default_47a3a6df-16f8-49be-8e90-9fddd13f72a7_2
46380109c6b6   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_it-tools-6f9bd54c48-lxhgh_default_2c367fdd-025a-4676-810c-b3e497606069_2
b88d14f22b65   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_hello-blue-whale-dfc6c7c69-2wn8c_default_8a5c7502-af8a-409e-a4be-f1f4f6f8d312_2
f7c8801e4859   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_ingress-nginx-controller-56d7c84fd4-th555_ingress-nginx_0d7639bb-a963-46fc-ba5e-eb4a5b8028a9_2
a48d020d865e   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_dashboard-metrics-scraper-5d59dccf9b-tx6nx_kubernetes-dashboard_441b0ac1-647a-4b2b-8db3-59f8ecf86f3e_2
fc7d0ba09f43   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kubernetes-dashboard-7779f9b69b-fprgj_kubernetes-dashboard_b3bb52d6-c980-459e-8216-2d4772f3a0ff_2
c5f6ef6652e1   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_controller-6dd74b674f-l9mct_metallb-system_d2cf3ec6-6703-4ef9-b717-1f0762dbdc45_2
0457b4671463   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_coredns-668d6bf9bc-fm6bj_kube-system_bbf6b422-5cf4-422c-a12b-77c94c3de619_2
0bf1102fe9cf   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_speaker-lr6rf_metallb-system_5faabe38-4d26-4bf8-bc2b-0bba4ae0d448_2
5906bcb02934   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kube-proxy-bzwq8_kube-system_2e36e3cc-bb78-4345-b600-03c568218124_2
59205021a105   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_storage-provisioner_kube-system_a995879a-3cc2-465a-8d2f-31392ae83c34_2
814bb1d3b251   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_bar-app_default_75288fff-e5f6-40df-be2c-4da3f00a13c5_2
5766395bf904   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_foo-app_default_6655d5ad-9b3f-48a3-947d-4ee056489ed0_2
4f03edc093a3   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_hello-minikube-ffcbb5874-mmwnk_default_efc1bcd3-fa8f-4078-92fb-ef150aba19b3_2
7b100d973d5c   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kuard-85648d5fdc-zz5sm_default_cd556930-155a-4eee-a330-bb5f739089d6_2
eec7539951ea   c2e17b8d0f4a                                         "kube-apiserver --ad…"   43 hours ago   Up 43 hours                           k8s_kube-apiserver_kube-apiserver-minikube_kube-system_d72d0a4cf4be077c9919d46b7358a5e8_2
90ce8ee850cb   a389e107f4ff                                         "kube-scheduler --au…"   43 hours ago   Up 43 hours                           k8s_kube-scheduler_kube-scheduler-minikube_kube-system_d14ce008bee3a1f3bd7cf547688f9dfe_2
789d8e397afa   a9e7e6b294ba                                         "etcd --advertise-cl…"   43 hours ago   Up 43 hours                           k8s_etcd_etcd-minikube_kube-system_2b4b75c2a289008e0b381891e9683040_2
bedf34947024   8cab3d2a8bd0                                         "kube-controller-man…"   43 hours ago   Up 43 hours                           k8s_kube-controller-manager_kube-controller-manager-minikube_kube-system_843c74f7b3bc7d7040a05c31708a6a30_2
3f3d7a45c209   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kube-apiserver-minikube_kube-system_d72d0a4cf4be077c9919d46b7358a5e8_2
f31867488a77   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kube-scheduler-minikube_kube-system_d14ce008bee3a1f3bd7cf547688f9dfe_2
c6d4b062841b   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_etcd-minikube_kube-system_2b4b75c2a289008e0b381891e9683040_2
e7facaee53d1   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Up 43 hours                           k8s_POD_kube-controller-manager-minikube_kube-system_843c74f7b3bc7d7040a05c31708a6a30_2
9d73974a213c   corentinth/it-tools                                  "/docker-entrypoint.…"   43 hours ago   Exited (0) 43 hours ago               k8s_it-tools_it-tools-6f9bd54c48-lxhgh_default_2c367fdd-025a-4676-810c-b3e497606069_1
118eb9b91e64   154603634d2c                                         "/controller --port=…"   43 hours ago   Exited (2) 43 hours ago               k8s_controller_controller-6dd74b674f-l9mct_metallb-system_d2cf3ec6-6703-4ef9-b717-1f0762dbdc45_1
6b3101f7fb08   ee44bc236803                                         "/usr/bin/dumb-init …"   43 hours ago   Exited (1) 43 hours ago               k8s_controller_ingress-nginx-controller-56d7c84fd4-th555_ingress-nginx_0d7639bb-a963-46fc-ba5e-eb4a5b8028a9_1
71672a70131e   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Exited (2) 43 hours ago               k8s_bar-app_bar-app_default_75288fff-e5f6-40df-be2c-4da3f00a13c5_1
acd4933161f5   98013f4df4dd                                         "/hello-app"             43 hours ago   Exited (2) 43 hours ago               k8s_hello-app_web-75995f7dbf-88qxr_default_47a3a6df-16f8-49be-8e90-9fddd13f72a7_1
a1af7d13dc19   1db936caa6ac                                         "/kuard"                 43 hours ago   Exited (2) 43 hours ago               k8s_kuard-amd64_kuard-85648d5fdc-zz5sm_default_cd556930-155a-4eee-a330-bb5f739089d6_1
fbf64be8a6a0   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Exited (2) 43 hours ago               k8s_foo-app_foo-app_default_6655d5ad-9b3f-48a3-947d-4ee056489ed0_1
ca110b8f1d68   9056ab77afb8                                         "/bin/echo-server"       43 hours ago   Exited (2) 43 hours ago               k8s_echo-server_hello-minikube-ffcbb5874-mmwnk_default_efc1bcd3-fa8f-4078-92fb-ef150aba19b3_1
2e8fc1c5aeb7   115053965e86                                         "/metrics-sidecar"       43 hours ago   Exited (2) 43 hours ago               k8s_dashboard-metrics-scraper_dashboard-metrics-scraper-5d59dccf9b-tx6nx_kubernetes-dashboard_441b0ac1-647a-4b2b-8db3-59f8ecf86f3e_1
ffcd6906c8fe   a53c7068bb01                                         "./wrapper.sh"           43 hours ago   Exited (0) 43 hours ago               k8s_hello-blue-whale_hello-blue-whale-dfc6c7c69-2wn8c_default_8a5c7502-af8a-409e-a4be-f1f4f6f8d312_1
dcba39bf0335   c69fa2e9cbf5                                         "/coredns -conf /etc…"   43 hours ago   Exited (0) 43 hours ago               k8s_coredns_coredns-668d6bf9bc-fm6bj_kube-system_bbf6b422-5cf4-422c-a12b-77c94c3de619_1
61bb40cf4569   ed8aa6340f15                                         "/speaker --port=747…"   43 hours ago   Exited (0) 43 hours ago               k8s_speaker_speaker-lr6rf_metallb-system_5faabe38-4d26-4bf8-bc2b-0bba4ae0d448_1
5b69e2c33fef   040f9f8aac8c                                         "/usr/local/bin/kube…"   43 hours ago   Exited (2) 43 hours ago               k8s_kube-proxy_kube-proxy-bzwq8_kube-system_2e36e3cc-bb78-4345-b600-03c568218124_1
c33497b2f6e9   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_kuard-85648d5fdc-zz5sm_default_cd556930-155a-4eee-a330-bb5f739089d6_1
ad9c2d3cd41c   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_foo-app_default_6655d5ad-9b3f-48a3-947d-4ee056489ed0_1
35e2aec31f72   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_web-75995f7dbf-88qxr_default_47a3a6df-16f8-49be-8e90-9fddd13f72a7_1
abde04c231ca   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_controller-6dd74b674f-l9mct_metallb-system_d2cf3ec6-6703-4ef9-b717-1f0762dbdc45_1
fe16e48a0a3f   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_bar-app_default_75288fff-e5f6-40df-be2c-4da3f00a13c5_1
917f35ca2e11   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_ingress-nginx-controller-56d7c84fd4-th555_ingress-nginx_0d7639bb-a963-46fc-ba5e-eb4a5b8028a9_1
aac158004cf6   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_hello-minikube-ffcbb5874-mmwnk_default_efc1bcd3-fa8f-4078-92fb-ef150aba19b3_1
65d9f1dabd38   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_it-tools-6f9bd54c48-lxhgh_default_2c367fdd-025a-4676-810c-b3e497606069_1
fbd16294e99d   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_hello-blue-whale-dfc6c7c69-2wn8c_default_8a5c7502-af8a-409e-a4be-f1f4f6f8d312_1
ea7682fbfefe   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_coredns-668d6bf9bc-fm6bj_kube-system_bbf6b422-5cf4-422c-a12b-77c94c3de619_1
5ec91e463e7f   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_dashboard-metrics-scraper-5d59dccf9b-tx6nx_kubernetes-dashboard_441b0ac1-647a-4b2b-8db3-59f8ecf86f3e_1
ee9a7fd7efee   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_kube-proxy-bzwq8_kube-system_2e36e3cc-bb78-4345-b600-03c568218124_1
22b97ed72875   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_speaker-lr6rf_metallb-system_5faabe38-4d26-4bf8-bc2b-0bba4ae0d448_1
30a4b90d6ba2   a389e107f4ff                                         "kube-scheduler --au…"   43 hours ago   Exited (1) 43 hours ago               k8s_kube-scheduler_kube-scheduler-minikube_kube-system_d14ce008bee3a1f3bd7cf547688f9dfe_1
bd73ed3da6e7   c2e17b8d0f4a                                         "kube-apiserver --ad…"   43 hours ago   Exited (137) 43 hours ago             k8s_kube-apiserver_kube-apiserver-minikube_kube-system_d72d0a4cf4be077c9919d46b7358a5e8_1
e7d9ffa8e353   a9e7e6b294ba                                         "etcd --advertise-cl…"   43 hours ago   Exited (0) 43 hours ago               k8s_etcd_etcd-minikube_kube-system_2b4b75c2a289008e0b381891e9683040_1
1268c3ea7405   8cab3d2a8bd0                                         "kube-controller-man…"   43 hours ago   Exited (2) 43 hours ago               k8s_kube-controller-manager_kube-controller-manager-minikube_kube-system_843c74f7b3bc7d7040a05c31708a6a30_1
c05aa6fbe75b   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_kube-scheduler-minikube_kube-system_d14ce008bee3a1f3bd7cf547688f9dfe_1
d90b615045a3   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_kube-apiserver-minikube_kube-system_d72d0a4cf4be077c9919d46b7358a5e8_1
e0dddb5a6b00   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_kube-controller-manager-minikube_kube-system_843c74f7b3bc7d7040a05c31708a6a30_1
f74ebd463641   registry.k8s.io/pause:3.10                           "/pause"                 43 hours ago   Exited (0) 43 hours ago               k8s_POD_etcd-minikube_kube-system_2b4b75c2a289008e0b381891e9683040_1
76c85b651e47   a62eeff05ba5                                         "/kube-webhook-certg…"   6 days ago     Exited (0) 6 days ago                 k8s_patch_ingress-nginx-admission-patch-pqmb6_ingress-nginx_aefdbe4d-9073-4568-85be-7dc5fa1ddee1_1
76b169be8c4c   registry.k8s.io/ingress-nginx/kube-webhook-certgen   "/kube-webhook-certg…"   6 days ago     Exited (0) 6 days ago                 k8s_create_ingress-nginx-admission-create-gpgxf_ingress-nginx_217b5c30-c39e-4758-b703-9ea03638502c_0
0f0371742d9e   registry.k8s.io/pause:3.10                           "/pause"                 6 days ago     Exited (0) 6 days ago                 k8s_POD_ingress-nginx-admission-create-gpgxf_ingress-nginx_217b5c30-c39e-4758-b703-9ea03638502c_0
2da1ca65c200   registry.k8s.io/pause:3.10                           "/pause"                 6 days ago     Exited (0) 6 days ago                 k8s_POD_ingress-nginx-admission-patch-pqmb6_ingress-nginx_aefdbe4d-9073-4568-85be-7dc5fa1ddee1_0
```

Run the command  ```exit``` to exit the shell of the minikube container


## Configure minikube

### Enable The minikube Addon 'Dashboard'
Run the command  ```minikube addons enable dashboard``` to enable the minikube addon 'Dashboard' 
```bash
$ minikube addons enable dashboard
* dashboard is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* The 'dashboard' addon is enabled
```

Run the command ```kubectl get services --namespace kubernetes-dashboard``` and observe the two Services in namespace "kubernetes-dashboard"
```bash
$ kubectl get services --namespace kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
dashboard-metrics-scraper   ClusterIP   10.105.143.242   <none>        8000/TCP   21d
kubernetes-dashboard        ClusterIP   10.106.62.124    <none>        80/TCP     21d
```

### Enable The minikube Addon 'Metrics Server'
Run the command  ```minikube addons enable metrics-server``` to enable the minikube addon 'Metrics Server' 
```bash
$ minikube addons enable metrics-server
* metrics-server is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
* The 'metrics-server' addon is enabled
```

### Enable The minikube Addon 'Ingress'
The addon 'ingress' enables the Ingress controller

Run the command  ```minikube addons enable ingress``` to enable the minikube addon 'Ingress' 
```bash
$ minikube addons enable ingress
💡  ingress is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
    ▪ Using image registry.k8s.io/ingress-nginx/controller:v1.11.3
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
    ▪ Using image registry.k8s.io/ingress-nginx/kube-webhook-certgen:v1.4.4
🔎  Verifying ingress addon...
🌟  The 'ingress' addon is enabled
```

Run the command ```kubectl get pods -n ingress-nginx``` and observe the two Services in namespace "ingress-nginx"
```
$ kubectl get pods -n ingress-nginx
NAME                                        READY   STATUS      RESTARTS   AGE
ingress-nginx-admission-create-gpgxf        0/1     Completed   0          22d
ingress-nginx-admission-patch-pqmb6         0/1     Completed   1          22d
ingress-nginx-controller-56d7c84fd4-2bkg7   1/1     Running     0          8h
```

Run the command ```kubectl get services --namespace ingress-nginx``` and observe the two Services in namespace "ingress-nginx"
```bash
$ kubectl get services --namespace ingress-nginx
NAME                                 TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                      AGE
ingress-nginx-controller             NodePort    10.106.88.221   <none>        80:30872/TCP,443:32709/TCP   21d
ingress-nginx-controller-admission   ClusterIP   10.102.153.72   <none>        443/TCP                      21d
```

### Enable The minikube Addon 'ingress-dns'
Run the command ```minikube addons enable ingress-dns``` to enable the minikube addon 'ingress-dns' 
```bash
$ minikube addons enable ingress-dns
* ingress-dns is an addon maintained by minikube. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image gcr.io/k8s-minikube/minikube-ingress-dns:0.0.3
* The 'ingress-dns' addon is enabled
```

### Enable The minikube Addon 'metallb'
Run the command ```minikube addons enable metallb``` to enable the minikube addon 'metallb'
```bash
$ minikube addons enable metallb
! metallb is a 3rd party addon and is not maintained or verified by minikube maintainers, enable at your own risk.
! metallb does not currently have an associated maintainer.
  - Using image quay.io/metallb/controller:v0.9.6
  - Using image quay.io/metallb/speaker:v0.9.6
* The 'metallb' addon is enabled
```

### Create The Ingress

Run the command ```kubectl app;y -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ingress/ingress-namespace-default.yaml``` to create the Ingress

Run the command ```kubectl get ingress --namespace --all-namespaces``` and observe the Ingress
```bash
$ kubectl get services --namespace ingress-nginx
NAMESPACE   NAME                        CLASS   HOSTS   ADDRESS        PORTS   AGE
default     ingress-namespace-default   nginx   *       192.168.49.2   80      9m
```

Run the command ```kubectl get ingress ingress-namespace-default -o yaml``` and observe the Ingress
```bash
$ kubectl get ingress ingress-namespace-default -o yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  annotations:
    kubectl.kubernetes.io/last-applied-configuration: |
      {"apiVersion":"networking.k8s.io/v1","kind":"Ingress","metadata":{"annotations":{},"name":"ingress-namespace-default","namespace":"default"},"spec":{"ingressClassName":"nginx","rules":[{"http":{"paths":[{"backend":{"service":{"name":"hello-minikube","port":{"number":8080}}},"path":"/hello-minikube","pathType":"Prefix"},{"backend":{"service":{"name":"hello-blue-whale","port":{"number":80}}},"path":"/hello-blue-whale","pathType":"Prefix"},{"backend":{"service":{"name":"hello-minikube","port":{"number":8080}}},"path":"/hello-minikube","pathType":"Prefix"},{"backend":{"service":{"name":"hello-world","port":{"number":80}}},"path":"/hello-world","pathType":"Prefix"},{"backend":{"service":{"name":"it-tools","port":{"number":80}}},"path":"/it-tools","pathType":"Prefix"},{"backend":{"service":{"name":"kuard","port":{"number":8080}}},"path":"/kuard","pathType":"Prefix"},{"backend":{"service":{"name":"foo-service","port":{"number":8080}}},"path":"/foo","pathType":"Prefix"},{"backend":{"service":{"name":"bar-service","port":{"number":8080}}},"path":"/bar","pathType":"Prefix"},{"backend":{"service":{"name":"web","port":{"number":8080}}},"path":"/web","pathType":"Prefix"}]}}]},"status":{"loadBalancer":{"ingress":[{"ip":"192.168.49.2"}]}}}
  creationTimestamp: "2025-05-25T19:50:25Z"
  generation: 1
  name: ingress-namespace-default
  namespace: default
  resourceVersion: "1629085"
  uid: 8464f1d1-4213-4e2e-b52a-d48953ada7eb
spec:
  ingressClassName: nginx
  rules:
  - http:
      paths:
      - backend:
          service:
            name: hello-minikube
            port:
              number: 8080
        path: /hello-minikube
        pathType: Prefix
      - backend:
          service:
            name: hello-blue-whale
            port:
              number: 80
        path: /hello-blue-whale
        pathType: Prefix
      - backend:
          service:
            name: hello-minikube
            port:
              number: 8080
        path: /hello-minikube
        pathType: Prefix
      - backend:
          service:
            name: hello-world
            port:
              number: 80
        path: /hello-world
        pathType: Prefix
      - backend:
          service:
            name: it-tools
            port:
              number: 80
        path: /it-tools
        pathType: Prefix
      - backend:
          service:
            name: kuard
            port:
              number: 8080
        path: /kuard
        pathType: Prefix
      - backend:
          service:
            name: foo-service
            port:
              number: 8080
        path: /foo
        pathType: Prefix
      - backend:
          service:
            name: bar-service
            port:
              number: 8080
        path: /bar
        pathType: Prefix
      - backend:
          service:
            name: web
            port:
              number: 8080
        path: /web
        pathType: Prefix
status:
  loadBalancer:
    ingress:
    - ip: 192.168.49.2
```

## References
- [Accessing apps](https://minikube.sigs.k8s.io/docs/handbook/accessing/) | [minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Ingress DNS](https://minikube.sigs.k8s.io/docs/handbook/addons/ingress-dns/#Linux) | [minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Set up Ingress on Minikube with the NGINX Ingress Controller](https://kubernetes.io/docs/tasks/access-application-cluster/ingress-minikube/) | Kubernetes
- [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) | [minikube Documentation](https://minikube.sigs.k8s.io/docs/)
- [Accessing a remote minikube from a local computer](https://faun.pub/accessing-a-remote-minikube-from-a-local-computer-fd6180dd66dd) | [FAUN — Developer Community](https://faun.pub/), [Medium](https://medium.com/)
- [Goodbye Docker Desktop, Hello Minikube!](https://medium.com/itnext/goodbye-docker-desktop-hello-minikube-3649f2a1c469) | [ITNEXT](https://itnext.io/), [Medium](https://medium.com/)
- https://github.com/kubernetes/minikube/issues/14346


[^1]: [How do I disable my system from going to sleep?](https://askubuntu.com/questions/47311/how-do-i-disable-my-system-from-going-to-sleep)
