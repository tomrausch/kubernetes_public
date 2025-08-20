#!/bin/bash
# Description: Delete all Jobs in status = "Successful" in a single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl delete jobs -n <namespace> --field-selector=status.successful=1"
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl delete jobs -n "$NAMESPACE" --field-selector=status.successful=1
