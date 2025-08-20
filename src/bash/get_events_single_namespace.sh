#!/bin/bash
# Description: Get Events in a single Namespace, sort by lastTimestamp
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [[ "$1" == "-h" ]]; then
  echo "Usage: $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl get events -n "$NAMESPACE" --sort-by='.lastTimestamp'
