# Access Kubernetes Applications Through An NGINX Application Gateway

## Install The NGINX Gateway

### Install The NGINX Gateway On A Bare-Metal Device
Install the NGINX gateway using the deployment for a bare-metal device
```bash
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.1/deploy/static/provider/baremetal/deploy.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
configmap/ingress-nginx-controller created
clusterrole.rbac.authorization.k8s.io/ingress-nginx unchanged
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx unchanged
role.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
service/ingress-nginx-controller-admission created
service/ingress-nginx-controller created
deployment.apps/ingress-nginx-controller created
ingressclass.networking.k8s.io/nginx unchanged
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission configured
serviceaccount/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission unchanged
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission unchanged
role.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
```

This creates the NGINX Controller service as "TYPE" = "NodePort"
```
$ kubectl get services --namespace ingress-nginx
NAME                                 TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
ingress-nginx-controller             NodePort    10.98.151.187    <none>        80:31479/TCP,443:30591/TCP   3m26s
ingress-nginx-controller-admission   ClusterIP   10.110.243.159   <none>        443/TCP                      3m26s
```

Access the NGINX Controller at its URL; the result is "Not Found"
- For this example, the URL for HTTP access is ```http://<ip_address_kubernetes_node>:31479```
- For this example, the URL for HTTPS access is ```https://<ip_address_kubernetes_node>:30591```
- <img width="2023" height="365" alt="image" src="https://github.com/user-attachments/assets/4f395086-9ea2-4842-b10d-e053a2abdf50" />


### Install The NGINX Gateway On A Cloud Provider
Install the NGINX gateway using the deployment for a cloud provider
```bash
$ kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.9.4/deploy/static/provider/cloud/deploy.yaml
namespace/ingress-nginx created
serviceaccount/ingress-nginx created
serviceaccount/ingress-nginx-admission created
role.rbac.authorization.k8s.io/ingress-nginx created
role.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrole.rbac.authorization.k8s.io/ingress-nginx created
clusterrole.rbac.authorization.k8s.io/ingress-nginx-admission created
rolebinding.rbac.authorization.k8s.io/ingress-nginx created
rolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx created
clusterrolebinding.rbac.authorization.k8s.io/ingress-nginx-admission created
configmap/ingress-nginx-controller created
service/ingress-nginx-controller created
service/ingress-nginx-controller-admission created
deployment.apps/ingress-nginx-controller created
job.batch/ingress-nginx-admission-create created
job.batch/ingress-nginx-admission-patch created
ingressclass.networking.k8s.io/nginx created
networkpolicy.networking.k8s.io/ingress-nginx-admission created
validatingwebhookconfiguration.admissionregistration.k8s.io/ingress-nginx-admission created
```

This creates the NGINX Controller service as "TYPE" = "LoadBalancer"
```
NAME                                 TYPE           CLUSTER-IP       EXTERNAL-IP   PORT(S)                      AGE
ingress-nginx-controller             LoadBalancer   10.98.91.0       <pending>     80:30140/TCP,443:31928/TCP   13m
ingress-nginx-controller-admission   ClusterIP      10.100.67.178    <none>        443/TCP                      13m
```

## Install Several Applications
[Deploy several applications](https://github.com/tomrausch/kubernetes_public/blob/3ca5fdcbd083b7f354f1cee1c6b0fa72c21fa40e/doc/Deploy%20Applications%20On%20Kubernetes.md) on the Kubernetes cluster. Install the applications in the "default" namespace.

In this example, I deployed the following applications.
- hello-blue-whale
- it-tools
- kuard

## Create And Deploy An Ingress Resource
Create an Ingress resource YAML file that references all the installed applications
- Use distinct "host" designations for each application
```
  - host: hello-blue-whale.master-node
  ...
  - host: it-tools.master-node
  ...
  - host: kuard.master-node
```

Here is a reference file
- [ingress-nginx-default-apps.yaml](https://github.com/tomrausch/kubernetes_public/blob/d8a407ae5e27d75e4de9be70545a871f23921312/src/ingress/ingress-nginx-default-apps.yaml)

Create the Ingress resource in the Kubernetes cluster. Create the Ingress resource in the namespace "default".
```bash
$ kubectl create -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/nginx/ingress-nginx-default-apps.yaml
ingress.networking.k8s.io/ingress-default created
```

Confirm the Ingress resource in the Kubernetes cluster
```bash
$ kubectl get ingress --namespace default
NAME              CLASS   HOSTS                                                                 ADDRESS         PORTS   AGE
ingress-default   nginx   hello-blue-whale.master-node,it-tools.master-node,kuard.master-node   192.168.0.241   80      2m18s
```

## Modify The File "hosts"
Add references to the installed applications in the file "hosts". The format is ```<ip_address_of_the_kubernetes_cluster>``` a space, and then the ```host_entry_in_ingress_resource_yaml_file```
```bash
# Kubernetes load balancer namespace "default":
192.168.0.136 hello-blue-whale.master-node
192.168.0.136 it-tools.master-node
192.168.0.136 kuard.master-node
```

## Access The Applications Through The NGINX Gateway
Access the applications through the NGINX gateway. The format of the URL is 

- The URL for HTTP access is ```http://<host_entry_in_hosts_file>:<port_for_http_access_in_nginx_gateway>```
- The URL for HTTPS access is ```https://<host_entry_in_hosts_file>:<port_for_https_access_in_nginx_gateway>```

Here is the application "it-tools" accessed through the NGINX application gateway
- <img width="2402" height="1365" alt="image" src="https://github.com/user-attachments/assets/ba2d65aa-52db-4f2e-9982-e242c1ff0daf" />

Here is the application "kuard" accessed through the NGINX application gateway
- <img width="2413" height="1358" alt="image" src="https://github.com/user-attachments/assets/efe67ebf-5825-4381-b0c9-54f19593b42c" />

## References
- [How to deploy a NodePort Ingress Controller on Kubernetes](https://platform9.com/learn/v1.0/tutorials/nodeport-ingress)
