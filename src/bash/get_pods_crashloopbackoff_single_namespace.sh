#!/bin/bash
# Description: Get (list) all Pods in Status.Phase = "Running" and Reason = "CrashLoopBackoff" in a single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [ "$1" == "-h" ]; then
  echo "Usage  : $0 <namespace>"
  echo "Default: '<namespace>' = 'default'"
  echo "Command: kubectl get pods -n <namespace> --field-selector=status.phase=Running -o json | jq -r '.items[] | select(.status.containerStatuses[]?.state.waiting?.reason=="CrashLoopBackOff") | .metadata.name'
  exit 1
fi
NAMESPACE="${1:-default}"
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running -o json | jq -r '.items[] | select(.status.containerStatuses[]?.state.waiting?.reason=="CrashLoopBackOff") | .metadata.name'
