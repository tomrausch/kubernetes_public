# Install Helm Charts



## NGINX Ingress Controller

- Purpose: Expose HTTP/HTTPS traffic into your cluster.
- Documentation: [ingress-nginx](https://github.com/kubernetes/ingress-nginx)
- Commands:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
helm install my-nginx ingress-nginx/ingress-nginx --namespace ingress-nginx --create-namespace
```



## Reference
- [15 Essential Helm Charts for Kubernetes Deployments](https://medium.com/@obaff/15-essential-helm-charts-for-kubernetes-deployments-89dbd4882a09) | [Obafemi](https://medium.com/@obaff/), [Medium](https://medium.com/@obaff/)
