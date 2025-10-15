# Deploy Gateway API On Kubernetes

## Install istioctl
Download the installation files
```bash
$ curl -sL https://istio.io/downloadIstioctl | sh -

Downloading istioctl-1.27.2 from https://github.com/istio/istio/releases/download/1.27.2/istioctl-1.27.2-linux-amd64.tar.gz ...
istioctl-1.27.2-linux-amd64.tar.gz download complete!

Add the istioctl to your path with:
  export PATH=$HOME/.istioctl/bin:$PATH

Begin the Istio pre-installation check by running:
         istioctl x precheck

Need more information? Visit https://istio.io/docs/reference/commands/istioctl/
```

Set the PATH
```bash
$ export PATH=$HOME/.istioctl/bin:$PATH
```

Install with a minimal profile
```bash
$ istioctl install --set profile=minimal -y
        |\
        | \
        |  \
        |   \
      /||    \
     / ||     \
    /  ||      \
   /   ||       \
  /    ||        \
 /     ||         \
/______||__________\
____________________
  \__       _____/
     \_____/


The Kubernetes version v1.28.15 is not supported by Istio 1.27.2. The minimum supported Kubernetes version is 1.29.
Proceeding with the installation, but you might experience problems. See https://istio.io/latest/docs/releases/supported-releases/ for a list of supported versions.

✔ Istio core installed ⛵️
✔ Istiod installed 🧠
✔ Installation complete
```

Check the status of the mesh
```bash
$ istioctl proxy-status
NAME     CLUSTER     ISTIOD     VERSION     SUBSCRIBED TYPES
```


## Deploy The Kubernetes API Custom Resource Definitions
```bash
$ kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || { kubectl kustomize "github.com/kubernetes-sigs/gateway-api/config/crd?ref=v1.3.0" | kubectl apply -f -; }
customresourcedefinition.apiextensions.k8s.io/gatewayclasses.gateway.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/gateways.gateway.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/grpcroutes.gateway.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/httproutes.gateway.networking.k8s.io created
customresourcedefinition.apiextensions.k8s.io/referencegrants.gateway.networking.k8s.io created
```



## Configure a Kubernetes API Gateway
Deploy the httpbin test application
```bash
$ kubectl apply -f samples/httpbin/httpbin.yaml
```

**UNFINISHED**

## Reference
- [Gateway API](https://gateway-api.sigs.k8s.io/) | gateway-api
- [Install istioctl](https://istio.io/latest/docs/ops/diagnostic-tools/istioctl/) | Istio
- [Kubernetes Gateway API](https://istio.io/latest/docs/tasks/traffic-management/ingress/gateway-api/) | Istio
