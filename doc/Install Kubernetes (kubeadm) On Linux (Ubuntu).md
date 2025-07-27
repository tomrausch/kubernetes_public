# Install Kubernetes (kubeadm) On Linux (Ubuntu)

## Uninstall The Existing Configuration [On Master & Worker Node]

### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
- [Uninstall Minikube And Docker From Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/3de9646c8938fb8056fcc1bc6b844e8eb65abb0c/doc/Uninstall%20Minikube%20And%20Docker%20From%20Linux%20(Ubuntu).md) | Tom Rausch, GitHub

## Prepare The Linux System

### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
- [Prepare The Linux System To Install Software](https://github.com/tomrausch/kubernetes_public/blob/b187e08275c6668963f2fb659c9574209c02849d/doc/Prepare%20The%20Linux%20System%20To%20Install%20Software.md)

## Install Docker [On Master & Worker Node]

### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
- [Install Docker On Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/84b99ec026c546257a5b2a2d19b940f16800a171/doc/Install%20Docker%20On%20Linux%20(Ubuntu).md)


## Install Necessary Packages
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
```bash
$ sudo apt-get install apt-transport-https ca-certificates curl gnupg
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
apt-transport-https is already the newest version (2.8.3).
ca-certificates is already the newest version (20240203).
curl is already the newest version (8.5.0-2ubuntu10.6).
gnupg is already the newest version (2.4.4-2ubuntu17.3).
gnupg set to manually installed.
```

## Add Official GnuPG (GPG) Keyrings For Kubernetes
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
```bash
$ sudo mkdir -p -m 755 /etc/apt/keyrings
$ sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```
Confirm the Kubernetes keyrings are present in the file system
```bash
$ ls -l /etc/apt/keyrings | grep kubernetes-apt-keyring.gpg
total 4
-rw-r--r-- 1 root root 3817 Jul 27 15:19 docker.asc
```

## Add The Kubernetes Repository To Package Sources
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
```bash
$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```
Confirm the Kubernetes repository is present in the sources list
```bash 
$ cat /etc/apt/sources.list /etc/apt/sources.list.d/* | grep kubernetes
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /
```

## Install Kubernetes Components [On Master & Worker Node]
### Install On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
```bash
$ sudo apt install kubeadm kubelet kubectl
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  conntrack cri-tools kubernetes-cni
The following NEW packages will be installed:
  conntrack cri-tools kubeadm kubectl kubelet kubernetes-cni
0 upgraded, 6 newly installed, 0 to remove and 1 not upgraded.
Need to get 87.4 MB of archives.
After this operation, 335 MB of additional disk space will be used.
Do you want to continue? [Y/n] y
Get:6 http://us.archive.ubuntu.com/ubuntu noble/main amd64 conntrack amd64 1:1.4.8-1ubuntu1 [37.9 kB]
Get:1 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.28/deb  cri-tools 1.28.0-1.1 [19.6 MB]
Get:2 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.28/deb  kubernetes-cni 1.2.0-2.1 [27.6 MB]
Get:3 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.28/deb  kubelet 1.28.15-1.1 [19.6 MB]
Get:4 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.28/deb  kubectl 1.28.15-1.1 [10.4 MB]
Get:5 https://prod-cdn.packages.k8s.io/repositories/isv:/kubernetes:/core:/stable:/v1.28/deb  kubeadm 1.28.15-1.1 [10.1 MB]
Fetched 87.4 MB in 3s (27.5 MB/s)
Selecting previously unselected package conntrack.
(Reading database ... 228469 files and directories currently installed.)
Preparing to unpack .../0-conntrack_1%3a1.4.8-1ubuntu1_amd64.deb ...
Unpacking conntrack (1:1.4.8-1ubuntu1) ...
Selecting previously unselected package cri-tools.
Preparing to unpack .../1-cri-tools_1.28.0-1.1_amd64.deb ...
Unpacking cri-tools (1.28.0-1.1) ...
Selecting previously unselected package kubernetes-cni.
Preparing to unpack .../2-kubernetes-cni_1.2.0-2.1_amd64.deb ...
Unpacking kubernetes-cni (1.2.0-2.1) ...
Selecting previously unselected package kubelet.
Preparing to unpack .../3-kubelet_1.28.15-1.1_amd64.deb ...
Unpacking kubelet (1.28.15-1.1) ...
Selecting previously unselected package kubectl.
Preparing to unpack .../4-kubectl_1.28.15-1.1_amd64.deb ...
Unpacking kubectl (1.28.15-1.1) ...
Selecting previously unselected package kubeadm.
Preparing to unpack .../5-kubeadm_1.28.15-1.1_amd64.deb ...
Unpacking kubeadm (1.28.15-1.1) ...
Setting up conntrack (1:1.4.8-1ubuntu1) ...
Setting up kubectl (1.28.15-1.1) ...
Setting up cri-tools (1.28.0-1.1) ...
Setting up kubernetes-cni (1.2.0-2.1) ...
Setting up kubelet (1.28.15-1.1) ...
Setting up kubeadm (1.28.15-1.1) ...
Processing triggers for man-db (2.12.0-4build2) ...
```

- ```kubeadm``` Going to setup a Kubernetes cluster
- ```kubelet``` Responsible for creating pods which we are going to deploy applications
- ```kubectl``` will work as cli to interact with the k8s cluster

### Update And Upgrade All Packages
```bash 
$ sudo apt update
$ sudo apt upgrade
```


## Initialize Kubernetes Master Node [On MasterNode]

### Install On Nodes
- ✅ Master Node
- ❌ Worker Node

### Command
```
$ sudo kubeadm init--pod-network-cidr=10.244.0.0/16
```
- After run the above command then our vm will acts as master node and it will generate token to connect this with slave node-copy the token and run the command in slave machines 1 & 2

## Configure Kubernetes Cluster [On MasterNode]
```
$ mkdir-p $HOME/.kube
$ sudo cp-i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id-u):$(id-g) $HOME/.kube/config
```

## Deploy Networking Solution (Calico) [On MasterNode]
```
$ kubectl apply-f https://docs.projectcalico.org/v3.20/manifests/calico.yaml
```
 
## Deploy Ingress Controller (NGINX) [On MasterNode]
```
$ kubectl apply-f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
```

## Scan Kubernetes Cluster For Any Kind Of Issues
- For That We Have Multiple Tools Like Trivy
- But Trivy May Not Work Always So For That Reason We Are Just Going To Go With Cube Audit
- Cube Audit  Also A Tool That Can Be Used For Scanning

```
https://github.com/shopify/kubeaudit/releases
-> Go To The Web Site Copy The Linux_amd_64 Link)
-> Paste It Using wget Command
-> Now Untar The File Using tar-xvf File Name
-> sudo mv kubeaudit /usr
```

## Reference
- [Getting started](https://kubernetes.io/docs/setup/) | Kubernetes Documentation
- [Day 39: Setting Up a Kubernetes Cluster — Minikube & Kubeadm](https://medium.com/@karthidkk123/day-39-setting-up-a-kubernetes-cluster-minikube-kubeadm-d95a74bf3254) | [Karthick Dkk](https://medium.com/@karthidkk123), Medium
- [Install Kubernetes on Ubuntu 22.04](https://phoenixnap.com/kb/install-kubernetes-on-ubuntu) | PhoenixNAP
- [Simple Two-Node Kubernetes Deployment with Kubeadm](https://medium.com/@johanesmistrialdo/simple-2-node-kubernetes-deployment-with-kubeadm-bb9b3385b950) | [Johanes Mistrialdo](https://medium.com/@johanesmistrialdo). Medium
- *THE ULTIMATE CICD DEVOPSPIPELINE PROJECT* (Booklet), Chapter "Setup K8-Cluster using kubeadm [K8 Version-->1.28.1]"
