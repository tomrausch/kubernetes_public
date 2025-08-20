#!/bin/bash
# Description: Top (get CPU and Memory utilization) for all Pods in a single Namespace
#              (Optional) Sort by CPU or by MEMORY
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage  : $0 <namespace> [<sortby>: cpu|memory]"
  echo 
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl top pods -n <namespace> [--sort-by=<sortby>]"
  exit 1
fi
NAMESPACE="${1:-default}"
SORTBY="$2"
if [ -z "$2"]; then
  kubectl top pods -n "$NAMESPACE"
else
 kubectl top pods -n "$NAMESPACE" --sort-by="$SORTBY"
fi
