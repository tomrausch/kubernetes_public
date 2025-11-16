# CKA EXAM 2025 MOCK QUESTIONS | NeoKloud 

## References
- [CKA EXAM 2025 MOCK QUESTION 16 CRD](https://www.youtube.com/watch?v=hQXCkTU6Xbw&list=PLvOcEsRqg0tKO1znOiZN5fhdAY2DCTvFY) (Playlist) | NeoKloud 


## Prerequisites
Set alias
```
controlplane:~$ alias k=kubectl
controlplane:~$ k
kubectl controls the Kubernetes cluster manager.
...
```

Confirm nano editor present
```
controlplane:~$ nano
```

#### Get The Cluster
```
controlplane:~$ kubectl config get-clusters
NAME
kubernetes
```

#### Get The Context
```
controlplane:~$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```

## Files

- [QUESTION 01 - STORAGE CLASS]("C:\Users\tomra\OneDrive\Documents\_CKA Exam\CKA EXAM 2025 MOCK QUESTION 16 CRD\CKA EXAM 2025 MOCK QUESTION 01 - STORAGE CLASS.md")

## Ad-Hoc Questions
### Identify Pods By Label
```
controlplane:~$ kubectl get pods --namespace kube-system -l component=etcd
NAME                READY   STATUS    RESTARTS      AGE
etcd-controlplane   1/1     Running   1 (57m ago)   27d
```


================================
🔳
✅ 
