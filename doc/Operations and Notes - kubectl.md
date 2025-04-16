# Checks

## Check Kubernetes and Docker CLI
```
$ kuberctl version
$ docker version
```

## Confirm The Service Is Running In A Pod
Run this ```kubectl``` command and observe this result to confirm the Service is running in a pod
```bash
$ kubectl get pods -A -o wide | grep it-tools
default       it-tools-6f9bd54c48-7cwlq          1/1     Running   0              3m24s   10.244.0.7     minikube   <none>           <none>
```

> [!NOTE]
> Note the pod IP address is "10.224.0.7"

## Confirm An Endpoint Is Assigned To The Service
Run this ```kubectl``` command and observe this result to confirm that an Endpoint is assigned to the Service
```bash
$ kubectl get endpoints it-tools
NAME       ENDPOINTS       AGE
it-tools   10.244.0.7:80   16m
```

> [!NOTE]
> The IP address of the endpoint -- "10.224.0.7" -- should match the IP address of the pod -- "10.244.0.7".

# References
- [kubernetes service not accessible through browser](https://stackoverflow.com/questions/66289053/kubernetes-service-not-accessible-through-browser) | StackOverflow
- [Exposing an External IP Address to Access an Application in a Cluster](https://kubernetes.io/docs/tutorials/stateless-application/expose-external-ip-address/) | kubernetes.io
