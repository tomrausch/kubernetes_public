# Uninstall Kubernetes (Minikube) From Linux (Ubuntu)


## Stop The Existing Kubernetes (minikube) Cluster
```
$ minikube stop
* Stopping node "minikube"  ...
* Powering off "minikube" via SSH ...
* 1 node stopped.
```


## Uninstall Conflicting Packages
```
$ for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```

### Reference
- [Uninstall old versions](https://docs.docker.com/engine/install/ubuntu/#uninstall-old-versions) | Docker


## Uninstall The Currently Installed Docker Engine
Uninstall the Docker Engine, CLI, containerd, and Docker Compose packages
```
$ sudo apt-get purge docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-ce-rootless-extras
```

Uninstall images, containers, volumes, or custom configuration files on your host aren't automatically removed. To delete all images, containers, and volumes:
```
$ sudo rm -rf /var/lib/docker
$ sudo rm -rf /var/lib/containerd
```

Remove source list and keyrings
```
$ sudo rm /etc/apt/sources.list.d/docker.list
$ sudo rm /etc/apt/keyrings/docker.asc
```

Delete any edited configuration files manually.

### Reference
- [Uninstall the existing Docker Engine](https://docs.docker.com/engine/install/ubuntu/#uninstall-docker-engine)

## Delete The Existing Kubernetes (minikube) Cluster
```
$ minikube delete
* Deleting "minikube" in docker ...
* Deleting container "minikube" ...
* Removing /home/tomrausch/.minikube/machines/minikube ...
* Removed all traces of the "minikube" cluster.
```

