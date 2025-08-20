#!/bin/bash
# Description: Get (list) all Containers in all Pods in all Namespaces
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ]; then
  echo "Usage  : $0"
  echo "Command: kubectl get pods --all-namespaces -o=custom-columns=NAMESPACE:.metadata.namespace,POD:.metadata.name,CONTAINER\(S\):.spec.containers[*].name,INIT-CONTAINER\(S\):.spec.initContainers[*].name"
  exit 1
fi
kubectl get pods --all-namespaces -o=custom-columns=NAMESPACE:.metadata.namespace,POD:.metadata.name,CONTAINER\(S\):.spec.containers[*].name,INIT-CONTAINER\(S\):.spec.initContainers[*].name
