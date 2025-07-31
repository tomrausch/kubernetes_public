# Install Kubernetes (kubeadm) On Linux (Ubuntu)

## Uninstall The Existing Configuration
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
- [Prepare The Linux System To Install Software](https://github.com/tomrausch/kubernetes_public/blob/b187e08275c6668963f2fb659c9574209c02849d/doc/Prepare%20The%20Linux%20System%20To%20Install%20Software.md)  | Tom Rausch, GitHub


## Install Docker
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
- [Install Docker On Linux (Ubuntu)](https://github.com/tomrausch/kubernetes_public/blob/84b99ec026c546257a5b2a2d19b940f16800a171/doc/Install%20Docker%20On%20Linux%20(Ubuntu).md) | Tom Rausch, GitHub


## Install Prerequisite Packages
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

### Confirm The Packages Are Installated
```bash
$ sudo apt list --installed | grep apt-transport-https
apt-transport-https/noble-updates,now 2.8.3 all [installed]
$ sudo apt list --installed | grep ca-certificates
ca-certificates/noble,now 20240203 all [installed]
$ sudo apt list --installed | grep curl
curl/noble-updates,noble-security,now 8.5.0-2ubuntu10.6 amd64 [installed]
libcurl3t64-gnutls/noble-updates,noble-security,now 8.5.0-2ubuntu10.6 amd64 [installed,automatic]
libcurl4t64/noble-updates,noble-security,now 8.5.0-2ubuntu10.6 amd64 [installed,automatic]
$ sudo apt list --installed | grep gnupg
gnupg-l10n/noble-updates,noble-security,now 2.4.4-2ubuntu17.3 all [installed,automatic]
gnupg-utils/noble-updates,noble-security,now 2.4.4-2ubuntu17.3 amd64 [installed,automatic]
gnupg/noble-updates,noble-security,now 2.4.4-2ubuntu17.3 all [installed]
```


## Add Official GnuPG (GPG) Keyrings For Kubernetes
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
Generate the Kubernetes keyrings
```bash
$ sudo mkdir -p -m 755 /etc/apt/keyrings
$ sudo curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
```

Confirm the Kubernetes keyrings are present in the file system
```bash
$ ls -l /etc/apt/keyrings | grep kubernetes-apt-keyring.gpg
-rw-r--r-- 1 root root 1200 Jul 30 17:47 kubernetes-apt-keyring.gpg
$ cat /etc/apt/keyrings/kubernetes-apt-keyring.gpg
...binary data...
```

## Add The Kubernetes Repository To Package Sources
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
Add the Kubernetes repository to the package sources list
```bash
$ echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /
```

Confirm the Kubernetes repository is present in the package sources list
```bash 
$ cat /etc/apt/sources.list /etc/apt/sources.list.d/* | grep kubernetes
deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /
```


## Install Kubernetes Components
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node
### Commands
Install the Kubernetes components
```bash
$ sudo snap install kubeadm --classic
kubeadm 1.33.3 from Canonical✓ installed
$ sudo snap install kubelet --classic
kubelet 1.33.3 from Canonical✓ installed
$ sudo snap install kubectl --classic
kubectl 1.33.3 from Canonical✓ installed
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
- ```kubeadm``` A tool that initializes a Kubernetes cluster by fast-tracking the setup using community-sourced best practices.
- ```kubelet``` The work package that runs on every node and starts containers. The tool gives you command-line access to clusters.
- ```kubectl``` The command-line interface for interacting with clusters.

### Confirm The Packages Are Installated
```bash
$ sudo apt list --installed | grep conntrack
conntrack/noble,now 1:1.4.8-1ubuntu1 amd64 [installed,automatic]
libnetfilter-conntrack3/noble,now 1.0.9-6build1 amd64 [installed,automatic]
$ sudo apt list --installed | grep kubectl
kubectl/unknown,now 1.28.15-1.1 amd64 [installed]
$ sudo apt list --installed | grep cri-tools
cri-tools/unknown,now 1.28.0-1.1 amd64 [installed,automatic]
$ sudo apt list --installed | grep kubernetes-cni
kubernetes-cni/unknown,now 1.2.0-2.1 amd64 [installed,automatic]
$ sudo apt list --installed | grep kubelet
kubelet/unknown,now 1.28.15-1.1 amd64 [installed]
$ sudo apt list --installed | grep kubeadm
kubeadm/unknown,now 1.28.15-1.1 amd64 [installed]
```

### Confirm The Kubernetes Commands Are Functioning
```
$ sudo kubeadm version
kubeadm version: &version.Info{Major:"1", Minor:"28", GitVersion:"v1.28.15", GitCommit:"841856557ef0f6a399096c42635d114d6f2cf7f4", GitTreeState:"clean", BuildDate:"2024-10-22T20:33:16Z", GoVersion:"go1.22.8", Compiler:"gc", Platform:"linux/amd64"}
$ sudo kubelet
I0728 15:07:06.106730 2299031 server.go:467] "Kubelet version" kubeletVersion="v1.28.15"
I0728 15:07:06.106842 2299031 server.go:469] "Golang settings" GOGC="" GOMAXPROCS="" GOTRACEBACK=""
I0728 15:07:06.107492 2299031 server.go:630] "Standalone mode, no API client"
I0728 15:07:06.127903 2299031 server.go:518] "No api server defined - no events will be sent to API server"
I0728 15:07:06.127955 2299031 server.go:725] "--cgroups-per-qos enabled, but --cgroup-root was not specified.  defaulting to /"
E0728 15:07:06.128214 2299031 run.go:74] "command failed" err="failed to run Kubelet: running with swap on is not supported, please disable swap! or set --fail-swap-on flag to false. /proc/swaps contained: [Filename\t\t\t\tType\t\tSize\t\tUsed\t\tPriority /swap.img                               file\t\t4194300\t\t3336\t\t-2]"
$ sudo kubectl version
Client Version: v1.28.15
Kustomize Version: v5.0.4-0.20230601165947-6ce0bf390ce3
```

### Prevent Automatic Installation, Upgrade, or Removal
```
$ sudo apt-mark hold kubeadm kubelet kubectl
kubeadm set on hold.
kubelet set on hold.
kubectl set on hold.
```


## Update And Upgrade All Packages
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
```bash 
$ sudo apt update
$ sudo apt upgrade
```

## Set The Kubernetes Configuration
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
Load the required containerd modules
- Edit the containerd configuration file '/etc/modules-load.d/containerd.conf'
```bash
$ sudo nano /etc/modules-load.d/containerd.conf
```
- Add the following two lines to the file '/etc/modules-load.d/containerd.conf'
```bash
overlay
br_netfilter
```
- Save the file to the file system and exit the editor
- Confirm the file '/etc/modules-load.d/containerd.conf'
```bash
$ cat /etc/modules-load.d/containerd.conf
overlay
br_netfilter
```

Add the modules
```bash
$ sudo modprobe overlay
$ sudo modprobe br_netfilter
```

Edit the kubernetes configuration file '/etc/sysctl.d/kubernetes.conf'
```bash
$ sudo nano /etc/sysctl.d/kubernetes.conf
```

Add the following three lines to the file '/etc/sysctl.d/kubernetes.conf'
```
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```

Save the file to the file system and exit the editor

Confirm the file '/etc/sysctl.d/kubernetes.conf'
```bash
$ cat /etc/sysctl.d/kubernetes.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```

Reload the configuration with the command [sysctl](https://linux.die.net/man/8/sysctl)
```bash
$  sudo sysctl --system
* Applying /usr/lib/sysctl.d/10-apparmor.conf ...
* Applying /etc/sysctl.d/10-bufferbloat.conf ...
* Applying /etc/sysctl.d/10-console-messages.conf ...
* Applying /etc/sysctl.d/10-ipv6-privacy.conf ...
* Applying /etc/sysctl.d/10-kernel-hardening.conf ...
* Applying /etc/sysctl.d/10-magic-sysrq.conf ...
* Applying /etc/sysctl.d/10-map-count.conf ...
* Applying /etc/sysctl.d/10-network-security.conf ...
* Applying /etc/sysctl.d/10-ptrace.conf ...
* Applying /etc/sysctl.d/10-zeropage.conf ...
* Applying /usr/lib/sysctl.d/30-tracker.conf ...
* Applying /usr/lib/sysctl.d/50-bubblewrap.conf ...
* Applying /usr/lib/sysctl.d/50-pid-max.conf ...
* Applying /usr/lib/sysctl.d/99-protect-links.conf ...
* Applying /etc/sysctl.d/99-sysctl.conf ...
* Applying /etc/sysctl.d/kubernetes.conf ...
* Applying /etc/sysctl.conf ...
kernel.apparmor_restrict_unprivileged_userns = 1
net.core.default_qdisc = fq_codel
kernel.printk = 4 4 1 7
net.ipv6.conf.all.use_tempaddr = 2
net.ipv6.conf.default.use_tempaddr = 2
kernel.kptr_restrict = 1
kernel.sysrq = 176
vm.max_map_count = 1048576
net.ipv4.conf.default.rp_filter = 2
net.ipv4.conf.all.rp_filter = 2
kernel.yama.ptrace_scope = 1
vm.mmap_min_addr = 65536
fs.inotify.max_user_watches = 65536
kernel.unprivileged_userns_clone = 1
kernel.pid_max = 4194304
fs.protected_fifos = 1
fs.protected_hardlinks = 1
fs.protected_regular = 2
fs.protected_symlinks = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
```


## Reset The Hostname Of The Master Node
### Perform On Nodes
- ✅ Master Node
- ❌ Worker Node

### Commands
Logon the future Kubernetes master node

Determine the hostname and IP address
```bash
$ hostname
tomrausch-HP-Elite-7100-Microtower-PC
$ hostname -I
192.168.0.136 172.17.0.1 192.168.58.1
```
- The current hostname of the future Kubernetes master node is "tomrausch-HP-Elite-7100-Microtower-PC"
- The IP address of the future Kubernetes master node is "192.168.0.136"

Reset the hostname of the Kubernetes master node
```bash
$ sudo hostnamectl set-hostname master-node
```

Confirm the hostname and IP address of the Kubernetes master node
```bash
$ hostname
master-node
$ hostname -I
192.168.0.136 172.17.0.1 192.168.58.1
```
- The current hostname of the future Kubernetes master node is "master-node"
  - Changed
- The IP address of the future Kubernetes master node is "192.168.0.136"
  - There is no change


## Reset The Hostname Of The Worker Node
### Perform On Nodes
- ❌ Master Node
- ✅ Worker Node

### Commands
Logon the future Kubernetes worker node

Determine the hostname and IP address
```bash
$ hostname
thomas-rausch-ThinkPad-L560
$ hostname -I
192.168.0.241 2601:248:100:eb90::27b5
```
- The current hostname of the future Kubernetes worker node is "thomas-rausch-ThinkPad-L560"
- The IP address of the future Kubernetes worker node is "192.168.0.241"

Reset the hostname of the Kubernetes worker node
```bash
$ sudo hostnamectl set-hostname worker-node-01
```

Confirm the hostname and IP address of the Kubernetes worker node
```bash
$ hostname
worker-node-01
$ hostname -I
192.168.0.241 2601:248:100:eb90::27b5
```
- The current hostname of the future Kubernetes worker node is "master-node"
  - Changed
- The IP address of the future master Kubernetes worker node is "192.168.0.241"
  - There is no change


## Modify The Hosts File
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands
Logon the Linux device

Edit the hosts file '/etc/hosts'
```bash
$ sudo nano /etc/hostsw
```
Add the following two lines to the file '/etc/hosts'
```bash
192.168.0.136 master-node
192.168.0.241 worker-node-01
```
- The IP addresses are obtained in a previous step

Save the file to the file system and exit the editor

Confirm the file '/etc/hosts'
- Master node
```bash
$ cat /etc/hosts
127.0.0.1 localhost
127.0.1.1 tomrausch-HP-Elite-7100-Microtower-PC
127.0.1.1 master-node
192.168.0.136 master-node
192.168.0.241 worker-node-01
192.168.0.241 thomas-rausch-ThinkPad-L560

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
# Added by Docker Desktop
# To allow the same kube context to work on the host and the container:
127.0.0.1       kubernetes.docker.internal
# End of section
```

- Worker node
```bash
$ cat /etc/hosts
127.0.0.1 localhost
127.0.1.1 thomas-rausch-ThinkPad-L560
127.0.1.1 worker-node-01
192.168.0.136 master-node
192.168.0.241 worker-node-01
192.168.0.136 tomrausch-HP-Elite-7100-Microtower-PC

