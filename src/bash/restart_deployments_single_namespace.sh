#!/bin/bash
# Description: Restart all Deployments in a single Namespace
# Reference: https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ]; then
  echo "Usage  : $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl rollout restart deployment -n <namespace>"
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl rollout restart deployment -n "$NAMESPACE"
