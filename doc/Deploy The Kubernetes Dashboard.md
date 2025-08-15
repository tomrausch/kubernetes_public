
# Deploy The Kubernetes Dashboard
Follow this procedure [Deploy and Access the Kubernetes Dashboard](https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/) | kubernetes.io

Confirm the Pods
```bash
$ kubectl get pods --namespace kubernetes-dashboard
NAME                                                    READY   STATUS    RESTARTS   AGE
kubernetes-dashboard-api-6d84545678-zzv58               1/1     Running   0          57s
kubernetes-dashboard-auth-67898d8759-5dkl9              1/1     Running   0          57s
kubernetes-dashboard-kong-6bf7cb4d8c-dbv2j              1/1     Running   0          57s
kubernetes-dashboard-metrics-scraper-79ddb8cd78-dzlcl   1/1     Running   0          57s
kubernetes-dashboard-web-5c84bb867f-sjjbw               1/1     Running   0          57s
```

Confirm the Services
```bash
$ kubectl get service --namespace kubernetes-dashboard
NAME                                   TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
kubernetes-dashboard-api               ClusterIP   10.100.180.58    <none>        8000/TCP   8m41s
kubernetes-dashboard-auth              ClusterIP   10.100.220.176   <none>        8000/TCP   8m41s
kubernetes-dashboard-kong-proxy        ClusterIP   10.101.161.197   <none>        443/TCP    8m41s
kubernetes-dashboard-metrics-scraper   ClusterIP   10.102.227.183   <none>        8000/TCP   8m41s
kubernetes-dashboard-web               ClusterIP   10.98.218.124    <none>        8000/TCP   8m41s
```

Create the Ingress
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kubernetes-dashboard/kubernetes-dashboard-ingress.yaml"
ingress.networking.k8s.io/ingress-kubernetes-dashboard created
```

[NOT NEEDED] Create the Network Policy
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kubernetes-dashboard/kubernetes-dashboard-networkpolicy.yaml"
networkpolicy.networking.k8s.io/kubernetes-dashboard-ingress created
```

Create the Service Account
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kubernetes-dashboard/kubernetes-dashboard-serviceaccount-dashboard-admin-sa.yaml"
serviceaccount/dashboard-admin-sa created
```

Create the Cluster Role Binding
```bash
$ kubectl create -f "https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kubernetes-dashboard/kubernetes-dashboard-clusterrolebinding-dashboard-admin-crb.yaml"
rolebinding.rbac.authorization.k8s.io/kubernetes created
```

Obtain a bearer token
```bash
$ kubectl -n kubernetes-dashboard create token dashboard-admin-sa
eyJhbGciOiJSUzI1NiIsImtpZCI6InViWWhGY1ZGaDc1VS1Xa0RUX1k0UWo2MW9WZUFBZWlacGZaRlNMRDRZc3cifQ.eyJhdWQiOlsiaHR0cHM6Ly9rdWJlcm5ldGVzLmRlZmF1bHQuc3ZjLmNsdXN0ZXIubG9jYWwiXSwiZXhwIjoxNzU1MjE3Njk3LCJpYXQiOjE3NTUyMTQwOTcsImlzcyI6Imh0dHBzOi8va3ViZXJuZXRlcy5kZWZhdWx0LnN2Yy5jbHVzdGVyLmxvY2FsIiwia3ViZXJuZXRlcy5pbyI6eyJuYW1lc3BhY2UiOiJrdWJlcm5ldGVzLWRhc2hib2FyZCIsInNlcnZpY2VhY2NvdW50Ijp7Im5hbWUiOiJkZWZhdWx0IiwidWlkIjoiNzkyMmMzMDEtMTA5MS00MDQ0LWI2ZmYtOTAyZTZhNjUwNjFhIn19LCJuYmYiOjE3NTUyMTQwOTcsInN1YiI6InN5c3RlbTpzZXJ2aWNlYWNjb3VudDprdWJlcm5ldGVzLWRhc2hib2FyZDpkZWZhdWx0In0.eLIgb3IHABYtGtWyk1F7bDOrgvj7oFj_HwoN4vhJDpwvMXofoGvnVpQq51DS_J6PnihrAsLXPETJogJeX1YGuJDS644mYvFyjOd7gv2aKBOrRwJjsc-Sc3vRrO9bKSTgI5JLktyOp_QCF2UNws8wLIYOH-rJpyaV_x9CUQt6sWe7wgqCunBjEl5tqs0Wm5saMayMxL1RwGGzneR3B_J8_7dHz8kes4DCUAeyvt9-nOXzhP-6vwvGz9FLyW79sIq3SywMl5jd_TOzusv1KCdAsPf0zMqDVTeXL8gNJbNNve2vECQBSafIbUFwj2Dir1gVlyuPEZB7KKzP8Uf2K0FfDA
```

Use the bearer token to authenticate to the Kubernetes Dashboard application

<img width="1658" height="609" alt="image" src="https://github.com/user-attachments/assets/bbcba828-a9f2-4b22-94df-e0f1dc6cacc9" />


## Reference
- [how to configure ingress to direct traffic to an https backend using https](https://stackoverflow.com/questions/54459015/how-to-configure-ingress-to-direct-traffic-to-an-https-backend-using-https) | StackOverflow