# The following lines are desirable for IPv6 capable hosts
::1     ip6-localhost ip6-loopback
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::1 ip6-allnodes
ff02::2 ip6-allrouters
``` 


## Initialize The Kubernetes Master Node
### Perform On Nodes
- ✅ Master Node
- ❌ Worker Node

### Commands [^K1]
Edit the kubetlet configuration file '/etc/default/kubelet'
```bash
$ sudo nano /etc/default/kubelet
```
Add the following line to the file '/etc/default/kubelet'
```bash
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
```
Save the file to the file system and exit the editor

Confirm the file '/etc/default/kubelet'
```bash
$ cat /etc/default/kubelet
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
```

Reload the configuration and restart kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```

[^K1]:[Configuring each kubelet in your cluster using kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/kubelet-integration/) | kubernetes.io

Edit the Docker daemon configuration file '/etc/docker/daemon.json'
```bash
$ sudo nano /etc/docker/daemon.json
```
Append the following configuration block to the file '/etc/docker/daemon.json'
```bash
 {
      "exec-opts": ["native.cgroupdriver=systemd"],
      "log-driver": "json-file",
      "log-opts": {
      "max-size": "100m"
   },

       "storage-driver": "overlay2"
       }
```
Save the file to the file system and exit the editor

Confirm the file '/etc/docker/daemon.json'
```bash
$ cat /etc/docker/daemon.json
KUBELET_EXTRA_ARGS="--cgroup-driver=cgroupfs"
```

