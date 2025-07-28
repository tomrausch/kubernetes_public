# Uninstall Minikube And Docker From Linux (Ubuntu)

## Stop The Existing Minikube Cluster
```bash
$ minikube stop
* Stopping node "minikube"  ...
* Powering off "minikube" via SSH ...
* 1 node stopped.
```

## Delete The Existing Minikube Cluster
```bash
$ minikube delete
* Deleting "minikube" in docker ...
* Deleting container "minikube" ...
* Removing /home/tomrausch/.minikube/machines/minikube ...
* Removed all traces of the "minikube" cluster.
```

## Uninstall Docker Packages [^1]
```bash
$ for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

[^1]: [Uninstall old versions](https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions) | Docker Docs


## Uninstall The Currently Installed Docker Engine [^2]
Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages
```bash
$ sudo apt-get purge docker.io docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

Uninstall images, containers, volumes, or custom configuration files on your host aren't automatically removed. To delete all images, containers, and volumes:
```bash
$ sudo rm -rf /var/lib/docker
$ sudo rm -rf /var/lib/containerd
```

Remove source list and keyrings
```bash
$ sudo rm /etc/apt/sources.list.d/docker.list
$ sudo rm /etc/apt/keyrings/docker.asc
```

Delete any edited configuration files manually.

[^2]: [Uninstall the existing Docker Engine](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine) | Docker Docs


## Delete Configuration Directories
```bash
$ sudo rm -rf $HOME/.kube
$ sudo rm -rf $HOME/.minikube
$ sudo rm -rf $HOME/etc/.minikube
$ sudo rm -rf /etc/kubernetes
```

## Delete Persistent Volume Swap Files

Example
```bash
$ ls -aFl | grep swp
-rw-------  1 tomrausch tomrausch 12288 Jul 21 02:12 .PersistentVolume_pv-analytics.yaml.swp
$ sudo rm .PersistentVolume_pv-analytics.yaml.swp
```
