#!/bin/bash
# Description: Get Pods with containers that have failed recently
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
kubectl get pods --all-namespaces -o json | jq -r '.items[] | select(.status.containerStatuses[]?.state.terminated.reason == "Error") | [.metadata.namespace, .metadata.name] | @tsv'
