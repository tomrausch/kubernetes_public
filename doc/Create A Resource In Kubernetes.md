# Create A Resource In Kubernetes


## Cluster Role

| Documenation | YAML
| :---: |  :---: | 
| [kubectl create clusterrole](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_clusterrole/) | [clusterrole.yaml](https://github.com/tomrausch/kubernetes_public/blob/5337a9d00aeec913a9acf8f49bb933118555681b/src/sample_yaml/clusterrole.yaml) |

```
kubectl create clusterrole NAME --verb=verb --resource=resource.group [--resource-name=resourcename] [--dry-run=server|client|none]

$ kubectl create clusterrole pvviewer-role --verb=list --resource=PersistentVolumes -o yaml --dry-run=server
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  creationTimestamp: "2025-07-22T14:13:02Z"
  name: pvviewer-role
  uid: b09fe3ed-cd14-4fff-aec4-1c67d940a4b5
rules:
- apiGroups:
  - ""
  resources:
  - persistentvolumes
  verbs:
  - list

$ kubectl create clusterrole pvviewer-role --verb=list --resource=PersistentVolumes
clusterrole.rbac.authorization.k8s.io/pvviewer-role created

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


## Service Account

| Documenation | YAML
| :---: |  :---: | 
| [kubectl create serviceaccount](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_serviceaccount/) | [serviceaccount.yaml](https://github.com/tomrausch/kubernetes_public/blob/ef867c74b1bcadb4d33203866624b832351f9e64/src/sample_yaml/serviceaccount.yaml) |

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


## Create cluster role binding

$ kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
Picture2 2

Verify

$ kubectl auth can-i list PersistentVolumes –as system:serviceaccount:default:pvviewer
