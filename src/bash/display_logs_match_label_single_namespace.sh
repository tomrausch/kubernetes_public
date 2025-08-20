#!/bin/bash
# Description: Display Logs of all Pods matching a specific Label in a single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
if [[ "$1" == "-h" ]]; then
  echo "Usage: $0 <label> <namespace>"
  echo "Default: '<label>' = 'run=busybox-pod'"
  echo "Default: '<namespace>' = 'default'"
  echo "Command for each Pod: kubectl get pods -n <namespace> -l <label> -o name"
  exit 1
fi
LABEL="${1:-run=busybox-pod}"
NAMESPACE="${2:-default}"
for POD in $(kubectl get pods -n "$NAMESPACE" -l "$LABEL" -o name); do
  echo "=== $POD ==="
  kubectl logs -f -n "$NAMESPACE" "$POD" &
done