Reload the configuration and restart Docker
```bash
sudo systemctl daemon-reload && sudo systemctl restart docker
```

Find the location of kubeadm configuration file
```
$ sudo systemctl status kubelet.service
● kubelet.service - kubelet: The Kubernetes Node Agent
     Loaded: loaded (/usr/lib/systemd/system/kubelet.service; enabled; preset: enabled)
    Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
     Active: active (running) since Tue 2025-07-29 16:01:31 CDT; 53min ago
       Docs: https://kubernetes.io/docs/
   Main PID: 13781 (kubelet)
      Tasks: 18 (limit: 9378)
     Memory: 49.9M (peak: 51.7M)
        CPU: 1min 48.987s
     CGroup: /system.slice/kubelet.service
             └─13781 /usr/bin/kubelet --bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.con>

Jul 29 16:54:46 master-node kubelet[13781]: E0729 16:54:46.899717   13781 kuberuntime_manager.go:1>
Jul 29 16:54:46 master-node kubelet[13781]: E0729 16:54:46.899805   13781 pod_workers.go:1300] "Er>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.901022   13781 remote_runtime.go:193] ">
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.901079   13781 kuberuntime_sandbox.go:7>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.901114   13781 kuberuntime_manager.go:1>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.901194   13781 pod_workers.go:1300] "Er>
e5091d3b437c1d4bb76a8c0b1\\\": plugin type=\\\"flannel\\\" failed (add): loadFlannelSubnetEnv fail>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.915465   13781 remote_runtime.go:193] ">
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.915542   13781 kuberuntime_sandbox.go:7>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.915583   13781 kuberuntime_manager.go:1>
Jul 29 16:54:50 master-node kubelet[13781]: E0729 16:54:50.915669   13781 pod_workers.go:1300] "Er>
lines 1-24/24 (END)
```

