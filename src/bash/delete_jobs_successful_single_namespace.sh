#!/bin/bash
# Description: Delete all Jobs in status = "Successful" in a single namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
NAMESPACE="${1:-default}"
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl delete jobs -n "$NAMESPACE" --field-selector=status.successful=1
