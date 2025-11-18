## HELM ARGOCD

## Progress
- [ ] |✅ Watch Video
- [ ] |✅ Complete All SubQuestions

## References
- [CKA EXAM 2025 MOCK QUESTION 04 HELM ARGOCD](https://www.youtube.com/watch?v=U5DfmuWU58E&list=PLvOcEsRqg0tKO1znOiZN5fhdAY2DCTvFY&index=4) | YouTube
- [Argo Helm Charts](https://argoproj.github.io/argo-helm/) | Argo Helm Charts
- [](https://helm.sh/docs/helm/helm)


## Task
Outline the Helm CLI Steps to https://argoproj.github.io/argo-helm
- Add and upgrade a help repo
- Install ArgoCD v8.0.17 with CRDs enabled in ```argocd```
- Install ArgoCD v8.0.17 with CRDs enabled in ```argocd-no-crds```
- Render both releases to ```argo-cd-crds-enabled.yaml```
- Render both releases to ```argo-cd-crds-disabled.yaml```


## Steps

### Check The helm Environment
```bash
controlplane:~/.cache/helm/repository$ helm env
HELM_BIN="helm"
HELM_BURST_LIMIT="100"
HELM_CACHE_HOME="/root/.cache/helm"
HELM_CONFIG_HOME="/root/.config/helm"
HELM_DATA_HOME="/root/.local/share/helm"
HELM_DEBUG="false"
HELM_KUBEAPISERVER=""
HELM_KUBEASGROUPS=""
HELM_KUBEASUSER=""
HELM_KUBECAFILE=""
HELM_KUBECONTEXT=""
HELM_KUBEINSECURE_SKIP_TLS_VERIFY="false"
HELM_KUBETLS_SERVER_NAME=""
HELM_KUBETOKEN=""
HELM_MAX_HISTORY="10"
HELM_NAMESPACE="default"
HELM_PLUGINS="/root/.local/share/helm/plugins"
HELM_QPS="0.00"
HELM_REGISTRY_CONFIG="/root/.config/helm/registry/config.json"
HELM_REPOSITORY_CACHE="/root/.cache/helm/repository"
HELM_REPOSITORY_CONFIG="/root/.config/helm/repositories.yaml"
```

### Deploy The Repository ```argo```
```bash
controlplane:~$ helm repo add argo https://argoproj.github.io/argo-helm
"argo" has been added to your repositories
```

### List The Repositories
```bash
controlplane:~$ helm repo list  
NAME                    URL                                    
argo                    https://argoproj.github.io/argo-helm   
kubernetes-dashboard    https://kubernetes.github.io/dashboard/
```

### Search For All The Repositories
This is a list of the Charts
```bash
controlplane:~$ helm search repo
NAME                            CHART VERSION   APP VERSION     DESCRIPTION                                       
argo/argo                       1.0.0           v2.12.5         A Helm chart for Argo Workflows                   
argo/argo-cd                    9.1.3           v3.2.0          A Helm chart for Argo CD, a declarative, GitOps...
argo/argo-ci                    1.0.0           v1.0.0-alpha2   A Helm chart for Argo-CI                          
argo/argo-events                2.4.17          v1.9.8          A Helm chart for Argo Events, the event-driven ...
argo/argo-lite                  0.1.0                           Lighweight workflow engine for Kubernetes         
argo/argo-rollouts              2.40.5          v1.8.3          A Helm chart for Argo Rollouts                    
argo/argo-workflows             0.45.28         v3.7.4          A Helm chart for Argo Workflows                   
argo/argocd-applicationset      1.12.1          v0.4.1          A Helm chart for installing ArgoCD ApplicationSet 
argo/argocd-apps                2.0.2                           A Helm chart for managing additional Argo CD Ap...
argo/argocd-image-updater       1.0.1           v1.0.1          A Helm chart for Argo CD Image Updater, a tool ...
argo/argocd-notifications       1.8.1           v1.2.1          A Helm chart for ArgoCD notifications, an add-o...
```

### Search For Versions
```
controlplane:~$ helm search repo kubernetes-dashboard/kubernetes-dashboard --versions
NAME                                            CHART VERSION   APP VERSION     DESCRIPTION                                   
kubernetes-dashboard/kubernetes-dashboard       7.14.0                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.13.0                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.12.0                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.11.1                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.11.0                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.5                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.4                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.3                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.2                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.1                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.10.0                          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.9.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.8.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.7.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.6.1                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.6.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.5.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.4.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.3.2                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.3.1                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.3.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.2.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.1.3                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.1.2                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.1.1                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.1.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.0.1                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       7.0.0                           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       6.0.8           v2.7.0          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       6.0.7           v2.7.0          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       6.0.6           v2.7.0          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       6.0.5           v2.7.0          General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       6.0.0           2.7.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.11.0          2.7.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.10.0          2.6.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.9.0           2.6.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.8.0           2.6.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.7.0           2.6.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.6.0           2.6.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.4.1           2.5.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.3.1           2.5.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.3.0           2.5.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.2.0           2.5.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.1.3           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.1.2           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.1.1           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.6           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.5           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.4           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.3           2.4.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.2           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.1           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       5.0.0           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.6.0           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.5.0           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.4.0           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.3.2           2.3.1           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.3.1           2.3.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.3.0           2.3.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.2.0           2.2.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.1.0           2.2.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.0.3           2.2.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.0.2           2.2.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.0.1           2.1.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       4.0.0           2.1.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       3.0.2           2.1.0           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       3.0.1           2.0.5           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       3.0.0           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.8.3           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.8.2           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.8.1           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.8.0           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.7.1           2.0.4           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.6.0           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.5.0           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.3.0           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.2.0           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.1.1           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.0.3           2.0.3           General-purpose web UI for Kubernetes clusters
kubernetes-dashboard/kubernetes-dashboard       2.0.1           2.0.1           General-purpose web UI for Kubernetes clusters
```


```
Setting the Chart Version for a Release: When installing or upgrading a Helm chart, you can specify a particular chart version to use from a repository. This is done with the --version flag during helm install or helm upgrade.
Code

    helm install my-release my-repo/my-chart --version 1.2.3
    helm upgrade my-release my-repo/my-chart --version 1.2.4
```

```
controlplane:~$ kubectl get pods -A
NAMESPACE            NAME                                      READY   STATUS    RESTARTS      AGE
kube-system          calico-kube-controllers-7bb4b4d4d-8q2r8   1/1     Running   3 (33m ago)   29d
kube-system          canal-djlvw                               2/2     Running   2 (33m ago)   29d
kube-system          canal-kc8m5                               2/2     Running   2 (32m ago)   29d
kube-system          coredns-76bb9b6fb5-4z2mz                  1/1     Running   1 (32m ago)   29d
kube-system          coredns-76bb9b6fb5-7vqcc                  1/1     Running   1 (32m ago)   29d
kube-system          etcd-controlplane                         1/1     Running   2 (33m ago)   29d
kube-system          kube-apiserver-controlplane               1/1     Running   2 (33m ago)   29d
kube-system          kube-controller-manager-controlplane      1/1     Running   2 (33m ago)   29d
kube-system          kube-proxy-6rdfg                          1/1     Running   2 (33m ago)   29d
kube-system          kube-proxy-kgl6s                          1/1     Running   1 (32m ago)   29d
kube-system          kube-scheduler-controlplane               1/1     Running   2 (33m ago)   29d
local-path-storage   local-path-provisioner-76f88ddd78-hs6k4   1/1     Running   2 (33m ago)   29d
controlplane:~$ helm install argo-cd argo/argo-cd --version 9.1.0
```


```
controlplane:~$ helm install argo-cd argo/argo-cd --version 9.1.0
NAME: argo-cd
LAST DEPLOYED: Tue Nov 18 03:00:09 2025
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
In order to access the server UI you have the following options:

1. kubectl port-forward service/argo-cd-argocd-server -n default 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)
controlplane:~$ 
```

```
controlplane:~$ kubectl get pods -A
NAMESPACE            NAME                                                        READY   STATUS    RESTARTS      AGE
default              argo-cd-argocd-application-controller-0                     1/1     Running   0             101s
default              argo-cd-argocd-applicationset-controller-6c5d86bf4c-4zdkt   1/1     Running   0             102s
default              argo-cd-argocd-dex-server-74b5848d69-c7chf                  1/1     Running   0             102s
default              argo-cd-argocd-notifications-controller-7cc89d47f6-k6wtn    1/1     Running   0             101s
default              argo-cd-argocd-redis-5b8fff568-nwk98                        1/1     Running   0             102s
default              argo-cd-argocd-repo-server-69678645dd-wqpds                 1/1     Running   0             102s
default              argo-cd-argocd-server-69f68c95cf-6wbhh                      1/1     Running   0             102s
kube-system          calico-kube-controllers-7bb4b4d4d-8q2r8                     1/1     Running   3 (35m ago)   29d
kube-system          canal-djlvw                                                 2/2     Running   2 (35m ago)   29d
kube-system          canal-kc8m5                                                 2/2     Running   2 (35m ago)   29d
kube-system          coredns-76bb9b6fb5-4z2mz                                    1/1     Running   1 (35m ago)   29d
kube-system          coredns-76bb9b6fb5-7vqcc                                    1/1     Running   1 (35m ago)   29d
kube-system          etcd-controlplane                                           1/1     Running   2 (35m ago)   29d
kube-system          kube-apiserver-controlplane                                 1/1     Running   2 (35m ago)   29d
kube-system          kube-controller-manager-controlplane                        1/1     Running   2 (35m ago)   29d
kube-system          kube-proxy-6rdfg                                            1/1     Running   2 (35m ago)   29d
kube-system          kube-proxy-kgl6s                                            1/1     Running   1 (35m ago)   29d
kube-system          kube-scheduler-controlplane                                 1/1     Running   2 (35m ago)   29d
local-path-storage   local-path-provisioner-76f88ddd78-hs6k4                     1/1     Running   2 (35m ago)   29d
```


```
controlplane:~$ ls -l .cache/helm/repository
total 1604
-rw-r--r-- 1 root root  203757 Nov 18 03:00 argo-cd-9.1.0.tgz
-rw-r--r-- 1 root root     148 Nov 18 02:57 argo-charts.txt
-rw-r--r-- 1 root root 1429805 Nov 18 02:57 argo-index.yaml
```

```
controlplane:~$ helm list                                
NAME    NAMESPACE       REVISION        UPDATED                                 STATUS          CHART           APP VERSION
argo-cd default         1               2025-11-18 03:00:09.521802736 +0000 UTC deployed        argo-cd-9.1.0   v3.2.0     
controlplane:~$ helm upgrade argo-cd argo/argo-cd --version 9.1.1
Release "argo-cd" has been upgraded. Happy Helming!
NAME: argo-cd
LAST DEPLOYED: Tue Nov 18 03:10:41 2025
NAMESPACE: default
STATUS: deployed
REVISION: 2
TEST SUITE: None
NOTES:
In order to access the server UI you have the following options:

1. kubectl port-forward service/argo-cd-argocd-server -n default 8080:443

    and then open the browser on http://localhost:8080 and accept the certificate

2. enable ingress in the values file `server.ingress.enabled` and either
      - Add the annotation for ssl passthrough: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-1-ssl-passthrough
      - Set the `configs.params."server.insecure"` in the values file and terminate SSL at your ingress: https://argo-cd.readthedocs.io/en/stable/operator-manual/ingress/#option-2-multiple-ingress-objects-and-hosts


After reaching the UI the first time you can login with username: admin and the random password generated during the installation. You can find the password by running:

kubectl -n default get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

(You should delete the initial secret afterwards as suggested by the Getting Started Guide: https://argo-cd.readthedocs.io/en/stable/getting_started/#4-login-using-the-cli)
```

```
controlplane:~$ helm show chart argo/argo-cd
annotations:
  artifacthub.io/changes: |
    - kind: changed
      description: Add documentation about breaking changes when upgrading to 9.1.0 for redis-ha dependency
  artifacthub.io/signKey: |
    fingerprint: 2B8F22F57260EFA67BE1C5824B11F800CD9D2252
    url: https://argoproj.github.io/argo-helm/pgp_keys.asc
apiVersion: v2
appVersion: v3.2.0
dependencies:
- condition: redis-ha.enabled
  name: redis-ha
  repository: https://dandydeveloper.github.io/charts/
  version: 4.34.11
description: A Helm chart for Argo CD, a declarative, GitOps continuous delivery tool
  for Kubernetes.
home: https://github.com/argoproj/argo-helm
icon: https://argo-cd.readthedocs.io/en/stable/assets/logo.png
keywords:
- argoproj
- argocd
- gitops
kubeVersion: '>=1.25.0-0'
maintainers:
- name: argoproj
  url: https://argoproj.github.io/
name: argo-cd
sources:
- https://github.com/argoproj/argo-helm/tree/main/charts/argo-cd
- https://github.com/argoproj/argo-cd
version: 9.1.3
```

```
controlplane:~$ helm history argo-cd       
REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
1               Tue Nov 18 03:00:09 2025        superseded      argo-cd-9.1.0   v3.2.0          Install complete
2               Tue Nov 18 03:10:41 2025        deployed        argo-cd-9.1.1   v3.2.0          Upgrade complete
```

```
controlplane:~$ helm history argo-cd       
REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
1               Tue Nov 18 03:00:09 2025        superseded      argo-cd-9.1.0   v3.2.0          Install complete
2               Tue Nov 18 03:10:41 2025        deployed        argo-cd-9.1.1   v3.2.0          Upgrade complete
controlplane:~$ helm rollback argo-cd 1
Rollback was a success! Happy Helming!
controlplane:~$ helm history argo-cd
REVISION        UPDATED                         STATUS          CHART           APP VERSION     DESCRIPTION     
1               Tue Nov 18 03:00:09 2025        superseded      argo-cd-9.1.0   v3.2.0          Install complete
2               Tue Nov 18 03:10:41 2025        superseded      argo-cd-9.1.1   v3.2.0          Upgrade complete
3               Tue Nov 18 03:21:09 2025        deployed        argo-cd-9.1.0   v3.2.0          Rollback to 1
```


===============================================================================================================

### List The Files In The Repository
```bash
controlplane:~$ ls -l .cache/helm/repository
total 1404
-rw-r--r-- 1 root root     148 Nov 18 00:55 argo-charts.txt
-rw-r--r-- 1 root root 1429805 Nov 18 00:55 argo-index.yaml
```

### Update The Repository ```argo```
``` 
controlplane:~$ helm repo update argo                                     
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "argo" chart repository
Update Complete. ⎈Happy Helming!⎈
```

### List Of COmmands
Once you have the list of charts, you can run these commands
```
helm - The Helm package manager for Kubernetes.
helm show all - show all information of the chart
helm show chart - show the chart's definition
helm show crds - show the chart's CRDs
helm show readme - show the chart's README
helm show values - show the chart's values
```





===============================================================================================================



## References
- [Creating a cluster with kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/) | kubernetes.io
- [Installing Addons](https://kubernetes.io/docs/concepts/cluster-administration/addons/) | kubernetes.io

## Task - Install Flannel

### Get The ```cluster-cidr```
```bash
controlplane:~$ cat /etc/kubernetes/manifests/kube-controller-manager.yaml | grep cidr
    - --allocate-node-cidrs=true
    - --cluster-cidr=192.168.0.0/16
```

### Retrieve The Flannel YAML File
```bash
controlplane:~$ wget https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
--2025-11-16 21:19:23--  https://github.com/flannel-io/flannel/releases/latest/download/kube-flannel.yml
Resolving github.com (github.com)... 140.82.114.3
Connecting to github.com (github.com)|140.82.114.3|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://github.com/flannel-io/flannel/releases/download/v0.27.4/kube-flannel.yml [following]
--2025-11-16 21:19:24--  https://github.com/flannel-io/flannel/releases/download/v0.27.4/kube-flannel.yml
Reusing existing connection to github.com:443.
HTTP request sent, awaiting response... 302 Found
Location: https://release-assets.githubusercontent.com/github-production-release-asset/21704134/d04c82f6-0100-47bd-9290-ac53b06dcc91?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-11-16T21%3A56%3A23Z&rscd=attachment%3B+filename%3Dkube-flannel.yml&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-11-16T20%3A55%3A34Z&ske=2025-11-16T21%3A56%3A23Z&sks=b&skv=2018-11-09&sig=TTh%2F8v8jm4Ks6dBjARTVMBw1ksqJ0nQiRe5MUb992OA%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2MzMyODI2NCwibmJmIjoxNzYzMzI3OTY0LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.LW_xZVw4eO-M4ZSwjf4alksCjUcjHOXC1weYNYw09aU&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream [following]
--2025-11-16 21:19:24--  https://release-assets.githubusercontent.com/github-production-release-asset/21704134/d04c82f6-0100-47bd-9290-ac53b06dcc91?sp=r&sv=2018-11-09&sr=b&spr=https&se=2025-11-16T21%3A56%3A23Z&rscd=attachment%3B+filename%3Dkube-flannel.yml&rsct=application%2Foctet-stream&skoid=96c2d410-5711-43a1-aedd-ab1947aa7ab0&sktid=398a6654-997b-47e9-b12b-9515b896b4de&skt=2025-11-16T20%3A55%3A34Z&ske=2025-11-16T21%3A56%3A23Z&sks=b&skv=2018-11-09&sig=TTh%2F8v8jm4Ks6dBjARTVMBw1ksqJ0nQiRe5MUb992OA%3D&jwt=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc2MzMyODI2NCwibmJmIjoxNzYzMzI3OTY0LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.LW_xZVw4eO-M4ZSwjf4alksCjUcjHOXC1weYNYw09aU&response-content-disposition=attachment%3B%20filename%3Dkube-flannel.yml&response-content-type=application%2Foctet-stream
Resolving release-assets.githubusercontent.com (release-assets.githubusercontent.com)... 185.199.109.133, 185.199.110.133, 185.199.108.133, ...
Connecting to release-assets.githubusercontent.com (release-assets.githubusercontent.com)|185.199.109.133|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 4476 (4.4K) [application/octet-stream]
Saving to: 'kube-flannel.yml'

kube-flannel.yml                            100%[==========================================================================================>]   4.37K  --.-KB/s    in 0s      

2025-11-16 21:19:24 (19.9 MB/s) - 'kube-flannel.yml' saved [4476/4476]
```

### Cat The kube-flannel YAML File
```bash
controlplane:~$ cat kube-flannel.yml
```
```yaml
apiVersion: v1
kind: Namespace
metadata:
  labels:
    k8s-app: flannel
    pod-security.kubernetes.io/enforce: privileged
  name: kube-flannel
---
apiVersion: v1
kind: ServiceAccount
metadata:
  labels:
    k8s-app: flannel
  name: flannel
  namespace: kube-flannel
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  labels:
    k8s-app: flannel
  name: flannel
rules:
- apiGroups:
  - ""
  resources:
  - pods
  verbs:
  - get
- apiGroups:
  - ""
  resources:
  - nodes
  verbs:
  - get
  - list
  - watch
- apiGroups:
  - ""
  resources:
  - nodes/status
  verbs:
  - patch
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  labels:
    k8s-app: flannel
  name: flannel
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: flannel
subjects:
- kind: ServiceAccount
  name: flannel
  namespace: kube-flannel
---
apiVersion: v1
data:
  cni-conf.json: |
    {
      "name": "cbr0",
      "cniVersion": "0.3.1",
      "plugins": [
        {
          "type": "flannel",
          "delegate": {
            "hairpinMode": true,
            "isDefaultGateway": true
          }
        },
        {
          "type": "portmap",
          "capabilities": {
            "portMappings": true
          }
        }
      ]
    }
  net-conf.json: |
    {
      "Network": "10.244.0.0/16",
      "EnableNFTables": false,
      "Backend": {
        "Type": "vxlan"
      }
    }
kind: ConfigMap
metadata:
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-cfg
  namespace: kube-flannel
---
apiVersion: apps/v1
kind: DaemonSet
metadata:
  labels:
    app: flannel
    k8s-app: flannel
    tier: node
  name: kube-flannel-ds
  namespace: kube-flannel
spec:
  selector:
    matchLabels:
      app: flannel
      k8s-app: flannel
  template:
    metadata:
      labels:
        app: flannel
        k8s-app: flannel
        tier: node
    spec:
      affinity:
        nodeAffinity:
          requiredDuringSchedulingIgnoredDuringExecution:
            nodeSelectorTerms:
            - matchExpressions:
              - key: kubernetes.io/os
                operator: In
                values:
                - linux
      containers:
      - args:
        - --ip-masq
        - --kube-subnet-mgr
        command:
        - /opt/bin/flanneld
        env:
        - name: POD_NAME
          valueFrom:
            fieldRef:
              fieldPath: metadata.name
        - name: POD_NAMESPACE
          valueFrom:
            fieldRef:
              fieldPath: metadata.namespace
        - name: EVENT_QUEUE_DEPTH
          value: "5000"
        - name: CONT_WHEN_CACHE_NOT_READY
          value: "false"
        image: ghcr.io/flannel-io/flannel:v0.27.4
        name: kube-flannel
        resources:
          requests:
            cpu: 100m
            memory: 50Mi
        securityContext:
          capabilities:
            add:
            - NET_ADMIN
            - NET_RAW
          privileged: false
        volumeMounts:
        - mountPath: /run/flannel
          name: run
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
        - mountPath: /run/xtables.lock
          name: xtables-lock
      hostNetwork: true
      initContainers:
      - args:
        - -f
        - /flannel
        - /opt/cni/bin/flannel
        command:
        - cp
        image: ghcr.io/flannel-io/flannel-cni-plugin:v1.8.0-flannel1
        name: install-cni-plugin
        volumeMounts:
        - mountPath: /opt/cni/bin
          name: cni-plugin
      - args:
        - -f
        - /etc/kube-flannel/cni-conf.json
        - /etc/cni/net.d/10-flannel.conflist
        command:
        - cp
        image: ghcr.io/flannel-io/flannel:v0.27.4
        name: install-cni
        volumeMounts:
        - mountPath: /etc/cni/net.d
          name: cni
        - mountPath: /etc/kube-flannel/
          name: flannel-cfg
      priorityClassName: system-node-critical
      serviceAccountName: flannel
      tolerations:
      - effect: NoSchedule
        operator: Exists
      volumes:
      - hostPath:
          path: /run/flannel
        name: run
      - hostPath:
          path: /opt/cni/bin
        name: cni-plugin
      - hostPath:
          path: /etc/cni/net.d
        name: cni
      - configMap:
          name: kube-flannel-cfg
        name: flannel-cfg
      - hostPath:
          path: /run/xtables.lock
          type: FileOrCreate
        name: xtables-lock
```

### Edit The kube-flannel YAML File
```bash
controlplane:~$ nano kube-flannel.yml
```
```yaml
"Network": "192.168.0.0/16",
```

### Apply The kube-flannel YAML File
```bash
controlplane:~$ k apply -f kube-flannel.yml
namespace/kube-flannel created
serviceaccount/flannel created
clusterrole.rbac.authorization.k8s.io/flannel configured
clusterrolebinding.rbac.authorization.k8s.io/flannel created
configmap/kube-flannel-cfg created
daemonset.apps/kube-flannel-ds created
```

### Confirm The kube-flannel Pods Are Running
```bash
controlplane:~$ k -n kube-flannel get pods
NAME                    READY   STATUS    RESTARTS   AGE
kube-flannel-ds-r265t   1/1     Running   0          84s
kube-flannel-ds-z89ff   1/1     Running   0          84s
```

### Confirm The coredns Pods Are Running
```bash
controlplane:~$ k -n kube-system get pods | grep coredns
coredns-76bb9b6fb5-4z2mz                  1/1     Running   1 (50m ago)   28d
coredns-76bb9b6fb5-7vqcc                  1/1     Running   1 (50m ago)   28d
```

### Confirm The Flannel IP Route Is In Place
```bash
controlplane:~$ ip route | grep flannel
192.168.1.0/24 via 192.168.1.0 dev flannel.1 onlink 
```
## Task - Install Calico

To install Calico, the recommended method is to use the Tigera Operator, which simplifies installation and lifecycle management. Below are the general steps for installing Calico on a Kubernetes cluster using the operator. Please ensure your cluster meets the system requirements before proceeding.

### Install the Tigera Operator and Custom Resource Definitions
```bash
kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml
controlplane:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml
customresourcedefinition.apiextensions.k8s.io/apiservers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/gatewayapis.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/goldmanes.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/imagesets.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/installations.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/managementclusterconnections.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/tigerastatuses.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/whiskers.operator.tigera.io created
customresourcedefinition.apiextensions.k8s.io/bgpfilters.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedglobalnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagedkubernetesnetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/stagednetworkpolicies.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/tiers.crd.projectcalico.org created
customresourcedefinition.apiextensions.k8s.io/adminnetworkpolicies.policy.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/baselineadminnetworkpolicies.policy.networking.k8s.io created
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "bgpconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "bgppeers.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "blockaffinities.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "caliconodestatuses.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "clusterinformations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "felixconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworkpolicies.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "globalnetworksets.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "hostendpoints.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamblocks.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamconfigs.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipamhandles.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ippools.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "ipreservations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "kubecontrollersconfigurations.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "networkpolicies.crd.projectcalico.org" already exists
Error from server (AlreadyExists): error when creating "https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/operator-crds.yaml": customresourcedefinitions.apiextensions.k8s.io "networksets.crd.projectcalico.org" already exists
```

```
controlplane:~$ kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/tigera-operator.yaml
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created
```

### Download the Custom Resources Manifest
Choose the manifest based on your preferred data plane (eBPF or iptables):

For eBPF:
```bash
curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/custom-resources-bpf.yaml
```
For iptables:
```bash
controlplane:~$ curl -O https://raw.githubusercontent.com/projectcalico/calico/v3.31.0/manifests/custom-resources.yaml
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100  1046  100  1046    0     0   2540      0 --:--:-- --:--:-- --:--:--  2538
```
```
controlplane:~$ cat custom-resources.yaml
```
```yaml
# This section includes base Calico installation configuration.
# For more information, see: https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.Installation
apiVersion: operator.tigera.io/v1
kind: Installation
metadata:
  name: default
spec:
  # Configures Calico networking.
  calicoNetwork:
    ipPools:
      - name: default-ipv4-ippool
        blockSize: 26
        cidr: 192.168.0.0/16
        encapsulation: VXLANCrossSubnet
        natOutgoing: Enabled
        nodeSelector: all()

---
# This section configures the Calico API server.
# For more information, see: https://docs.tigera.io/calico/latest/reference/installation/api#operator.tigera.io/v1.APIServer
apiVersion: operator.tigera.io/v1
kind: APIServer
metadata:
  name: default
spec: {}

---
# Configures the Calico Goldmane flow aggregator.
apiVersion: operator.tigera.io/v1
kind: Goldmane
metadata:
  name: default

---
# Configures the Calico Whisker observability UI.
apiVersion: operator.tigera.io/v1
kind: Whisker
metadata:
  name: default
```

You can customize the manifest if needed.

For KILLERCODA, change this
```yaml
  calicoNetwork:
    bgp: Disabled
    ipPools:
      - name: default-ipv4-ippool
        blockSize: 26
        cidr: 192.168.0.0/16
        encapsulation: VXLAN
        natOutgoing: Enabled
        nodeSelector: all()
```

### Apply the Custom Resources Manifest
For eBPF:
```
kubectl create -f custom-resources-bpf.yaml
```
For iptables:
```
controlplane:~$ kubectl create -f custom-resources.yaml
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created
```

### Get Pods
```bash
calico-system        calico-apiserver-57f76664f9-fh8lh         1/1     Running   0             6m31s
calico-system        calico-apiserver-57f76664f9-gs9k7         1/1     Running   0             6m31s
calico-system        calico-kube-controllers-c8959ddcf-xpdrt   1/1     Running   0             6m28s
calico-system        calico-node-49bkv                         0/1     Running   0             6m25s
calico-system        calico-node-6jql4                         0/1     Running   0             6m25s
calico-system        calico-typha-6c45f7d4cd-8xfbp             1/1     Running   0             6m26s
calico-system        csi-node-driver-rfqb7                     2/2     Running   0             6m28s
calico-system        csi-node-driver-sm2c8                     2/2     Running   0             6m28s
calico-system        goldmane-7b6b78f6f-jgwdm                  1/1     Running   0             6m30s
calico-system        whisker-7699f56bc7-qbtsx                  2/2     Running   0             5m2s
```


### Monitor the Deployment
```
watch kubectl get tigerastatus
```
Wait until all Calico components show True in the AVAILABLE column.



====================================================================================================================
Step 2. Install Calico
In this step, you will install Calico in your cluster.

Install the Tigera Operator and custom resource definitions.

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.1/manifests/tigera-operator.yaml


Expected output
namespace/tigera-operator created
serviceaccount/tigera-operator created
clusterrole.rbac.authorization.k8s.io/tigera-operator-secrets created
clusterrole.rbac.authorization.k8s.io/tigera-operator created
clusterrolebinding.rbac.authorization.k8s.io/tigera-operator created
rolebinding.rbac.authorization.k8s.io/tigera-operator-secrets created
deployment.apps/tigera-operator created

Install Calico by creating the necessary custom resources.

kubectl create -f https://raw.githubusercontent.com/projectcalico/calico/v3.31.1/manifests/custom-resources.yaml


Expected output
installation.operator.tigera.io/default created
apiserver.operator.tigera.io/default created
goldmane.operator.tigera.io/default created
whisker.operator.tigera.io/default created

Monitor the deployment by running the following command:

watch kubectl get tigerastatus

After a few minutes, all the Calico components display True in the AVAILABLE column.

Expected output
NAME                            AVAILABLE   PROGRESSING   DEGRADED   SINCE
apiserver                       True        False         False      4m9s
calico                          True        False         False      3m29s
goldmane                        True        False         False      3m39s
ippools                         True        False         False      6m4s
whisker    



====================================================================================================================
