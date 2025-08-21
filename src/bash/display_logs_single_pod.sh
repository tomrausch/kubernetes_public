#!/bin/bash
# Description: Display Logs of a Pod
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage  : $0 <pod> <namespace> [<container>]"
  echo "Default: '<pod>' = 'busybox-pod'"
  echo "Default: '<namespace>' = 'default'"
  echo "Default: '<container>' - None"
  echo "Command: kubectl logs <pod> -n <namespace> [-c <container>]"
  exit 1
fi
POD="${1:-busybox-pod}"
NAMESPACE="${2:-default}"
CONTAINER="$3"
if [ -z "$CONTAINER" ]; then
  kubectl logs "$POD" -n "$NAMESPACE"
else
  kubectl logs "$POD" -n "$NAMESPACE" -c "$CONTAINER"
fi
