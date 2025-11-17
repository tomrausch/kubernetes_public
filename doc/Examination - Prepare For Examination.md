## Understand Topics on Examination

### Storage (10%)
- 🔳 Implement storage classes and dynamic volume provisioning
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
