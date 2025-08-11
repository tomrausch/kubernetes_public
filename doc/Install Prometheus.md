# Install Prometheus [^install_promethius]

Install the namespace "prometheus" [^prometheus-namespace]
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-namespace.yaml
namespace/prometheus created
```

Confirm the namespace "prometheus"
```
$ kubectl get namespaces
NAME              STATUS   AGE
default           Active   10d
kube-node-lease   Active   10d
kube-public       Active   10d
kube-system       Active   10d
prometheus        Active   18s
```

Install the ConfigMap "prometheus-server-conf" [^prometheus-server-conf]
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-config.yaml -n prometheus
configmap/prometheus-server-conf created
```

Confirm the ConfigMap "prometheus-server-conf"
```
$ kubectl get ConfigMap -n prometheus
NAME                     DATA   AGE
kube-root-ca.crt         1      19m
prometheus-server-conf   1      14m
```

Install the Deployment "prometheus-server" [^prometheus-server]
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-deployment.yaml -n prometheus
deployment.apps/prometheus-server created
```

Confirm the Deployment "prometheus-server"
```
$ kubectl get deployment -n prometheus
NAME                READY   UP-TO-DATE   AVAILABLE   AGE
prometheus-server   1/1     1            1           15m
```

Install the Service "prometheus-service" [^prometheus-service]
```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-service.yaml -n prometheus
service/prometheus-service created
```

Confirm the Service "prometheus-service"
```
$ kubectl get service prometheus-service -n prometheus
NAME                 TYPE           CLUSTER-IP    EXTERNAL-IP   PORT(S)          AGE
prometheus-service   LoadBalancer   10.106.50.5   <pending>     80:30222/TCP   54s
```

Access Prometheus at this URL [http://192.168.0.136:30222/query](http://192.168.0.136:30222/query)

<img width="3839" height="1899" alt="Screenshot 2025-08-11 183003" src="https://github.com/user-attachments/assets/ed3a11ec-075b-4477-91d6-c98ab54aa2f8" />


[^install_promethius]: [Install Promethius](https://medium.com/@vinoji2005/install-prometheus-on-kubernetes-tutorial-and-example-6b3c800e7e1c) | Medium
[^prometheus-namespace]: [prometheus-namespace.yaml](https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-namespace.yaml)
[^prometheus-server-conf]: [prometheus-config.yaml](https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-config.yaml)
[^prometheus-server]: [prometheus-deployment.yaml](https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-deployment.yaml)
[^prometheus-service]: [prometheus-service.yaml](https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/prometheus/prometheus-service.yaml)
