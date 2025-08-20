#!/bin/bash
# Description: Top (get CPU and Memory utilization) for all Pods in all Namespaces
#              (Optional) Sort by "cpu" or by "memory"
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage  : $0 [<sortby>: cpu|memory]"
  echo "Command: kubectl top pods --all-namespaces [--sort-by=<sortby>]"
  exit 1
fi
SORTBY="$1"
if [ -z "$SORTBY"]; then
  kubectl top pods --all-namespaces
else
 kubectl top pods --all-namespaces --sort-by="$SORTBY"
fi