The location of the kubeadm configuration file is '/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf'
```bash
Drop-In: /usr/lib/systemd/system/kubelet.service.d
             └─10-kubeadm.conf
```

Edit the kubeadm configuration file '/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf'
```bash
$ sudo nano /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
```

Add the following line to the file:
```bash
Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"
```
Save the file to the file system and exit the editor

Confirm the file '/usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf'
```bash
$ cat /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
# Note: This dropin only works with kubeadm and kubelet v1.11+
[Service]
Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf"
Environment="KUBELET_CONFIG_ARGS=--config=/var/lib/kubelet/config.yaml"
Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"
# This is a file that "kubeadm init" and "kubeadm join" generates at runtime, populating the KUBELET_KUBEADM_ARGS variable dynamically
EnvironmentFile=-/var/lib/kubelet/kubeadm-flags.env
# This is a file that the user can use for overrides of the kubelet args as a last resort. Preferably, the user should use
# the .NodeRegistration.KubeletExtraArgs object in the configuration files instead. KUBELET_EXTRA_ARGS should be sourced from this file.
EnvironmentFile=-/etc/default/kubelet
ExecStart=
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS
```

Reload the configuration and restart kubelet
```
$ sudo systemctl daemon-reload && sudo systemctl restart kubelet
tomrausch@master-node:/usr/lib/systemd/system/kubelet.service.d$ sudo nano /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
tomrausch@master-node:/usr/lib/systemd/system/kubelet.service.d$ cat /usr/lib/systemd/system/kubelet.service.d/10-kubeadm.conf
# Note: This dropin only works with kubeadm and kubelet v1.11+
[Service]
Environment="KUBELET_KUBECONFIG_ARGS=--bootstrap-kubeconfig=/etc/kubernetes/bootstrap-kubelet.conf --kubeconfig=/etc/kubernetes/kubelet.conf"
Environment="KUBELET_CONFIG_ARGS=--config=/var/lib/kubelet/config.yaml"
Environment="KUBELET_EXTRA_ARGS=--fail-swap-on=false"
# This is a file that "kubeadm init" and "kubeadm join" generates at runtime, populating the KUBELET_KUBEADM_ARGS variable dynamically
EnvironmentFile=-/var/lib/kubelet/kubeadm-flags.env
# This is a file that the user can use for overrides of the kubelet args as a last resort. Preferably, the user should use
# the .NodeRegistration.KubeletExtraArgs object in the configuration files instead. KUBELET_EXTRA_ARGS should be sourced from this file.
EnvironmentFile=-/etc/default/kubelet
ExecStart=
ExecStart=/usr/bin/kubelet $KUBELET_KUBECONFIG_ARGS $KUBELET_CONFIG_ARGS $KUBELET_KUBEADM_ARGS $KUBELET_EXTRA_ARGS
tomrausch@master-node:/usr/lib/systemd/system/kubelet.service.d$
```

