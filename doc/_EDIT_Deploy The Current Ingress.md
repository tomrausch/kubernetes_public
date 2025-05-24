# Deploy The ngrok Ingress

## Confirm The Services
Run the command ```kubectl get service``` and observe the result to confirm the services

```bash
$ kubectl get service
NAME               TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
bar-service        ClusterIP   10.110.116.70   <none>        8080/TCP         12m
foo-service        ClusterIP   10.98.156.172   <none>        8080/TCP         12m
hello-blue-whale   NodePort    10.97.31.110    <none>        80:30834/TCP     17h
hello-minikube     NodePort    10.101.43.136   <none>        8080:31389/TCP   24m
it-tools           NodePort    10.99.234.168   <none>        80:31026/TCP     16h
kuard              NodePort    10.107.50.119   <none>        8080:30518/TCP   6s
kubernetes         ClusterIP   10.96.0.1       <none>        443/TCP          2d13h
web                NodePort    10.104.242.53   <none>        8080:30983/TCP   2d12h
```

## Add The Services To The ngrok Ingress

Add the services to the ngrok Ingress definition
- [ngrok.Ingress.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/ngrok/ngrok.Ingress.yaml)

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ngrok/ngrok.Ingress.yaml``` and observe the result to apply or update the 
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ngrok/ngrok.Ingress.yaml
ingress.networking.k8s.io/ngrok-ingress created
```

## Confirm The Services Are Defined In The ngrok Ingress

Run the command ```kubectl get ingress``` and observe the result to view the Ingress
```bash
$ kubectl get ingress
NAME            CLASS   HOSTS                      ADDRESS   PORTS   AGE
ngrok-ingress   ngrok   example-ingress.ngrok.io             80      70s
```

Run the command ```kubectl describe Ingress ngrok-ingress``` and observe the result to confirm the current Ingress exposes the correct Paths

```bash
$ kubectl describe Ingress ngrok-ingress
Name:             ngrok-ingress
Labels:           <none>
Namespace:        default
Address:
Ingress Class:    ngrok
Default backend:  <default>
Rules:
  Host                      Path  Backends
  ----                      ----  --------
  example-ingress.ngrok.io
                            /foo                foo-service:80 (10.244.0.14:8080)
                            /bar                bar-service:80 (10.244.0.15:8080)
                            /hello-blue-whale   hello-blue-whale:80 (10.244.0.12:80)
                            /hello-minikube     hello-minikube:80 (10.244.0.13:8080)
                            /it-tools           it-tools:80 (10.244.0.11:80)
                            /kuard              kuard:80 (10.244.0.16:8080)
                            /web                web:80 (10.244.0.10:8080)
Annotations:                <none>
Events:                     <none>
```

Reference
- [Set up an external Application Load Balancer with Ingress](https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer) | Google Cloud
