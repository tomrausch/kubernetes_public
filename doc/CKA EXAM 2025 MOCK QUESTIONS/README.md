# CKA EXAM 2025 MOCK QUESTIONS | NeoKloud 

## References
- [CKA EXAM 2025 MOCK QUESTION 16 CRD](https://www.youtube.com/watch?v=hQXCkTU6Xbw&list=PLvOcEsRqg0tKO1znOiZN5fhdAY2DCTvFY) | NeoKloud, YouTube Playlist

## Files
- [QUESTION 01 - STORAGE CLASS](https://github.com/tomrausch/kubernetes_public/blob/main/doc/CKA%20EXAM%202025%20MOCK%20QUESTIONS/QUESTION%2001.STORAGE%20CLASS.md)
- [Ad Hoc Questions](https://github.com/tomrausch/kubernetes_public/blob/main/doc/CKA%20EXAM%202025%20MOCK%20QUESTIONS/Ad%20Hoc%20Questions.md)

## Prerequisites
Set alias
```bash
controlplane:~$ alias k=kubectl
controlplane:~$ k
kubectl controls the Kubernetes cluster manager.
...
```

Confirm nano editor present
```bash
controlplane:~$ nano
```

#### Get The Cluster
```bash
controlplane:~$ kubectl config get-clusters
NAME
kubernetes
```

#### Get The Context
```bash
controlplane:~$ kubectl config get-contexts
CURRENT   NAME                          CLUSTER      AUTHINFO           NAMESPACE
*         kubernetes-admin@kubernetes   kubernetes   kubernetes-admin   
```