Reset the existing configuration, if any
```
$ sudo kubeadm reset
[reset] Reading configuration from the cluster...
[reset] FYI: You can look at this config file with 'kubectl -n kube-system get cm kubeadm-config -o yaml'
W0729 14:36:33.870260 2402426 configset.go:78] Warning: No kubeproxy.config.k8s.io/v1alpha1 config is loaded. Continuing without it: configmaps "kube-proxy" not found
W0729 14:36:33.882387 2402426 reset.go:120] [reset] Unable to fetch the kubeadm-config ConfigMap from cluster: failed to get node registration: failed to get corresponding node: nodes "tomrausch-hp-elite-7100-microtower-pc" not found
W0729 14:36:33.882488 2402426 preflight.go:56] [reset] WARNING: Changes made to this host by 'kubeadm init' or 'kubeadm join' will be reverted.
[reset] Are you sure you want to proceed? [y/N]: y
[preflight] Running pre-flight checks
W0729 14:36:35.733502 2402426 removeetcdmember.go:106] [reset] No kubeadm config, using etcd pod spec to get data directory
[reset] Deleted contents of the etcd data directory: /var/lib/etcd
[reset] Stopping the kubelet service
[reset] Unmounting mounted directories in "/var/lib/kubelet"
[reset] Deleting contents of directories: [/etc/kubernetes/manifests /var/lib/kubelet /etc/kubernetes/pki]
[reset] Deleting files: [/etc/kubernetes/admin.conf /etc/kubernetes/kubelet.conf /etc/kubernetes/bootstrap-kubelet.conf /etc/kubernetes/controller-manager.conf /etc/kubernetes/scheduler.conf]

The reset process does not clean CNI configuration. To do so, you must remove /etc/cni/net.d

The reset process does not reset or clean up iptables rules or IPVS tables.
If you wish to reset iptables, you must do so manually by using the "iptables" command.

If your cluster was setup to utilize IPVS, run ipvsadm --clear (or similar)
to reset your system's IPVS tables.

The reset process does not clean your kubeconfig files and you must remove them manually.
Please, check the contents of the $HOME/.kube/config file.
```

