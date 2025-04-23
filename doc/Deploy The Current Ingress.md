# Deploy The Current Ingress

Confirm the [current Ingress](https://github.com/tomrausch/kubernetes_public/blob/main/src/ingress/thomas-rausch-ingress.yaml) exists and contains the desired HTTP and HTTPS Paths

Run the command ```kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ingress/thomas-rausch-ingress.yaml``` and observe the result to confirm the current Ingress is deployed
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/ingress/thomas-rausch-ingress.yaml
ingress.networking.k8s.io/thomas-rausch-ingress configured
```

Run the command ```kubectl describe Ingress thomas-rausch-ingress``` and observe the result to confirm the current Ingress exposes the correct Paths

```bash
$ kubectl describe Ingress thomas-rausch-ingress
Name:             thomas-rausch-ingress
Labels:           <none>
Namespace:        default
Address:          34.8.144.4
Ingress Class:    <none>
Default backend:  <default>
Rules:
  Host        Path  Backends
  ----        ----  --------
  *           
              /it-tools   it-tools:80 (10.102.128.3:80)
              /kuard      kuard:8080 (10.102.128.70:8080)
              /foo        foo-service:8080 (10.102.128.71:8080)
              /bar        bar-service:8080 (10.102.128.132:8080)
Annotations:  ingress.kubernetes.io/backends:
                {"k8s1-fac7b4ee-default-it-tools-80-e2f038e6":"HEALTHY","k8s1-fac7b4ee-default-kuard-8080-7abaa86d":"HEALTHY","k8s1-fac7b4ee-kube-system-d...
              ingress.kubernetes.io/forwarding-rule: k8s2-fr-eajhnegd-default-thomas-rausch-ingress-2cdhun87
              ingress.kubernetes.io/target-proxy: k8s2-tp-eajhnegd-default-thomas-rausch-ingress-2cdhun87
              ingress.kubernetes.io/url-map: k8s2-um-eajhnegd-default-thomas-rausch-ingress-2cdhun87
Events:
  Type    Reason  Age                  From                     Message
  ----    ------  ----                 ----                     -------
  Normal  Sync    82s (x135 over 21h)  loadbalancer-controller  Scheduled for sync
```

Reference
- [Set up an external Application Load Balancer with Ingress](https://cloud.google.com/kubernetes-engine/docs/tutorials/http-balancer) | Google Cloud
