#!/bin/bash
# Description: Top (get CPU and Memory utilization) for all Pods in a single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage  : $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl top pods -n <namespace>'"
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl top pods -n "$NAMESPACE"
