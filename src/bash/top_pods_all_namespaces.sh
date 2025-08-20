#!/bin/bash
# Description: Top (get CPU and Memory utilization) for all Pods in all Namespaces
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage  : $0"
  echo "Command: kubectl top pods --all-namespaces"
  exit 1
fi
kubectl top pods --all-namespaces
