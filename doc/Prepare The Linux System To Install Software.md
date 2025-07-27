# Prepare The Linux System To Install Software

## Prevent The Linux System From Hibernating Or Going To Sleep [^1]
```
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

## Disable The Disk Swap File [^2]
```
$ sudo swapoff -a
$ sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
```

## Update All Existing System Packages
```
$ sudo apt-get update
```

[^1]: [How do I disable my system from going to sleep?](https://askubuntu.com/questions/47311/how-do-i-disable-my-system-from-going-to-sleep) | Ask Ubuntu
[^2]: [How to Install Kubernetes on Ubuntu 22.04](https://phoenixnap.com/kb/install-kubernetes-on-ubuntu#Deploy_Kubernetes) | phoenixNAP
