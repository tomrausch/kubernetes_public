#!/bin/bash
# Description: Delete all Pods (Restart Pods) in a single namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
NAMESPACE="${1:-default}"
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl delete pod --all -n "$NAMESPACE"