Initialize the Kubernetes cluster
```
$ sudo kubeadm init --control-plane-endpoint=master-node --upload-certs
I0729 14:36:52.098417 2403045 version.go:256] remote version is much newer: v1.33.3; falling back to: stable-1.28
[init] Using Kubernetes version: v1.28.15
[preflight] Running pre-flight checks
[preflight] Pulling images required for setting up a Kubernetes cluster
[preflight] This might take a minute or two, depending on the speed of your internet connection
[preflight] You can also perform this action in beforehand using 'kubeadm config images pull'
W0729 14:36:52.628542 2403045 checks.go:835] detected that the sandbox image "registry.k8s.io/pause:3.8" of the container runtime is inconsistent with that used by kubeadm. It is recommended that using "registry.k8s.io/pause:3.9" as the CRI sandbox image.
[certs] Using certificateDir folder "/etc/kubernetes/pki"
[certs] Generating "ca" certificate and key
[certs] Generating "apiserver" certificate and key
[certs] apiserver serving cert is signed for DNS names [kubernetes kubernetes.default kubernetes.default.svc kubernetes.default.svc.cluster.local master-node] and IPs [10.96.0.1 192.168.0.136]
[certs] Generating "apiserver-kubelet-client" certificate and key
[certs] Generating "front-proxy-ca" certificate and key
[certs] Generating "front-proxy-client" certificate and key
[certs] Generating "etcd/ca" certificate and key
[certs] Generating "etcd/server" certificate and key
[certs] etcd/server serving cert is signed for DNS names [localhost master-node] and IPs [192.168.0.136 127.0.0.1 ::1]
[certs] Generating "etcd/peer" certificate and key
[certs] etcd/peer serving cert is signed for DNS names [localhost master-node] and IPs [192.168.0.136 127.0.0.1 ::1]
[certs] Generating "etcd/healthcheck-client" certificate and key
[certs] Generating "apiserver-etcd-client" certificate and key
[certs] Generating "sa" key and public key
[kubeconfig] Using kubeconfig folder "/etc/kubernetes"
[kubeconfig] Writing "admin.conf" kubeconfig file
[kubeconfig] Writing "kubelet.conf" kubeconfig file
[kubeconfig] Writing "controller-manager.conf" kubeconfig file
[kubeconfig] Writing "scheduler.conf" kubeconfig file
[etcd] Creating static Pod manifest for local etcd in "/etc/kubernetes/manifests"
[control-plane] Using manifest folder "/etc/kubernetes/manifests"
[control-plane] Creating static Pod manifest for "kube-apiserver"
[control-plane] Creating static Pod manifest for "kube-controller-manager"
[control-plane] Creating static Pod manifest for "kube-scheduler"
[kubelet-start] Writing kubelet environment file with flags to file "/var/lib/kubelet/kubeadm-flags.env"
[kubelet-start] Writing kubelet configuration to file "/var/lib/kubelet/config.yaml"
[kubelet-start] Starting the kubelet
[wait-control-plane] Waiting for the kubelet to boot up the control plane as static Pods from directory "/etc/kubernetes/manifests". This can take up to 4m0s
[apiclient] All control plane components are healthy after 6.003474 seconds
[upload-config] Storing the configuration used in ConfigMap "kubeadm-config" in the "kube-system" Namespace
[kubelet] Creating a ConfigMap "kubelet-config" in namespace kube-system with the configuration for the kubelets in the cluster
[upload-certs] Storing the certificates in Secret "kubeadm-certs" in the "kube-system" Namespace
[upload-certs] Using certificate key:
4061aa3851a6be7739a01ddfa3d1dcdd3b5f4c77e0952e4e8b29d079650d6c06
[mark-control-plane] Marking the node master-node as control-plane by adding the labels: [node-role.kubernetes.io/control-plane node.kubernetes.io/exclude-from-external-load-balancers]
[mark-control-plane] Marking the node master-node as control-plane by adding the taints [node-role.kubernetes.io/control-plane:NoSchedule]
[bootstrap-token] Using token: itypil.dqyvp39gie9ogsxy
[bootstrap-token] Configuring bootstrap tokens, cluster-info ConfigMap, RBAC Roles
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to get nodes
[bootstrap-token] Configured RBAC rules to allow Node Bootstrap tokens to post CSRs in order for nodes to get long term certificate credentials
[bootstrap-token] Configured RBAC rules to allow the csrapprover controller automatically approve CSRs from a Node Bootstrap Token
[bootstrap-token] Configured RBAC rules to allow certificate rotation for all node client certificates in the cluster
[bootstrap-token] Creating the "cluster-info" ConfigMap in the "kube-public" namespace
[kubelet-finalize] Updating "/etc/kubernetes/kubelet.conf" to point to a rotatable kubelet client certificate and key
[addons] Applied essential addon: CoreDNS
[addons] Applied essential addon: kube-proxy

Your Kubernetes control-plane has initialized successfully!

To start using your cluster, you need to run the following as a regular user:

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

Alternatively, if you are the root user, you can run:

  export KUBECONFIG=/etc/kubernetes/admin.conf

You should now deploy a pod network to the cluster.
Run "kubectl apply -f [podnetwork].yaml" with one of the options listed at:
  https://kubernetes.io/docs/concepts/cluster-administration/addons/

You can now join any number of the control-plane node running the following command on each as root:

  kubeadm join master-node:6443 --token itypil.dqyvp39gie9ogsxy \
        --discovery-token-ca-cert-hash sha256:e1ce2ba30fe699ebd76846d834eb39002ba35e5d3ad6f316edcc7c9b3ddbb549 \
        --control-plane --certificate-key 4061aa3851a6be7739a01ddfa3d1dcdd3b5f4c77e0952e4e8b29d079650d6c06

Please note that the certificate-key gives access to cluster sensitive data, keep it secret!
As a safeguard, uploaded-certs will be deleted in two hours; If necessary, you can use
"kubeadm init phase upload-certs --upload-certs" to reload certs afterward.

Then you can join any number of worker nodes by running the following on each as root:

kubeadm join master-node:6443 --token itypil.dqyvp39gie9ogsxy \
        --discovery-token-ca-cert-hash sha256:e1ce2ba30fe699ebd76846d834eb39002ba35e5d3ad6f316edcc7c9b3ddbb549
```

