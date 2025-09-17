# Run A Busybox Pod On Kubernetes
To run BusyBox on Kubernetes, use ```kubectl``` to create a pod with the busybox image and specify a command to keep it running [^cant-start-busybox-pod]
- The basic busybox image doesn't inherently run a process.

## Create a Pod with BusyBox
Create a pod with this comamnd
```bash
kubectl run busybox-pod --image=busybox --namespace default --command -- /bin/sh -c 'while true; do sleep 30; done' --restart=Never
```

Here are the components of the comamnd
- Name: busybox-pod [^run-busybox-image-busybox-restart-never]
  - ```kubectl run busybox-pod```
  - Creates a pod named busybox-pod
- Image: busybox [^run-busybox-image-busybox-restart-never]
  - ```--image=busybox```
  - Specifies the busybox image
- Namespace: default
- Simple command to keep the pod running [^run-busybox-image-busybox-restart-never]
  - ```--command -- /bin/sh -c '...'``` 
  - Provides the command to execute within the container
  - This command creates an infinite loop that sleeps for 30 seconds, preventing the container from exiting immediately  
- Restart: Never [^some-things-you-didnt-know-about-kubectl]
  - ```--restart=Never``` 
  - Prevents the pod from restarting if it exits.
  - For testing purposes, this is often what you want.

Here is an alternate command
```bash
kubectl run busybox-pod --image=busybox --namespace default --command sleep infinity --restart=Never
```

Here is an alternate command that creates an Ubuntu container

```bash
kubectl run ubuntu --image=ubuntu --namespace default --command sleep infinity --restart=Never
```

## Check the Pod's Status
```bash
kubectl get pods
```

You should see the ```busybox-pod``` listed as ```Running```
```bash
NAME          READY   STATUS    RESTARTS   AGE
busybox-pod   1/1     Running   0          10m
```

## Accessing the Pod
Use the command ```kubectl exec``` to run commands inside the busybox [^how-can-i-keep-a-container-running-on-kubernetes]
```bash
kubectl exec -it busybox-pod -- /bin/sh
```

This will open an interactive shell within the pod. [^is-it-possible-to-install-curl-into-busybox-in-kubernetes]
- Remember to exit the shell when you're done. 

Interact with the pod
```bash
$ kubectl exec busybox -it -- hostname
busybox
$ kubectl exec busybox -it -- hostname -i
172.16.77.136
```


## Why This Works
- The busybox image is a minimal Linux environment containing many common command-line utilities. It doesn't have a built-in server or process that runs continuously. 
- Without a command to keep it running, a busybox pod will start, execute the command (if any), and then exit. Kubernetes will then restart the pod according to the restartPolicy (which is Always by default, but we explicitly set it to Never in this case). 
- By providing a while true; do sleep 30; done loop, we ensure that the container stays active and doesn't crash, allowing you to interact with it or use it for testing purposes. [^run-busybox-image-busybox-restart-never], [^some-things-you-didnt-know-about-kubectl], [^is-it-possible-to-install-curl-into-busybox-in-kubernetes], [^kubernetes-init-containers], [^kubernetes-pods]

## Important Considerations

### Resource Usage
BusyBox is lightweight, but it's still good practice to specify resource limits and requests for your containers, especially in a production environment. You can add a resources section to your pod definition (as shown in the provided YAML examples). 

### Health Checks
For more robust deployments, consider adding health checks (liveness and readiness probes) to your pod definition. This allows Kubernetes to detect when your container is not functioning as expected and take appropriate action. 

### Alternative Commands
You can replace the sleep command with any other command that keeps the container running, such as running a simple web server using httpd or a simple ping command to test network connectivity. [^local-kubernetes-guide], [^building-optimized-containers-for-kubernetes], [^hot-reloading-with-busybox-httpd]

[^cant-start-busybox-pod]: [Can't start busybox pod](https://serverfault.com/questions/1098192/cant-start-busybox-pod) | StackExchange
[^run-busybox-image-busybox-restart-never]: [Kubectl run busybox –image=busybox –restart=Never – /bin/sh -c ‘env’](https://kodekloud.com/community/t/kubectl-run-busybox-image-busybox-restart-never-bin-sh-c-env/21499) | KodeKloud
[^some-things-you-didnt-know-about-kubectl]: [Some things you didn’t know about kubectl](https://kubernetes.io/blog/2015/10/some-things-you-didnt-know-about-kubectl_28/) | kubernetes.io
[^how-can-i-keep-a-container-running-on-kubernetes]: [How can I keep a container running on Kubernetes?](https://stackoverflow.com/questions/31870222/how-can-i-keep-a-container-running-on-kubernetes) | StackOverflow
[^is-it-possible-to-install-curl-into-busybox-in-kubernetes]: [Is it possible to install curl into busybox in kubernetes pod](https://stackoverflow.com/questions/62847331/is-it-possible-to-install-curl-into-busybox-in-kubernetes-pod) | StackOverflow
[^kubernetes-init-containers]: [Kubernetes Init Containers](https://www.alibabacloud.com/blog/kubernetes-init-containers_594725) | Alibaba Cloud
[^kubernetes-pods]: [Kubernetes - pods for everyone](https://sendilkumarn.com/blog/kubernetes-pods) | @sendilkumarn
[^local-kubernetes-guide]: [Local Kubernetes: A Comprehensive Guide to Local Development](https://www.plural.sh/blog/local-kubernetes-guide/)
[^building-optimized-containers-for-kubernetes]: [Building Optimized Containers for Kubernetes](https://www.digitalocean.com/community/tutorials/building-optimized-containers-for-kubernetes) | Digital Ocean
[^hot-reloading-with-busybox-httpd]: [Hot-reloading with busybox httpd](https://queil.net/2023/01/hot-reloading-with-busybox-httpd/) | queil.net
