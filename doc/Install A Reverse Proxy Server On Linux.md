# Install A Reverse Proxy Server (nginx) On Linux (Ubuntu)


Install package "apache2-utils"
```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/etc/nginx/conf.d$ sudo apt-get install apache2-utils -y
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following additional packages will be installed:
  libapr1t64 libaprutil1t64
The following NEW packages will be installed:
  apache2-utils libapr1t64 libaprutil1t64
0 upgraded, 3 newly installed, 0 to remove and 6 not upgraded.
Need to get 297 kB of archives.
After this operation, 907 kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu noble-updates/main amd64 libapr1t64 amd64 1.7.2-3.1ubuntu0.1 [108 kB]
Get:2 http://us.archive.ubuntu.com/ubuntu noble/main amd64 libaprutil1t64 amd64 1.6.3-1.1ubuntu7 [91.9 kB]
Get:3 http://us.archive.ubuntu.com/ubuntu noble-updates/main amd64 apache2-utils amd64 2.4.58-1ubuntu8.6 [97.2 kB]
Fetched 297 kB in 0s (746 kB/s)
Selecting previously unselected package libapr1t64:amd64.
(Reading database ... 196824 files and directories currently installed.)
Preparing to unpack .../libapr1t64_1.7.2-3.1ubuntu0.1_amd64.deb ...
Unpacking libapr1t64:amd64 (1.7.2-3.1ubuntu0.1) ...
Selecting previously unselected package libaprutil1t64:amd64.
Preparing to unpack .../libaprutil1t64_1.6.3-1.1ubuntu7_amd64.deb ...
Unpacking libaprutil1t64:amd64 (1.6.3-1.1ubuntu7) ...
Selecting previously unselected package apache2-utils.
Preparing to unpack .../apache2-utils_2.4.58-1ubuntu8.6_amd64.deb ...
Unpacking apache2-utils (2.4.58-1ubuntu8.6) ...
Setting up libapr1t64:amd64 (1.7.2-3.1ubuntu0.1) ...
Setting up libaprutil1t64:amd64 (1.6.3-1.1ubuntu7) ...
Setting up apache2-utils (2.4.58-1ubuntu8.6) ...
Processing triggers for man-db (2.12.0-4build2) ...
Processing triggers for libc-bin (2.39-0ubuntu8.4) ...
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/etc/nginx/conf.d$
```


make directories
```
$ mkdir -p /etc/nginx/conf.d/ /etc/nginx/certs
```

Run this command
```
$ sudo cat <<EOF > /etc/nginx/conf.d/minikube.conf
server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;
    auth_basic "Administrator’s Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location / {
        proxy_pass https://192.168.49.2:8443;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /hello-blue-whale {
        proxy_pass https://192.168.49.2:30834;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /hello-minikube {
        proxy_pass https://192.168.49.2:31389;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /it-tools {
        proxy_pass https://192.168.49.2:31239;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /kuard {
        proxy_pass https://192.168.49.2:30518;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /web {
        proxy_pass https://192.168.49.2:30983/;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
}
EOF
```

Run command ```cat minikube.conf``` to confirm contents of file
```
$ cat minikube.conf
server {
    listen       80;
    listen  [::]:80;
    server_name  localhost;
    auth_basic "Administrator’s Area";
    auth_basic_user_file /etc/nginx/.htpasswd;

    location / {
        proxy_pass https://192.168.49.2:8443;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /hello-blue-whale {
        proxy_pass https://192.168.49.2:30834;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /hello-minikube {
        proxy_pass https://192.168.49.2:31389;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /it-tools {
        proxy_pass https://192.168.49.2:31239;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /kuard {
        proxy_pass https://192.168.49.2:30518;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
    location /web {
        proxy_pass https://192.168.49.2:30983/;
        proxy_ssl_certificate /etc/nginx/certs/minikube-client.crt;
        proxy_ssl_certificate_key /etc/nginx/certs/minikube-client.key;
    }
}
```

Add password for User ID "minikube"
- Password is ```$Calfornia$```
```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/etc/nginx/conf.d$ sudo htpasswd -c /etc/nginx/.htpasswd minikube
New password:
Re-type new password:
Adding password for user minikube
```

Run docker
```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:/etc/nginx/conf.d$ docker run -d --name nginx -p 8080:80 -v /root/.minikube/profiles/minikube/client.key:/etc/nginx/certs/minikube-client.key -v /root/.minikube/profiles/minikube/client.crt:/etc/nginx/certs/minikube-client.crt -v /etc/nginx/conf.d/:/etc/nginx/conf.d -v /etc/nginx/.htpasswd:/etc/nginx/.htpasswd nginx
Unable to find image 'nginx:latest' locally
latest: Pulling from library/nginx
254e724d7786: Pull complete
913115292750: Pull complete
3e544d53ce49: Pull complete
4f21ed9ac0c0: Pull complete
d38f2ef2d6f2: Pull complete
40a6e9f4e456: Pull complete
d3dc5ec71e9d: Pull complete
Digest: sha256:c15da6c91de8d2f436196f3a768483ad32c258ed4e1beb3d367a27ed67253e66
Status: Downloaded newer image for nginx:latest
42bfd07f343aac00ff6344992a3c9055d1030bb78dbe9b4f7a267f535fccdc39
```
Access the reverse proxy at ```http://<YOUR_SERVER_IP>:8080```
- ```http://<YOUR_SERVER_IP>:8080\it-tools```
- ...

Must authenticate to nginx reverse proxy


References
- [Accessing a remote minikube from a local computer](https://faun.pub/accessing-a-remote-minikube-from-a-local-computer-fd6180dd66dd) | [FAUN — Developer Community](https://faun.pub/), [Medium](https://medium.com/)
- [How to setup an Nginx reverse proxy server example](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/How-to-setup-Nginx-reverse-proxy-servers-by-example)
