# Ad-Hoc Questions

## How Identify Pods By Label
```bash
controlplane:~$ kubectl get pods --namespace kube-system -l component=etcd
NAME                READY   STATUS    RESTARTS      AGE
etcd-controlplane   1/1     Running   1 (57m ago)   27d
```


# [I once asked this in an Kubernetes engineer interview](https://www.linkedin.com/posts/govardhana-miriyala-kannaiah_i-once-asked-this-in-an-kubernetes-engineer-activity-7345417074766200832-cQ0p)
**Q**: A pod with no memory limit defined is still getting OOMKilled. What could be the reason?

**A**: Without a memory limit, the pod gets BestEffort QoS and can overconsume node memory. If the node runs out, the kubelet OOMKills such pods first to reclaim memory.
<hr>

**Q**: A HPA is in place, but even under load, replicas remain at 1. What could cause this?

**A**: The metrics server might not be reporting CPU or memory usage properly. Without metric data, the HPA controller would not initiate any scale out actions.
<hr>

**Q**: A Deployment was rolled out, but pods are not created. What should be checked first?

**A**: The Deployment might have failed admission due to validation or mutation webhooks. Events or kubectl describe would show webhook related errors that blocked pod creation.
<hr>

**Q**: You exposed a pod via NodePort, but it's still unreachable externally. What’s likely missing?

**A**: The node level firewall or cloud NACL might be blocking the assigned port. Even though Kubernetes exposes it, the OS would still drop the traffic if not allowed.
<hr>

**Q**: A container image is updated in the registry, but pods are still pulling the old image. Why?

**A**: The deployment might be using an immutable image digest or relying on the default imagePullPolicy: IfNotPresent. In that case, existing nodes would cache the image and avoid pulling the new version.
<hr>

**Q**: You use emptyDir for temporary data, but after a pod restart, all the data is gone. Why?

**A**: That’s expected. emptyDir would be wiped whenever the pod is terminated or rescheduled since it’s tied to the pod lifecycle.
<hr>

