## Create Service Account

### Synopsis
Create a service account with the specified name.
```
kubectl create serviceaccount NAME [--dry-run=server|client|none]
```

### Example
```
$ kubectl create serviceaccount pvviewer -o yaml --dry-run=server
apiVersion: v1
kind: ServiceAccount
metadata:
  creationTimestamp: "2025-07-22T01:49:14Z"
  name: pvviewer
  namespace: default
  uid: 9bc4422e-b740-420c-b07c-85bb6eeea4f1

$ kubectl create serviceaccount pvviewer -o yaml

$ kubectl describe serviceaccount pvviewer        
Name:                pvviewer
Namespace:           default
Labels:              <none>
Annotations:         <none>
Image pull secrets:  <none>
Mountable secrets:   <none>
Tokens:              <none>
Events:              <none>

```

## Create cluster role
### Command
```
$ kubectl create clusterrole pvviewer-role --verb=list --resource=PersistentVolumes
```
### Reference
[kubectl create clusterrole](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_clusterrole/) | Kubernetes


## Create cluster role binding

$ kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
Picture2 2

Verify

$ kubectl auth can-i list PersistentVolumes –as system:serviceaccount:default:pvviewer
