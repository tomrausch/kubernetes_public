#!/bin/bash
# Description: Delete All Jobs In State "Successful" In A Single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
NAMESPACE=$1
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl delete jobs -n "$NAMESPACE" --field-selector=status.successful=1
