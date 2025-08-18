#!/bin/bash
# Description: Restart all Deployments in a single namespace
# Reference: https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
NAMESPACE=$1
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl rollout restart deployment -n "$NAMESPACE"
