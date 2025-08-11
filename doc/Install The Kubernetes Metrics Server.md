# Install The Kubernetes Metrics Server

# Install The Kubernetes Metrics Server Components [^install_components]

Run this command to install the Kubernetes Metrics Server components
```
$ kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
serviceaccount/metrics-server unchanged
clusterrole.rbac.authorization.k8s.io/system:aggregated-metrics-reader unchanged
clusterrole.rbac.authorization.k8s.io/system:metrics-server unchanged
rolebinding.rbac.authorization.k8s.io/metrics-server-auth-reader unchanged
clusterrolebinding.rbac.authorization.k8s.io/metrics-server:system:auth-delegator unchanged
clusterrolebinding.rbac.authorization.k8s.io/system:metrics-server unchanged
service/metrics-server unchanged
deployment.apps/metrics-server configured
apiservice.apiregistration.k8s.io/v1beta1.metrics.k8s.io unchanged

```


## Patch The Metrics Server [^patch_metrics_server]
Run this command to patch the Metrics Server Deployment YAML file
```
$ kubectl patch deployment metrics-server -n kube-system --type='json' -p='[
{
"op": "add",
"path": "/spec/template/spec/hostNetwork",
"value": true
},
{
"op": "replace",
"path": "/spec/template/spec/containers/0/args",
"value": [
"--cert-dir=/tmp",
"--secure-port=4443",
"--kubelet-preferred-address-types=InternalIP,ExternalIP,Hostname",
"--kubelet-use-node-status-port",
"--metric-resolution=15s",
"--kubelet-insecure-tls"
]
},
{
"op": "replace",
"path": "/spec/template/spec/containers/0/ports/0/containerPort",
"value": 4443
}
]'
deployment.apps/metrics-server patched
```

## Confirm The Metrics Server Is Running
Confirm the Metrics Server pod is running
```
$ kubectl -n kube-system get pods -l k8s-app=metrics-server
NAME                              READY   STATUS    RESTARTS   AGE
metrics-server-5d98b9469b-vfg7s   1/1     Running   0          6m18s
```

Confirm the Metrics Server API Service is available
```
$ kubectl get apiservices -l k8s-app=metrics-server
NAME                     SERVICE                      AVAILABLE   AGE
v1beta1.metrics.k8s.io   kube-system/metrics-server   True        8d
```

Confirm the Kubernetes nodes present CPU and Memory information
```
$ kubectl top nodes
NAME             CPU(cores)   CPU%   MEMORY(bytes)   MEMORY%
master-node      230m         2%     2678Mi          34%
worker-node-01   106m         2%     2057Mi          28%
```


[^install_components]: [How can I install metrics-server](https://discuss.kubernetes.io/t/how-can-i-install-metrics-server/23518/1) | kubernetes.io
[^patch_metrics_server]: [Fix “error: Metrics API not available” in Kubernetes](https://computingforgeeks.com/fix-error-metrics-api-not-available-in-kubernetes/) | Computing For Geeks
