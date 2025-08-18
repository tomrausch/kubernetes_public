#!/bin/bash
# Description: Get (list) All Pods In State "CrashLoopBackoff" In A Single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
NAMESPACE=$1
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running -o json | jq -r '.items[] | select(.status.containerStatuses[]?.state.waiting?.reason=="CrashLoopBackOff") | .metadata.name'