Retain the output from the text "Your Kubernetes control-plane has initialized successfully!" to the end of the output in a KeePass database

After a few minutes, the node is ready for use

Confirm the node is 'Ready'
```
tomrausch@master-node:~$ kubectl get nodes
NAME          STATUS   ROLES           AGE   VERSION
master-node   Ready    control-plane   28m   v1.28.15
```

Untaint the nodes
```
$ kubectl taint nodes --all node-role.kubernetes.io/control-plane-
node/master-node untainted
```

Confirm the Pods are 'Running'
```
$ kubectl get pods --all-namespaces
NAMESPACE      NAME                                  READY   STATUS              RESTARTS      AGE
kube-system    coredns-5dd5756b68-9c5sq              0/1     ContainerCreating   0             29m
kube-system    coredns-5dd5756b68-sq9st              0/1     ContainerCreating   0             29m
kube-system    etcd-master-node                      1/1     Running             0             29m
kube-system    kube-apiserver-master-node            1/1     Running             13            29m
kube-system    kube-controller-manager-master-node   1/1     Running             13            29m
kube-system    kube-proxy-p4lgt                      1/1     Running             0             29m
kube-system    kube-scheduler-master-node            1/1     Running             13            29m
```

## Install Pod Network
### Perform On Nodes
- ✅ Master Node
- (TBD) Worker Node

