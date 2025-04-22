# Confirm The Service

## Confirm The Service Is Exposed

Run the command ```kubectl get svc <service-name>``` and observe the result to confirm the Service is exposed
### The Service Is Not Made Available Externally
```bash
$ kubectl get svc it-tools
NAME       TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)        AGE
it-tools   LoadBalancer   34.118.234.2   <none>         80:31554/TCP   20h
```

### The Service Is Made Available Externally
```bash
$ kubectl get svc it-tools
NAME       TYPE           CLUSTER-IP     EXTERNAL-IP    PORT(S)        AGE
it-tools   LoadBalancer   34.118.234.2   34.9.147.141   80:31554/TCP   20h
```

> [!IMPORTANT]  
> - *NAME* is the name of the Service
> - *TYPE* is the type of the Service, usually LoadBalancer
> - *CLUSTER-IP* is the Cluster IP of the Service
> - *EXTERNAL-IP*
>   - *EXTERNAL-IP* is "\<none\>" if the Service is not shared externally
>   - *EXTERNAL-IP* is the external IP address if the Service is shared externally
> - *PORT(S)* is of the form "\<internal-tcp-port\>:\<external-tcp-port\>"


### Confirm The Service Is Associated With A Pod And The Pod Is Running
Run the commmand ```kubectl get pods -A -o wide``` and observe the result to confirm the Service is assoicated with a Pod and the Pod is running
```bash
$ kubectl get pods -A -o wide
NAMESPACE   NAME                        READY   STATUS    RESTARTS   AGE   IP             NODE                                         NOMINATED NODE   READINESS GATES
default     it-tools-84d87f44c8-ptz5c   1/1     Running   0          20h   10.102.128.3   gk3-thomas-rausch-dev-pool-2-b112addd-26zf   <none>           <none>
```

> [!IMPORTANT]  
> - *NAME* is the name of the Pod
> - *READY* is "x" of "x"
> - *STATUS* is "Running"
> - *IP* is the internal IP Address of the Pod
> - *NODE* is the name of the Node


### Confirm An Endpoint Is Assigned To The Service
Run the command ```kubectl get endpoints <service-name>``` and observe the result to confirm an Endpoint is assigned to the Service
```bash
$ kubectl get endpoints it-tools
NAME       ENDPOINTS         AGE
it-tools   10.102.128.3:80   20h
```

> [!IMPORTANT]  
> - *NAME* is the name of the Service
> - *ENDPOINT* is of the form "\<internal-ip-address\>:\<internal-tcp-port\>"
>   - "\<internal-ip-address\>" matches the internal IP Address of the Pod in the results of the command ```kubectl get pods -A -o wide```
>   - "\<internal-tcp-port\>" matches the "\<internal-tcp-port\>" in the results of the command ```kubectl get svc <service-name>``


# Create And Preserve YAML Files (Optional)

Run these ```kubectl``` commands to "get" the Kubernetes API Resources in YAML format
```bash
$ kubectl get Deployment it-tools -o yaml > it-tools.Deployment.yaml
$ kubectl get Service it-tools -o yaml > it-tools.Service.yaml
```

Save the output files in this GitHub respository

A technician can then apply the Kubernetes API Resources with these command
```bash
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Deployment.yaml
deployment.apps/it-tools created
$ kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/it-tools/it-tools.Service.yaml
service/it-tools created
```
