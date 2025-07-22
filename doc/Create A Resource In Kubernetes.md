# Create A Resource In Kubernetes


## Cluster Role

| Documenation | YAML
| :---: |  :---: | 
| [kubectl create clusterrole](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_clusterrole/) | [ClusterRole.yaml](https://github.com/tomrausch/kubernetes_public/blob/f217a2a4cf56974196ef65c90a4fe706088c6c4f/src/sample_yaml/ClusterRole.yaml) |

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


## Cluster Role Binding

| Documenation | YAML
| :---: |  :---: | 
| [kubectl create clusterrolebinding](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_clusterrolebinding/) | [ClusterRoleBinding.yaml](https://github.com/tomrausch/kubernetes_public/blob/f217a2a4cf56974196ef65c90a4fe706088c6c4f/src/sample_yaml/ClusterRoleBinding.yaml) |

```
kubectl create clusterrolebinding NAME --clusterrole=NAME [--user=username] [--group=groupname] [--serviceaccount=namespace:serviceaccountname] [--dry-run=server|client|none]

$ kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer -o yaml --dry-run=server|client|none
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  creationTimestamp: "2025-07-22T14:48:29Z"
  name: pvviewer-role-binding
  uid: 9aeafeee-35df-4e96-8fc4-24b33c086184
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: pvviewer-role
subjects:
- kind: ServiceAccount
  name: pvviewer
  namespace: default

$ kubectl create clusterrolebinding pvviewer-role-binding --clusterrole=pvviewer-role --serviceaccount=default:pvviewer
clusterrolebinding.rbac.authorization.k8s.io/pvviewer-role-binding created

t$ kubectl describe clusterrolebinding pvviewer-role-binding
Name:         pvviewer-role-binding
Labels:       <none>
Annotations:  <none>
Role:
  Kind:  ClusterRole
  Name:  pvviewer-role
Subjects:
  Kind            Name      Namespace
  ----            ----      ---------
  ServiceAccount  pvviewer  default
```

Verify

```
$ kubectl auth can-i list PersistentVolumes –as system:serviceaccount:default:pvviewer
```



## Service Account

| Documenation | YAML
| :---: |  :---: | 
| [kubectl create serviceaccount](https://kubernetes.io/docs/reference/kubectl/generated/kubectl_create/kubectl_create_serviceaccount/) | [serviceaccount.yaml](https://github.com/tomrausch/kubernetes_public/blob/ef867c74b1bcadb4d33203866624b832351f9e64/src/sample_yaml/serviceaccount.yaml) |

```
kubectl create serviceaccount NAME [--dry-run=server|client|none]

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

## ConfigMap
## Cron Job
## Deployment
## Ingress
## Job
## Namespace
## Pod Disruption Budget
## Priority Class
## Quota
## Role
## Role Binding
## Secret
## Secret Docker Registry
## Secret Generic
## Secret TLS
## Service
## Service ClusterIP
## Service External Name
## Service Load Balancer
## Service Node Port
## Service Account
## Token



## Create cluster role binding

