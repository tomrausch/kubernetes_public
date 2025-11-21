## Understand Topics on Examination

### Storage (10%)
- 🔳 Implement storage classes and dynamic volume provisioning
  - Local volumes do not support dynamic provisioning in Kubernetes 1.34;
- 🔳 Configure volume types, access modes and reclaim policies
- 🔳 Manage persistent volumes and persistent volume claims

### Troubleshooting 30%
- 🔳 Troubleshoot clusters and nodes
- 🔳 Troubleshoot cluster components
- 🔳 Monitor cluster and application resource usage
- 🔳 Manage and evaluate container output streams
- 🔳 Troubleshoot services and networking

### Workloads & Scheduling 15%
- 🔳 Understand application deployments and how to perform rolling update and rollbacks
- 🔳 Use ConfigMaps and Secrets to configure applications
- 🔳 Configure workload autoscaling
  - ✅ HPA
  - [ ] VPA
- 🔳 Understand the primitives used to create robust, self-healing, application deployments
- 🔳 Configure Pod admission and scheduling (limits, node affinity, etc.)

### Cluster Architecture, Installation & Configuration25%
- 🔳 Manage role based access control (RBAC)
- 🔳 Prepare underlying infrastructure for installing a Kubernetes cluster
- 🔳 Create and manage Kubernetes clusters using kubeadm
- 🔳 Manage the lifecycle of Kubernetes clusters
- 🔳 Implement and configure a highly-available control plane
- 🔳 Use Helm and Kustomize to install cluster components
- 🔳 Understand extension interfaces (CNI, CSI, CRI, etc.)
- 🔳 Understand CRDs, install and configure operators

### Services & Networking 20%
- 🔳 Understand connectivity between Pods
- 🔳 Define and enforce Network Policies
- 🔳 Use ClusterIP, NodePort, LoadBalancer service types and endpoints
- 🔳 Use the Gateway API to manage Ingress traffic
- 🔳 Know how to use Ingress controllers and Ingress resources
- 🔳 Understand and use CoreDNS

### Some topics that you could get on the exam😉
- 🔳 ETCD Database Backup & Restore
```
$ cat


$ sudo ETCDCTL_API=3 etcdctl --endpoints 192.168.0.136:2379 --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt  member list
e0d3b20a8228bff8, started, master-node, https://192.168.0.136:2380, https://192.168.0.136:2379, false

$ sudo etcdutl --write-out=table snapshot status $HOME/snapshot.db
+----------+----------+------------+------------+
|   HASH   | REVISION | TOTAL KEYS | TOTAL SIZE |
+----------+----------+------------+------------+
| 195c9523 | 17732977 |       2030 |      12 MB |
+----------+----------+------------+------------+

kubectl get pods -A -n kube-system
sudo systemctl stop etcd.service
sudo ETCDCTL_API=3 etcdctl --endpoints 10.2.0.9:2379 --data-dir=/var/lib/etcd-backup snapshot restore snapshot.db

chown -R etcd:etcd /var/lib/etcd-backup
sudo systemctl start etcd.service

change the path to /var/lib/etcd to /var/lib/etcd-backup in etcd.yaml
cd /etc/kubernetes/manifests
sed -i 's=var/lib/etcd/=/var/lib/etcd-backup' etcd.yaml

etcd pod gonna restart and it should be up in running mode. I hope this could be the answer for the restore. if any corrections/changes lemme know
```
 
