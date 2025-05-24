## 

## Create Namespaces

```
$ kubectl create namespace vscode
namespace/vscode created
$ kubectl create namespace keycloak
namespace/keycloak created
```


## Add Helm Repository bitnami

```
$ helm repo add bitnami https://charts.bitnami.com/bitnami
"bitnami" has been added to your repositories
$ helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "bitnami" chart repository
Update Complete. ⎈Happy Helming!⎈
```

## Install keycloak

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



## References
- [Building a Secure Cloud IDE: Setting Up VS Code on Kubernetes with Keycloak Authentication](https://medium.com/@subhraj07/building-a-secure-cloud-ide-setting-up-vs-code-on-kubernetes-with-keycloak-authentication-f2769f828585) | Medium
- [DNS on GKE: Everything you need to know](https://medium.com/google-cloud/dns-on-gke-everything-you-need-to-know-b961303f9153) | Medium


