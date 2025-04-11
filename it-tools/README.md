# Deploy Application "it-tools" In Kubernetes

# Create Files
## Create File "it-tools_01_deployment.yaml"
Create a deployment
- ```kubectl create deployment it-tools --image=gcr.io/google-samples/kubernetes-bootcamp:v1```

Use kubectl to "get" the deployment in YAML format
- ```kubectl get deployment it-tools -o yaml```

Save the output as "it-tools_01_deployment.yaml"

## Create File "it-tools_02_Service-NodePort.yaml"
Edit manually from previous working "Service-NodePort" YAML file
```yaml
apiVersion: v1
kind: Service
metadata:
  name: it-tools
spec:
  selector:
    app: it-tools
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
      nodePort: 30001   
  type: NodePort
```

# Apply Files In Kubernetes Cluster
- 

# References
- [Corentin Thomasset](https://corentin.tech/)

# Files
- [it-tools_01_deployment.yaml](https://github.com/tomrausch/kubernetes_public/blob/1193b10ebb36365b71dd9fe516c9faf217505f06/it-tools/it-tools_01_Deployment.yaml)
- [it-tools_02_Service-NodePort.yaml](https://github.com/tomrausch/kubernetes_public/blob/main/it-tools/it-tools_02_Service-NodePort.yaml)
