#!/bin/bash
# Description: Scale a Deployment
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ] ; then
  echo "Usage  : $0 <deployment> <replicas> <namespace>"
  echo "Defaults:""
  echo "- '<deployment>' = 'it-tools'"
  echo "- '<replicas>' = '1'"
  echo "- '<namespace>' = 'default'"
  echo "Command: kubectl scale deployment <deployment> --replicas=<replicas> -n <namespace>"
  exit 1
fi
DEPLOYMENT="${1:-it-tools}"
REPLICAS="${2:-1}"
NAMESPACE="${3:-default}"
kubectl scale deployment "$DEPLOYMENT" --replicas="$REPLICAS" -n "$NAMESPACE"