### Commands
If the pods with names that start with coredns are not running, install a networking solution
- Install Calico [^install_calico]
```bash
$ kubectl apply-f https://docs.projectcalico.org/v3.20/manifests/calico.yaml
```
[^install_calico]: [Coredns stuck in “ContainerCreating”](https://discuss.kubernetes.io/t/coredns-stuck-in-containercreating/19100)

OR
- Install Flannel
```bash
$ kubectl apply -f https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
namespace/kube-flannel created
serviceaccount/flannel created
clusterrole.rbac.authorization.k8s.io/flannel created
clusterrolebinding.rbac.authorization.k8s.io/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created
```

Reload the configuration and restart kubelet
```bash
sudo systemctl daemon-reload && sudo systemctl restart kubelet
```

Example: After installing Calico, all the pods including the coredns pods are running
- Investigate the pods with 'kubectl'
```bash
$ kubectl get pods --all-namespaces
NAMESPACE      NAME                                       READY   STATUS             RESTARTS         AGE
kube-system    calico-kube-controllers-658d97c59c-8hx55   1/1     Running            0                85s
kube-system    calico-node-82298                          1/1     Running            0                85s
kube-system    coredns-5dd5756b68-jjlh5                   1/1     Running            0                88m
kube-system    coredns-5dd5756b68-sq9st                   1/1     Running            0                144m
kube-system    etcd-master-node                           1/1     Running            1 (82m ago)      144m
kube-system    kube-apiserver-master-node                 1/1     Running            14 (82m ago)     144m
kube-system    kube-controller-manager-master-node        1/1     Running            14 (82m ago)     144m
kube-system    kube-proxy-p4lgt                           1/1     Running            1 (82m ago)      144m
kube-system    kube-scheduler-master-node                 1/1     Running            14 (82m ago)     144m
```
- Investigate the pods with 'crictl'
```
$ sudo crictl pods
WARN[0000] runtime connect using default endpoints: [unix:///var/run/dockershim.sock unix:///run/containerd/containerd.sock unix:///run/crio/crio.sock unix:///var/run/cri-dockerd.sock]. As the default settings are now deprecated, you should set the endpoint instead.
ERRO[0000] validate service connection: validate CRI v1 runtime API for endpoint "unix:///var/run/dockershim.sock": rpc error: code = Unavailable desc = connection error: desc = "transport: Error while dialing: dial unix /var/run/dockershim.sock: connect: no such file or directory"
POD ID              CREATED             STATE               NAME                                       NAMESPACE           ATTEMPT             RUNTIME
f36687cadaaa3       4 minutes ago       Ready               coredns-5dd5756b68-jjlh5                   kube-system         6                   (default)
185cdf2867618       4 minutes ago       Ready               calico-kube-controllers-658d97c59c-8hx55   kube-system         10                  (default)
774c959eb0fcd       4 minutes ago       Ready               coredns-5dd5756b68-sq9st                   kube-system         5                   (default)
098f1aaa718fd       5 minutes ago       Ready               calico-node-82298                          kube-system         0                   (default)
07b4dd6b5a9d5       About an hour ago   Ready               kube-proxy-p4lgt                           kube-system         1                   (default)
2db005b431d89       About an hour ago   Ready               kube-controller-manager-master-node        kube-system         1                   (default)
d521c059b525b       About an hour ago   Ready               etcd-master-node                           kube-system         1                   (default)
034547c5e62f9       About an hour ago   Ready               kube-apiserver-master-node                 kube-system         1                   (default)
dbdabaec3b382       About an hour ago   Ready               kube-scheduler-master-node                 kube-system         1                   (default)
```

## Create A Personal Kubernetes config File
### Perform On Nodes
- ✅ Master Node
- ✅ Worker Node

### Commands [^K1]
```bash
$ mkdir -p $HOME/.kube
$ sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
$ sudo chown $(id-u):$(id-g) $HOME/.kube/config
```

Retain the personal Kubernetes config file '$HOME/.kube/config' in a KeePass database

## Optional
### Perform On Nodes
- ❔ Master Node
- ❔ Worker Node

### Commands
#### Deploy Ingress Controller (NGINX) [On MasterNode]
```bash
$ kubectl apply-f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v0.49.0/deploy/static/provider/baremetal/deploy.yaml
```

#### Deploy kube-bench [^kube_bench]
[^kube_bench]: [kube-bench](https://aquasecurity.github.io/kube-bench/v0.6.5/)

## References
- [Getting started](https://kubernetes.io/docs/setup/) | Kubernetes Documentation
- [Day 39: Setting Up a Kubernetes Cluster — Minikube & Kubeadm](https://medium.com/@karthidkk123/day-39-setting-up-a-kubernetes-cluster-minikube-kubeadm-d95a74bf3254) | [Karthick Dkk](https://medium.com/@karthidkk123), Medium
- [Install Kubernetes on Ubuntu 22.04](https://phoenixnap.com/kb/install-kubernetes-on-ubuntu) | PhoenixNAP
- [Kubernetes The Hard Way](https://github.com/kelseyhightower/kubernetes-the-hard-way) | [Kelsey Hightower](https://github.com/kelseyhightower), GitHub
- [Simple Two-Node Kubernetes Deployment with Kubeadm](https://medium.com/@johanesmistrialdo/simple-2-node-kubernetes-deployment-with-kubeadm-bb9b3385b950) | [Johanes Mistrialdo](https://medium.com/@johanesmistrialdo). Medium
- *THE ULTIMATE CICD DEVOPSPIPELINE PROJECT* (Booklet), Chapter "Setup K8-Cluster using kubeadm [K8 Version-->1.28.1]"
