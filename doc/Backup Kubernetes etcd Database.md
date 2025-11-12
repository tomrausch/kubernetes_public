Confirm etcdctl is installed

```bash
$ etcdctl version
etcdctl version: 3.5.16
API version: 3.5
```

Get endpoints

```bash
$ sudo cat /etc/kubernetes/manifests/etcd.yaml | grep listen
    - --listen-client-urls=https://127.0.0.1:2379,https://192.168.0.136:2379         ## Value of "endpoints" in command
    - --listen-metrics-urls=http://127.0.0.1:2381
    - --listen-peer-urls=https://192.168.0.136:2380
```

Get certificates

```bash
$ sudo cat /etc/kubernetes/manifests/etcd.yaml | grep file
    - --cert-file=/etc/kubernetes/pki/etcd/server.crt          ## Value of "cert" in command
    - --key-file=/etc/kubernetes/pki/etcd/server.key           ## Value of "key" in command
    - --peer-cert-file=/etc/kubernetes/pki/etcd/peer.crt
    - --peer-key-file=/etc/kubernetes/pki/etcd/peer.key
    - --peer-trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt
    - --trusted-ca-file=/etc/kubernetes/pki/etcd/ca.crt        ## Value of "cacert" in command
    seccompProfile:
```

Compose command

```bash
sudo ETCDCTL_API=3 etcdctl \
--endpoints=https://127.0.0.1:2379 \
--cacert=/etc/kubernetes/pki/etcd/ca.crt \
--cert=/etc/kubernetes/pki/etcd/server.crt \
--key=/etc/kubernetes/pki/etcd/server.key \
snapshot save <backup-file-location>
```

Run command

```bash
$ sudo ETCDCTL_API=3 etcdctl --endpoints=https://127.0.0.1:2379 --cert=/etc/kubernetes/pki/etcd/server.crt --key=/etc/kubernetes/pki/etcd/server.key --cacert=/etc/kubernetes/pki/etcd/ca.crt snapshot save $HOME/snapshot.db
{"level":"info","ts":"2025-11-12T14:17:01.939237-0600","caller":"snapshot/v3_snapshot.go:65","msg":"created temporary db file","path":"/home/thomas-rausch/snapshot.db.part"}
{"level":"info","ts":"2025-11-12T14:17:01.952486-0600","logger":"client","caller":"v3/maintenance.go:212","msg":"opened snapshot stream; downloading"}
{"level":"info","ts":"2025-11-12T14:17:01.952532-0600","caller":"snapshot/v3_snapshot.go:73","msg":"fetching snapshot","endpoint":"https://127.0.0.1:2379"}
{"level":"info","ts":"2025-11-12T14:17:02.114950-0600","logger":"client","caller":"v3/maintenance.go:220","msg":"completed snapshot read; closing"}
{"level":"info","ts":"2025-11-12T14:17:02.173150-0600","caller":"snapshot/v3_snapshot.go:88","msg":"fetched snapshot","endpoint":"https://127.0.0.1:2379","size":"12 MB","took":"now"}
{"level":"info","ts":"2025-11-12T14:17:02.173305-0600","caller":"snapshot/v3_snapshot.go:97","msg":"saved","path":"/home/thomas-rausch/snapshot.db"}
Snapshot saved at /home/thomas-rausch/snapshot.db
```

Observe backup file 
```bash
$ ls -l
total 11592
drwxrwxr-x 3 thomas-rausch thomas-rausch     4096 Aug 17 07:59 Bash
drwxr-xr-x 2 thomas-rausch thomas-rausch     4096 Aug 12 10:14 Desktop
drwxr-xr-x 3 thomas-rausch thomas-rausch     4096 Nov  2 14:53 Documents
drwxr-xr-x 4 thomas-rausch thomas-rausch     4096 Nov  6 16:22 Downloads
drwxr-xr-x 2 thomas-rausch thomas-rausch     4096 Aug 12 10:14 Music
drwxr-xr-x 3 thomas-rausch thomas-rausch     4096 Aug 12 16:20 Pictures
drwxr-xr-x 2 thomas-rausch thomas-rausch     4096 Aug 12 10:14 Public
drwxr-xr-x 2 thomas-rausch thomas-rausch     4096 Aug 12 10:14 Templates
drwxr-xr-x 2 thomas-rausch thomas-rausch     4096 Aug 12 10:14 Videos
drwx------ 9 thomas-rausch thomas-rausch     4096 Nov  6 16:16 snap
-rw------- 1 root          root          11825184 Nov 12 14:17 snapshot.db
```

# References
- [Backup and restore etcd cluster on Kubernetes](https://medium.com/@mehmetodabashi/backup-and-restore-etcd-cluster-on-kubernetes-93c19b1c070) | Medium
- [Operating etcd clusters for Kubernetes](https://kubernetes.io/docs/tasks/administer-cluster/configure-upgrade-etcd/) | kubernetes.io
