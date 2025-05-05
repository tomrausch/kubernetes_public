# Install Kubernetes (Minikube) On Linux (Ubuntu)

## Technology Stack
- Linux (Ubuntu)
- Docker
- Kubernetes (Minikube)

## Uninstall Conflicting Packages
Uninstall conflicting packages.
```
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

Reference
- [Uninstall old versions](https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions) | Docker

## Uninstall The Currently Installed Docker Engine
Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages
```
sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

Uninstall images, containers, volumes, or custom configuration files on your host aren't automatically removed. To delete all images, containers, and volumes:
```
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd
```

Remove source list and keyrings
```
sudo rm /etc/apt/sources.list.d/docker.list
sudo rm /etc/apt/keyrings/docker.asc
```

Delete any edited configuration files manually.

Reference
- [Uninstall the existing Docker Engine](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine)

## Install The Docker Engine With An apt Repository
Set up Docker's apt repository
- Add Docker's official GPG key
```
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
```

- Add the repository to apt sources
```
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install the Docker packages
```
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

Verify that the installation is successful by running the hello-world image:
```
sudo docker run hello-world

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

Reference
- [Install the Docker Engine using the apt repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository)


### Configure Docker To Run Without sudo Permissions

Create the security group 'docker'
```
sudo groupadd docker
```

Add the current user to the security group 'docker'
```
sudo usermod -aG docker $USER
```

Log out and log back in; the group membership is re-evaluated.

- If Linux (Ubuntu) is running in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect

Alternately, run the following command to activate the changes to groups
```
newgrp docker
```

Verify that the user can run the command 'docker' without sudo permissions
```
docker run hello-world
```

Reference
- [Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user)

### Configure Docker to start on boot with systemd
```
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
```

Reference
- [Configure Docker to start on boot with systemd](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot-with-systemd)

## Delete The Existing minikube Cluster
```
$ minikube delete
* Deleting "minikube" in docker ...
* Deleting container "minikube" ...
* Removing /home/tomrausch/.minikube/machines/minikube ...
* Removed all traces of the "minikube" cluster.
```


## Install minikube

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

Restart minikube
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


# Install minikube dashboard
```
~$ minikube addons enable dashboard
* dashboard is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* The 'dashboard' addon is enabled
```

```
~$ minikube addons enable metrics-server
* metrics-server is an addon maintained by Kubernetes. For any concerns contact minikube on GitHub.
You can view the list of minikube maintainers at: https://github.com/kubernetes/minikube/blob/master/OWNERS
  - Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
* The 'metrics-server' addon is enabled
```

```
~$ minikube start
* minikube v1.35.0 on Ubuntu 24.04
* Using the docker driver based on existing profile
* Starting "minikube" primary control-plane node in "minikube" cluster
* Pulling base image v0.0.46 ...
* Updating the running docker "minikube" container ...
* Preparing Kubernetes v1.32.0 on Docker 27.4.1 ...
* Verifying Kubernetes components...
  - Using image registry.k8s.io/metrics-server/metrics-server:v0.7.2
  - Using image gcr.io/k8s-minikube/storage-provisioner:v5
  - Using image docker.io/kubernetesui/dashboard:v2.7.0
  - Using image docker.io/kubernetesui/metrics-scraper:v1.0.8
* Some dashboard features require the metrics-server addon. To enable all features please run:

        minikube addons enable metrics-server

* Enabled addons: default-storageclass, storage-provisioner, metrics-server, dashboard
* Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default
```





Manage Docker as a non-root user
### [Linux post-installation steps for Docker Engine](https://docs.docker.com/engine/install/linux-postinstall/)
