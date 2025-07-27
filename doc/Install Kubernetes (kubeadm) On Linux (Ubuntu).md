# Install Kubernetes (kubeadm) On Linux (Ubuntu)

## Uninstall The Existing Configuration [On Master & Worker Node]

- [Uninstall Minikube And Docker From Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/3de9646c8938fb8056fcc1bc6b844e8eb65abb0c/doc/Uninstall%20Minikube%20And%20Docker%20From%20Linux%20(Ubuntu).md) | Tom Rausch, GitHub

## Prepare The Linux System

### Install On Nodes
- ✅ Master Node
- ✅ Worker Node

### Prevent The Linux System From Hibernating Or Going To Sleep [^1]
```
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

### Disable The Disk Swap File [^2]
```
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```

### Update All Existing System Packages
```
$ sudo apt-get update
```

[^1]: [How do I disable my system from going to sleep?](https://askubuntu.com/questions/47311/how-do-i-disable-my-system-from-going-to-sleep) | Ask Ubuntu
[^2]: [How to Install Kubernetes on Ubuntu 22.04](https://phoenixnap.com/kb/install-kubernetes-on-ubuntu#Deploy_Kubernetes) | phoenixNAP

## Install Docker [On Master & Worker Node]
```
$ sudo apt install docker.io-y
$ sudo chmod 666 /var/run/docker.sock
```

## Install Required Dependencies for Kubernetes [On Master & Worker Node]
```
$ sudo apt-get install-y apt-transport-https ca-certificates curl gnupg
$ sudo mkdir-p-m 755 /etc/apt/keyrings
```

## Add Kubernetes Repository and GPG Key [On Master & Worker Node]
```
$ curl-fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg-- dearmor-o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
```


## Install Kubernetes Components [On Master & Worker Node]
### Install On Nodes
- ✅ Master Node
- ✅ Worker Node

### Command
```
$ sudo apt install-y kubeadm=1.28.1-1.1 kubelet=1.28.1-1.1 kubectl=1.28.1-1.1
```

- ```kubeadm``` Going to setup a Kubernetes cluster
- ```kubelet``` Responsible for creating pods which we are going to deploy applications
- ```kubectl``` will work as cli to interact with the k8s cluster


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
