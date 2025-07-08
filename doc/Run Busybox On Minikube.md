# Run BusyBox on Minikube
To run BusyBox on Minikube, you can use kubectl to create a pod with the busybox image and specify a command to keep it running, as the basic busybox image doesn't inherently run a process.

Here's a breakdown of how to do it, including best practices and explanations: [^1],[^2]  

## Start Minikube

First, ensure Minikube is running

```bash
minikube start
```

## Create a Pod with BusyBox

Use kubectl to create a pod named busybox-pod with the busybox image and a simple command to keep it running

```bash
kubectl run busybox-pod --image=busybox --command -- /bin/sh -c 'while true; do sleep 30; done' --restart=Never
```

- ```kubectl run busybox-pod``` [^3]
  - Creates a pod named busybox-pod
- ```--image=busybox``` [^3]
  - Specifies the busybox image
- ```--command -- /bin/sh -c '...'``` [^3]
  - Provides the command to execute within the container
  - This command creates an infinite loop that sleeps for 30 seconds, preventing the container from exiting immediately  
- ```--restart=Never``` [^4]
  - Prevents the pod from restarting if it exits.
  - For testing purposes, this is often what you want.

## Check the Pod's Status
```bash
kubectl get pods
```
You should see the ```busybox-pod``` listed as ```Running```

```bash
NAME          READY   STATUS    RESTARTS   AGE
busybox-pod   1/1     Running   0          10m
```


## Accessing the Pod (Optional)
If you need to interact with the pod, you can use kubectl exec to run commands inside it.

For example: [^5]

```bash
kubectl exec -it busybox-pod -- /bin/sh
```

This will open an interactive shell within the pod. Remember to exit the shell when you're done. [^6]

### Why This Works

- The busybox image is a minimal Linux environment containing many common command-line utilities. It doesn't have a built-in server or process that runs continuously. 
- Without a command to keep it running, a busybox pod will start, execute the command (if any), and then exit. Kubernetes will then restart the pod according to the restartPolicy (which is Always by default, but we explicitly set it to Never in this case). 
- By providing a while true; do sleep 30; done loop, we ensure that the container stays active and doesn't crash, allowing you to interact with it or use it for testing purposes. [^3], [^4], [^6], [^7], [^8]

### Important Considerations

#### Resource Usage
BusyBox is lightweight, but it's still good practice to specify resource limits and requests for your containers, especially in a production environment. You can add a resources section to your pod definition (as shown in the provided YAML examples). 

#### Health Checks
For more robust deployments, consider adding health checks (liveness and readiness probes) to your pod definition. This allows Kubernetes to detect when your container is not functioning as expected and take appropriate action. 

#### Alternative Commands
You can replace the sleep command with any other command that keeps the container running, such as running a simple web server using httpd or a simple ping command to test network connectivity. [^9], [^10], [^11]


By following these steps, you can successfully run busybox within your Minikube cluster and use it for various testing and troubleshooting scenarios. [^12]  

[^1]: https://serverfault.com/questions/1098192/cant-start-busybox-pod
[^2]: https://minikube.sigs.k8s.io/docs/commands/image/
[^3]: https://kodekloud.com/community/t/kubectl-run-busybox-image-busybox-restart-never-bin-sh-c-env/21499
[^4]: https://kubernetes.io/blog/2015/10/some-things-you-didnt-know-about-kubectl_28/
[^5]: https://stackoverflow.com/questions/31870222/how-can-i-keep-a-container-running-on-kubernetes
[^6]: https://stackoverflow.com/questions/62847331/is-it-possible-to-install-curl-into-busybox-in-kubernetes-pod
[^7]: https://www.alibabacloud.com/blog/kubernetes-init-containers_594725
[^8]: https://sendilkumarn.com/blog/kubernetes-pods
[^9]: https://www.plural.sh/blog/local-kubernetes-guide/
[^10]: https://www.digitalocean.com/community/tutorials/building-optimized-containers-for-kubernetes
[^11]: https://queil.net/2023/01/hot-reloading-with-busybox-httpd/
[^12]: https://scalablehuman.com/2024/11/08/accessing-api-in-minikube-a-complete-guide/
