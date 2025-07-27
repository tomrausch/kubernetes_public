# Install Docker On Linux (Ubuntu)


## Setup Docker's apt Repository [^1]
Add Docker's official GPG key
```
$ sudo apt-get install ca-certificates curl
$ sudo install -m 0755 -d /etc/apt/keyrings
$ sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
$ sudo chmod a+r /etc/apt/keyrings/docker.asc
```

Add the repository to apt sources
```
$ echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

Install the Docker packages
```
$ sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```
or
```
$ sudo apt install docker.io-y
```
then
```
$ sudo chmod 666 /var/run/docker.sock
```

[^1]:[Install the Docker Engine using the apt repository](https://docs.docker.com/engine/install/ubuntu/#install-using-the-repository) | Docker Docs

## Configure Docker

### Configure Docker To Run Without sudo Permissions [^2]

Create the security group 'docker'
```
$ sudo groupadd docker
```

Add the current user to the security group 'docker'
```
$ sudo usermod -aG docker $USER
```

Log out and log back in; the group membership is re-evaluated.

- If Linux (Ubuntu) is running in a virtual machine, it may be necessary to restart the virtual machine for changes to take effect

Alternately, run the following command to activate the changes to groups
```
$ sudo newgrp docker
```

Verify that the user can run the command 'docker' without sudo permissions
```
$ sudo docker run hello-world
```
more likely
```
$ docker run hello-world
```

[^2]:[Manage Docker as a non-root user](https://docs.docker.com/engine/install/linux-postinstall/#manage-docker-as-a-non-root-user) | Docker Docs

### Configure Docker to start on boot [^3]
```
$ sudo systemctl enable docker.service
$ sudo systemctl enable containerd.service
```

[^3]:[Configure Docker to start on boot with systemd](https://docs.docker.com/engine/install/linux-postinstall/#configure-docker-to-start-on-boot-with-systemd) | Docker Docs

## Verify The Docker Installation Is Successful 
Run the command  ```docker version``` to determine the current version of the Docker application
```
$ docker version
Client: Docker Engine - Community
 Version:           28.0.4
 API version:       1.48
 Go version:        go1.23.7
 Git commit:        b8034c0
 Built:             Tue Mar 25 15:07:16 2025
 OS/Arch:           linux/amd64
 Context:           default

Server: Docker Engine - Community
 Engine:
  Version:          28.0.4
  API version:      1.48 (minimum version 1.24)
  Go version:       go1.23.7
  Git commit:       6430e49
  Built:            Tue Mar 25 15:07:16 2025
  OS/Arch:          linux/amd64
  Experimental:     false
 containerd:
  Version:          1.7.27
  GitCommit:        05044ec0a9a75232cad458027ca83437aae3f4da
 runc:
  Version:          1.2.5
  GitCommit:        v1.2.5-0-g59923ef
 docker-init:
  Version:          0.19.0
  GitCommit:        de40ad0
```

Run the command ```docker run hello-world``` and observe the results
```
$ docker run hello-world

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
