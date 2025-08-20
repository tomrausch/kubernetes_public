#!/bin/bash
# Description: Get (list) all Pods in Status.Phase = 'Running' in a single Namespace
# Reference: https://medium.com/p/24bc24c867e8
if [ "$1" == "-h" ]; then
  echo "Usage  : $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl get pods -n <namespace> --field-selector=status.phase=Running"
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running
