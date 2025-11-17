# Ad-Hoc Questions

## Identify Pods By Label
```bash
controlplane:~$ kubectl get pods --namespace kube-system -l component=etcd
NAME                READY   STATUS    RESTARTS      AGE
etcd-controlplane   1/1     Running   1 (57m ago)   27d
```
