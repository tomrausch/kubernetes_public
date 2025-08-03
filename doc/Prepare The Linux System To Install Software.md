# Prepare The Linux System To Install Software


## Install The OpenSSH Server
```bash
$ sudo apt-get install openssh-server
```

## Install Basic Packages
```bash
$ sudo apt-get install apt-transport-https apticron bash-completion build-essential bzip2 ca-certificates curl debian-goodies etckeeper ethtool firehol gdebi-core git gnupg htop iperf less lshw lsof mtr-tiny nano ncftp net-tools nmap pastebinit psmisc python3-scapy rsync screen ssh sudo systemd-resolved tcpdump unzip vim vlan wget xbase-clients xclip zsh
```

## Prevent The Linux System From Hibernating Or Going To Sleep [^1]
```bash
$ sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
Created symlink /etc/systemd/system/sleep.target → /dev/null.
Created symlink /etc/systemd/system/suspend.target → /dev/null.
Created symlink /etc/systemd/system/hibernate.target → /dev/null.
Created symlink /etc/systemd/system/hybrid-sleep.target → /dev/null.
```

## Disable The Disk Swap File [^2]
Disable all swap spaces with the command [swapoff](https://linux.die.net/man/8/swapoff)
```bash
$ sudo swapoff -a
```

Comment out all lines in file '/etc/fstab'
```bash
$ sudo nano /etc/fstab
```

- Preface all lines with a hash character "#"

- Confirm the file '/etc/fstab'
```bash
$ cat /etc/fstab
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/ubuntu-vg/ubuntu-lv during curtin installation
# /dev/disk/by-id/dm-uuid-LVM-krKZ6WsC0ZJypL7cPWMIE3MJFkdKhOZCZtG90SWuPz5NlUdgZbFdkcXwDecAKGZC / ext4 defaults 0 1
# /boot was on /dev/sda2 during curtin installation
# /dev/disk/by-uuid/b712d386-8463-4fb4-b92f-0c0cb7720485 /boot ext4 defaults 0 1
# /swap.img     none    swap    sw      0       0
```


## Remove Unneeded Packages
```bash
sudo apt autoremove
```


## Update All Existing System Packages
```bash
$ sudo apt-get update
<Output Depends Upon Updated Packages>

$ sudo apt-get upgrade
<Output Depends Upon Upgraded Packages>
```


[^1]: [How do I disable my system from going to sleep?](https://askubuntu.com/questions/47311/how-do-i-disable-my-system-from-going-to-sleep) | Ask Ubuntu
[^2]: [How to Install Kubernetes on Ubuntu 22.04](https://phoenixnap.com/kb/install-kubernetes-on-ubuntu#Deploy_Kubernetes) | phoenixNAP
