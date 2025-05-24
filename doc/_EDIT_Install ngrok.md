```
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ curl -sSL https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null && echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list && sudo apt update && sudo apt install ngrok
[sudo] password for tomrausch:
deb https://ngrok-agent.s3.amazonaws.com buster main
Hit:1 http://us.archive.ubuntu.com/ubuntu noble InRelease
Get:2 http://us.archive.ubuntu.com/ubuntu noble-updates InRelease [126 kB]
Hit:3 https://download.docker.com/linux/ubuntu noble InRelease
Get:4 http://security.ubuntu.com/ubuntu noble-security InRelease [126 kB]
Get:5 http://us.archive.ubuntu.com/ubuntu noble-backports InRelease [126 kB]
Get:6 https://esm.ubuntu.com/apps/ubuntu noble-apps-security InRelease [7,595 B]
Get:7 https://ngrok-agent.s3.amazonaws.com buster InRelease [20.3 kB]
Get:8 https://esm.ubuntu.com/apps/ubuntu noble-apps-updates InRelease [7,480 B]
Get:9 http://us.archive.ubuntu.com/ubuntu noble-updates/main amd64 Packages [1,056 kB]
Get:10 https://esm.ubuntu.com/infra/ubuntu noble-infra-security InRelease [7,474 B]
Get:11 https://esm.ubuntu.com/infra/ubuntu noble-infra-updates InRelease [7,473 B]
Get:12 http://us.archive.ubuntu.com/ubuntu noble-updates/main amd64 Components [161 kB]
Get:13 http://us.archive.ubuntu.com/ubuntu noble-updates/restricted amd64 Components [212 B]
Get:14 http://us.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Packages [1,060 kB]
Get:15 http://us.archive.ubuntu.com/ubuntu noble-updates/universe amd64 Components [376 kB]
Get:16 http://us.archive.ubuntu.com/ubuntu noble-updates/multiverse amd64 Components [940 B]
Get:17 http://us.archive.ubuntu.com/ubuntu noble-backports/main amd64 Components [7,076 B]
Get:18 http://us.archive.ubuntu.com/ubuntu noble-backports/restricted amd64 Components [216 B]
Get:19 http://us.archive.ubuntu.com/ubuntu noble-backports/universe amd64 Components [16.4 kB]
Get:20 http://us.archive.ubuntu.com/ubuntu noble-backports/multiverse amd64 Components [212 B]
Get:21 https://ngrok-agent.s3.amazonaws.com buster/main amd64 Packages [7,748 B]
Get:22 http://security.ubuntu.com/ubuntu noble-security/main amd64 Components [21.5 kB]
Get:23 http://security.ubuntu.com/ubuntu noble-security/restricted amd64 Components [212 B]
Get:24 http://security.ubuntu.com/ubuntu noble-security/universe amd64 Components [52.2 kB]
Get:25 http://security.ubuntu.com/ubuntu noble-security/multiverse amd64 Components [212 B]
Fetched 3,190 kB in 1s (2,696 kB/s)
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
5 packages can be upgraded. Run 'apt list --upgradable' to see them.
Reading package lists... Done
Building dependency tree... Done
Reading state information... Done
The following NEW packages will be installed:
  ngrok
0 upgraded, 1 newly installed, 0 to remove and 5 not upgraded.
Need to get 6,777 kB of archives.
After this operation, 0 B of additional disk space will be used.
Get:1 https://ngrok-agent.s3.amazonaws.com buster/main amd64 ngrok amd64 3.22.1 [6,777 kB]
Fetched 6,777 kB in 1s (6,634 kB/s)
Selecting previously unselected package ngrok.
(Reading database ... 193397 files and directories currently installed.)
Preparing to unpack .../ngrok_3.22.1_amd64.deb ...
Unpacking ngrok (3.22.1) ...
Setting up ngrok (3.22.1) ...
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ kubectl get services
NAME                   TYPE           CLUSTER-IP      EXTERNAL-IP    PORT(S)          AGE
hello-blue-whale-svc   LoadBalancer   10.97.89.132    192.168.49.5   80:30647/TCP     16h
kubernetes             ClusterIP      10.96.0.1       <none>         443/TCP          17h
web                    NodePort       10.104.242.53   <none>         8080:30983/TCP   16h
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ minikube service web
|-----------|------|-------------|---------------------------|
| NAMESPACE | NAME | TARGET PORT |            URL            |
|-----------|------|-------------|---------------------------|
| default   | web  |        8080 | http://192.168.49.2:30983 |
|-----------|------|-------------|---------------------------|
* Opening service default/web in default browser...
tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ Error: no DISPLAY environment variable specified

tomrausch@tomrausch-HP-Elite-7100-Microtower-PC:~$ ngrok config add-authtoken 2wdpMx1yFjVoPrTc0807FJgtoA6_7sTG13sX9YWN3cXr1RPN2
Authtoken saved to configuration file: /home/tomrausch/.config/ngrok/ngrok.yml
```
