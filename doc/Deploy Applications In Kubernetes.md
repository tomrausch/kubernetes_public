# Deploy Applications In Kubernetes

--------

## ☁️ Deploy A Standard Application

Run the command "Command - Create Deployment" in Table 1 below and observe the result to deploy an image and create the Deployment
```bash
$ kubectl create deployment it-tools --image=corentinth/it-tools:latest
deployment.apps/it-tools created
```

Run the command "Command - Expose Service" in the table below and observe the result to expose the Deployment
```bash
$ kubectl expose deployment it-tools --type=LoadBalancer --port=8080
service/it-tools exposed
```

Perform the checks in [Confirm The Deployment And Service](https://github.com/tomrausch/kubernetes_public/blob/9569089708b8f66adc3a30add0f74f5c53544dd3/doc/Confirm%20The%20Deployment%20And%20Service.md) for Service "service/kuard"


#### Table 1

| Name | Command - Create Deployment | Command - Expose Service | Additional Steps | Reference |
| :---: | :--- | :--- | :---  | :---: |
| hello-blue-whale | ```kubectl create deployment hello-blue-whale --image=vamsijakkula/hello-blue-whale:v1``` | ```kubectl expose deployment hello-blue-whale --type=NodePort --port=80``` | None | [vamsijakkula](https://gist.github.com/vamsijakkula)|
| hello-minikube | ```kubectl create deployment hello-minikube --image=kicbase/echo-server:1.0``` | ```kubectl expose deployment hello-minikube --type=NodePort --port=8080``` | Yes - Below | [minikube start - Deploy Applications - Service](https://minikube.sigs.k8s.io/docs/start/?arch=%2Flinux%2Fx86-64%2Fstable%2Fbinary+download#Service) |
| it-tools | ```kubectl create deployment it-tools --image=corentinth/it-tools:latest``` | ```kubectl expose deployment it-tools --type=NodePort --port=80``` | None | [CorentinTh/it-tools](https://github.com/CorentinTh/it-tools)
| kuard | ```kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue``` | ```kubectl expose deployment kuard --type=NodePort --port=8080``` | None | [kuard](https://github.com/kubernetes-up-and-running/kuard) |
| web | ```kubectl create deployment web gcr.io/google-samples/hello-app:1.0``` | ```kubectl expose deployment web --type=NodePort --port=8080``` | None | [web](https://console.cloud.google.com/artifacts/docker/google-samples/us/gcr.io/hello-app?inv=1&invt=AbxY8g) |


#### Additional Steps "hello-minikube"
Form the YAML file [minikube-test-application.Pod-Service.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml)
- This YAML file contains the Pods and Services for the application
- Reference: [minikube start - Ingress](https://minikube.sigs.k8s.io/docs/start/?arch=%2Fwindows%2Fx86-64%2Fstable%2F.exe+download#Ingress)

Run the command ```kubectl apply -f --image=https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml``` and observe the results. This creates Pods and Services.

```
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/minikube-test-application/minikube-test-application.Pod-Service.yaml
pod/foo-app created
service/foo-service created
pod/bar-app created
service/bar-service created
```

Access the application "foo" in a browser at the offset URL ".../foo"

```
Request served by foo-app

HTTP/1.1 GET /foo

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: c3f9dcbc270c5fcc4b8fd6fc57ec3449/8716341095219747881
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```

Access the application "bar" in a browser at the offset URL ".../bar"

```
Request served by bar-app

HTTP/1.1 GET /bar

Host: 34.8.144.4
Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7
Accept-Encoding: gzip, deflate
Accept-Language: en-US,en;q=0.9
Connection: Keep-Alive
Upgrade-Insecure-Requests: 1
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36
Via: 1.1 google
X-Cloud-Trace-Context: 4533c4d181e326dc16d6d77b7028eec4/12160296242366395395
X-Forwarded-For: 98.253.161.202, 34.8.144.4
X-Forwarded-Proto: http
```



<hr/>

## Deploy VSCode With Keycloak Authentication

### Create Namespaces

```
$ kubectl create namespace vscode
namespace/vscode created
$ kubectl create namespace keycloak
namespace/keycloak created
```


### Add Helm Repository bitnami

```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
"bitnami" has been added to your repositories
$ helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈
```

### Install keycloak

```
$ helm install keycloak bitnami/keycloak --namespace keycloak --set auth.adminUser=admin --set auth.adminPassword=$PassCloak01$ --set postgresql.auth.postgresPassword=$PassGres01$ --set service.type=ClusterIP
NAME: keycloak
LAST DEPLOYED: Mon Apr 28 22:17:26 2025
NAMESPACE: keycloak
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
CHART NAME: keycloak
CHART VERSION: 24.6.1
APP VERSION: 26.2.1

Did you know there are enterprise versions of the Bitnami catalog? For enhanced secure software supply chain features, unlimited pulls from Docker, LTS support, or application customization, see Bitnami Premium or Tanzu Application Catalog. See https://www.arrow.com/globalecs/na/vendors/bitnami for more information.

** Please be patient while the chart is being deployed **

Keycloak can be accessed through the following DNS name from within your cluster:

    keycloak.keycloak.svc.cluster.local (port 80)

To access Keycloak from outside the cluster execute the following commands:

1. Get the Keycloak URL by running these commands:

    export HTTP_SERVICE_PORT=$(kubectl get --namespace keycloak -o jsonpath="{.spec.ports[?(@.name=='http')].port}" services keycloak)
    kubectl port-forward --namespace keycloak svc/keycloak ${HTTP_SERVICE_PORT}:${HTTP_SERVICE_PORT} & echo "http://127.0.0.1:${HTTP_SERVICE_PORT}/"

2. Access Keycloak using the obtained URL.
3. Access the Administration Console using the following credentials:

  echo Username: admin
  echo Password: $(kubectl get secret --namespace keycloak keycloak -o jsonpath="{.data.admin-password}" | base64 -d)

WARNING: There are "resources" sections in the chart not set. Using "resourcesPreset" is not recommended for production. For production installations, please set the following values according to your workload needs:
  - resources
+info https://kubernetes.io/docs/concepts/configuration/manage-resources-containers/
```


keycloak.gke-7982bd164e1c4e0b86a390c66a0dfa818ad8-481851337886.us-central1.gke.goog



### References
- [Building a Secure Cloud IDE: Setting Up VS Code on Kubernetes with Keycloak Authentication](https://medium.com/@subhraj07/building-a-secure-cloud-ide-setting-up-vs-code-on-kubernetes-with-keycloak-authentication-f2769f828585) | Medium
- [DNS on GKE: Everything you need to know](https://medium.com/google-cloud/dns-on-gke-everything-you-need-to-know-b961303f9153) | Medium