- 🔳 Kubeadm upgrade task
- 🔳 Kubelet configuration and logging ( Tip: /var/lib/kubelet/config.yaml)
- 🔳 Default containers and pods logging location (/var/log/…)
- 🔳 RBAC
- 🔳 Kustomize
- 🔳 Gateway API (Ingress potential replacement)
- 🔳 CNI (cilium and flannel installation)
- 🔳 Helm: Installing, upgrading and deleting chart releases
- 🔳 Static pod (/etc/kubernetes/manifests)
```
$ sudo ls -l /etc/kubernetes/manifests
	-rw------- 1 root root 2591 Oct 19 15:49 etcd.yaml
	-rw------- 1 root root 3943 Nov 15 00:00 kube-apiserver.yaml
	-rw------- 1 root root 3458 Oct 19 15:49 kube-controller-manager.yaml
	-rw------- 1 root root 1725 Oct 19 15:49 kube-scheduler.yaml
```
- 🔳 Requestes and Limits on Containers
- 🔳 Network Policies
- 🔳 PVC and Storage classes management


- 🔳 [CKA Exam](https://youtube.com/playlist?list=PLi0QOhIwpoFqFimUI-kpaPhAvF7K1TPJ-&si=Of7Jb2LHV8BFAoo3) 48 Videos
- 🔳 [CKA 2025](https://youtube.com/playlist?list=PLvOcEsRqg0tIiE6GOdvqQFOq2lKYpZDfG&si=jA54oQgkdn7RhQ_a) 15 Videos
- 🔳 [How to Setup a 3 Node Kubernetes Cluster for CKA Step by Step | K21Academy](https://www.youtube.com/watch?v=gsQFa3bIHE0) 34:54
  - Presented so you can build your own three-node cluster for practice
- 🔳 [Mastering Kubernetes Gateway API: A Comprehensive Guide with Tutorial](https://youtu.be/HLXyrQT8zV0) 34:50
- 🔳 [2025 CKA Exam Questions & Solutions UPDATE! | Full Walkthrough!](https://www.youtube.com/watch?v=eGv6iPWQKyo) 46:40
- 🔳 [Kubernetes Scheduler | How it Works](https://youtu.be/6p1XcgsFHsU) 16:57
- 🔳 [Troubleshooting Pods: CKA Questions & Kubernetes Basics - Part 1 | 2025 Prep](https://youtu.be/YXLpLyWGar4) 15:17
- 🔳 [How I passed the Certified Kubernetes Administrator (CKA) Exam in 2025](https://youtu.be/dHXgg9fbP8E) 14:48
- 🔳 [What is Helm in Kubernetes? Helm and Helm Charts explained | Kubernetes Tutorial 23](https://youtu.be/-ykwb1d0DXU) 14:15
- 🔳 [CKA Exam Tips: How To Crack The Exam In 2023 | Certified Kubernetes Administrator | KodeKloud](https://youtu.be/8LJibrSurKA?si=soiO2hx6_0P-oNah) 10:22
- 🔳 [Kubernetes Storage Full Guide 2025 | PV, PVC, StorageClass, Dynamic Provisioning, CKA Must-Know](https://www.youtube.com/watch?v=Aovnq3iduzw) 8:15
- 🔳 [For CKA CKAD and CKS Exam | Kubernetes Cluster Setup | Practice Questions | On Windows](https://youtu.be/SEQ_AueLUGs) 7:27
- 🔳 Taints And Tolerations
- ✅ [10 Mistakes that will RUIN Your CKA/CKAD Score!](https://youtu.be/jWs1_TfPQoQ) 8:10

## Day Of Examination
- Open Quick Reference https://kubernetes.io/docs/reference/kubectl/quick-reference/
  - https://www.youtube.com/watch?v=fy8v6nkA-Bc

https://youtu.be/rP-W3Tv3plw?si=VeG-U0d-I3DmS5yf
[2025 CKA Exam Questions & Solutions UPDATE! | Full Walkthrough!](https://www.youtube.com/watch?v=eGv6iPWQKyo)
- Create PersistentVolumeClaim, PersistentVolume already created via Dynamic Volume Provisioning
- Security Standards
  - Cannot Have
    - Privileged access
    - Host Networking
    - Elevated Rights


```

```


```
To view pod CPU usage in Kubernetes, the Kubernetes Metrics Server must be installed and running in your cluster. Once the Metrics Server is deployed, you can use the kubectl top command-line tool.

Here are the commands to show pod CPU usage:

To view CPU usage for all pods in a specific namespace:

Code

kubectl top pods -n <namespace-name>

Replace <namespace-name> with the actual namespace where your pods reside.

To view CPU usage for a specific pod:

Code

kubectl top pod <pod-name> -n <namespace-name>

Replace <pod-name> with the name of the pod and <namespace-name> with its namespace.

To view CPU usage for all containers within a specific pod:

Code

kubectl top pod <pod-name> --containers -n <namespace-name>

This command provides a breakdown of CPU usage for each container running inside the specified pod.

To view CPU usage for all pods across all namespaces:

Code

kubectl top pods --all-namespaces

This provides a comprehensive overview of CPU usage for all pods in the entire cluster.

Note: The output of kubectl top displays CPU usage in "m" (millicores), where 1000m equals 1 CPU core.

Dive deeper in AI Mode
```


```
user9074332, Yes you need metrics server installed first. You can do so by executing following commands: wget https://raw.githubusercontent.com/pythianarora/total-practice/master/sample-kubernetes-code/metrics-server.yaml kubectl create -f metrics-server.yaml
```



## Exercises
- 🔳 Run [CKA Simulator](https://killer.sh/)
- 🔳 Complete Examples in [Killercoda Interactive Environments](https://killercoda.com/) | Killercoda
- 🔳 Complete [Scenarios for the Certified Kubernetes Administrator](https://killercoda.com/cka) | Killercoda
	- Kim Wüstkamp (20 Scenarios)
 	- Chad M. Crowell (40 Scenarios)
  	- Sachin H R (70 Scenarios)
  	- Alexis Carbillet (10 Scenarios)

- [ ] [API Server Misconfigured](https://killercoda.com/killer-shell-cka/...)
- [ ] [Kube Controller Manager Misconfigured](https://killercoda.com/killer-shell-cka/...)
- [ ] [Kubelet Misconfigured](https://killercoda.com/killer-shell-cka/...)
- [ ] [Application Misconfigured 1](https://killercoda.com/killer-shell-cka/...)
- [ ] [Application Misconfigured 2](https://killercoda.com/killer-shell-cka/...)
- [ ] [Application Multi-Container Issue](https://killercoda.com/killer-shell-cka/...)
- [ ] [Config Map Access in Pods](https://killercoda.com/killer-shell-cka/...)
- [ ] [Ingress Create](https://killercoda.com/killer-shell-cka/...)
- [ ] [Network Policy Namespace Selector](https://killercoda.com/killer-shell-cka/...)
- [ ] [Network Policy Misconfigured](https://killercoda.com/killer-shell-cka/...)
- [ ] [RBAC Service Account Permissions](https://killercoda.com/killer-shell-cka/...)
- [ ] [RBAC User Permissions](https://killercoda.com/killer-shell-cka/...)
- [ ] [Scheduling Priority](https://killercoda.com/killer-shell-cka/...)
- [ ] [Scheduling Pod Affinity](https://killercoda.com/killer-shell-cka/...)
- [ ] [Scheduling Pod AnitAffinity](https://killercoda.com/killer-shell-cka/...)
- [ ] [Daemon Set Host Path Configurator](https://killercoda.com/killer-shell-cka/...)
- [ ] [Cluster Setup](https://killercoda.com/killer-shell-cka/...)
- [ ] [Cluster Upgrade](https://killercoda.com/killer-shell-cka/...)
- [ ] [Cluster Node Join](https://killercoda.com/killer-shell-cka/...)
- [ ] [Cluster Certificate Management](https://killercoda.com/killer-shell-cka/...)
- [ ] [Static Pod Move](https://killercoda.com/killer-shell-cka/...)




- 🔳 Complete [Exam Simulator](https://trainingportal.linuxfoundation.org/learn/course/certified-kubernetes-administrator-cka/exam/exam)



## Cluster
- [ ] Procedure to setup kubernetes
- [ ] HorizontalPodAutoscaler
- [ ] VerticalPodAutoscaler
- [ ] Setup Deployment
- [ ] Setup MySQL Database
  - [ ] Where is Persistent Volume .img file?
- [ ] Understand Core DNS
- [ ] Understand toleration
- [ ] Understand taints
- [ ] Understand egress
- [ ] Setup egress
- [X] Understand Network Policy
  - [ ] Block all traffic
  - [ ] Allow traffic to applications
  - [ ] Setup busybox to test networking
- [ ] Understand Replica Sets
- [ ] Understand Stateful Sets
- [ ] Jobs
  - [Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)
- [ ] --output=jsonpath='{.items[*].metadata.name}')
  - [Jobs](https://kubernetes.io/docs/concepts/workloads/controllers/job/)
- [ ] Understand Cron Jobs
- [ ] Kubernetes annotations
- [ ] iptables
- [ ] Scheduling - Node Affinity, Pod Affinity
- [X] Adjust image in Deployment
  - [X] Update Deployment With New Image

KillerCoda
- [X] [API Server Crash](https://killercoda.com/killer-shell-cka/scenario/apiserver-crash)

Log Locations
- /var/log/pods
- /var/log/containers
- crictl ps + crictl logs
- docker ps + docker logs (in case when Docker is used)
- kubelet logs: /var/log/syslog or journalctl



```
calico-kube-controllers   7                   3729037522361       calico-kube-controllers-7bb4
kube-apiserver            0                   2c67f6e224215       kube-apiserver-controlplane
kube-controller-manager   2                   235d36325b72a       kube-controller-manager-cont
kube-scheduler            2                   ca4a7fc88a6e4       kube-scheduler-controlplane
coredns                   1                   a2bc98e02c267       coredns-76bb9b6fb5-zmkq2
coredns                   1                   304f5dbc9e154       coredns-76bb9b6fb5-cz7dl
local-path-provisioner    1                   84708530e5558       local-path-provisioner-76f88
kube-flannel              1                   2fea0b9e44a58       canal-rgkd5
calico-node               1                   2fea0b9e44a58       canal-rgkd5
kube-proxy                1                   26df5b6644f18       kube-proxy-6rdfg
etcd                      1                   791e89b79944c       etcd-controlplane
```





## With Kuard
http://kuard.master-node:31479/-/liveness
- [X] Test Liveness Probe
- [X] Test Readiness Probe



Best Practices for Kubernetes Backup

## Reading

## Learning
- [Pass the CKA Certification Exam: The Ultimate Study Guide](https://devopscube.com/cka-exam-study-guide/) | DevOpsCube
- [Certified Kubernetes Administrator (CKA) Cert Prep (2024)](https://www.linkedin.com/learning/certified-kubernetes-administrator-cka-cert-prep-2024) | Linkedin Learning


## etcd
### Documents
https://etcd.io/

### Tasks
- [ ] Understand etcd
- [ ] Backup etcd

### Examples
```
$ ETCDCTL_API=3 etcdctl --endpoints=localhost:2379 version
etcdctl version: 3.4.36
API version: 3.4
```
### Reading
- [How to access kubernetes keys in etcd](https://stackoverflow.com/questions/47807892/how-to-access-kubernetes-keys-in-etcd) | Stack Overflow

## Check If Image Can Be Pulled
```
controlplane:~$ docker pull nginx:latest
latest: Pulling from library/nginx
0e4bc2bd6656: Pull complete 
b5feb73171bf: Pull complete 
108ab8292820: Pull complete 
53d743880af4: Pull complete 
77fa2eb06317: Pull complete 
192e2451f875: Pull complete 
de57a609c9d5: Pull complete 
Digest: sha256:553f64aecdc31b5bf944521731cd70e35da4faed96b2b7548a3d8e2598c52a42
Status: Downloaded newer image for nginx:latest
docker.io/library/nginx:latest
controlplane:~$ 
```

### Horizontal Pod Autoscaling
  - 🔳 [HorizontalPodAutoscaler Walkthrough](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/)
```
thomas-rausch@master-node:~$ kubectl top pods --sort-by=cpu
NAME                                  CPU(cores)   MEMORY(bytes)
php-apache-598b474864-tm9fr           386m         12Mi
load-generator                        9m           1Mi
busybox-deployment-5f5d6755dd-59t9f   2m           1Mi
enclosed-85f687f859-6bf6z             1m           20Mi
kuard-75cd5d4cc9-kq4gr                1m           5Mi
cpu-limited-pod                       0m           4Mi
hello-blue-whale-6b67f9df46-6qcvr     0m           2Mi
hello-minikube-7f54cff968-s5jqg       0m           1Mi
it-tools-5775bc6577-lpzgn             0m           7Mi

thomas-rausch@master-node:~$ kubectl top pods --sort-by=cpu
NAME                                  CPU(cores)   MEMORY(bytes)
php-apache-598b474864-tm9fr           449m         12Mi
php-apache-598b474864-s4czv           231m         12Mi
load-generator                        11m          1Mi
busybox-deployment-5f5d6755dd-59t9f   1m           1Mi
enclosed-85f687f859-6bf6z             1m           20Mi
hello-minikube-7f54cff968-s5jqg       1m           1Mi
kuard-75cd5d4cc9-kq4gr                1m           5Mi
cpu-limited-pod                       0m           4Mi
hello-blue-whale-6b67f9df46-6qcvr     0m           2Mi
it-tools-5775bc6577-lpzgn             0m           7Mi

thomas-rausch@master-node:~$ kubectl top pods --sort-by=cpu
NAME                                  CPU(cores)   MEMORY(bytes)
php-apache-598b474864-tm9fr           449m         12Mi
php-apache-598b474864-s4czv           231m         12Mi
load-generator                        11m          1Mi
busybox-deployment-5f5d6755dd-59t9f   1m           1Mi
enclosed-85f687f859-6bf6z             1m           20Mi
hello-minikube-7f54cff968-s5jqg       1m           1Mi
kuard-75cd5d4cc9-kq4gr                1m           5Mi
cpu-limited-pod                       0m           4Mi
hello-blue-whale-6b67f9df46-6qcvr     0m           2Mi
it-tools-5775bc6577-lpzgn             0m           7Mi

thomas-rausch@master-node:~$ kubectl top pods --sort-by=cpu
NAME                                  CPU(cores)   MEMORY(bytes)
php-apache-598b474864-tm9fr           243m         12Mi
php-apache-598b474864-s4czv           175m         12Mi
php-apache-598b474864-8qsfn           166m         12Mi
php-apache-598b474864-dn76t           124m         11Mi
load-generator                        10m          0Mi
busybox-deployment-5f5d6755dd-59t9f   2m           0Mi
enclosed-85f687f859-6bf6z             1m           20Mi
hello-minikube-7f54cff968-s5jqg       1m           1Mi
kuard-75cd5d4cc9-kq4gr                1m           5Mi
cpu-limited-pod                       0m           4Mi
hello-blue-whale-6b67f9df46-6qcvr     0m           2Mi
it-tools-5775bc6577-lpzgn             0m           7Mi

Every 2.0s: kubectl get hpa                                                                                                                                                                             master-node: Tue Nov 18 15:59:47 2025

NAME         REFERENCE               TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
kuard        Deployment/kuard        0%/5%     1         2         1          67d
php-apache   Deployment/php-apache   34%/50%   1         10        7          8m49s
```

### Run A Command With Output
```
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache;                                                                done"

kubectl run -i --tty date --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do date; done"
```

### Readiness Probe
```
Success/Failure: The probe is considered successful if it returns a success code (e.g., an HTTP 200) or a zero exit code. It is considered a failure if it times out, returns an error code, or a non-zero exit code.
```



