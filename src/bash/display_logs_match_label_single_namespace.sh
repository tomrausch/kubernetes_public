#!/bin/bash
# Description: Display Logs of all Pods matching a specific Label in a single Namespace
# Reference:   https://medium.com/devops-dev/top-16-kubernetes-scripts-for-streamlined-cluster-management-24bc24c867e8
LABEL="$1"                  # e.g. app=nginx
NAMESPACE="${2:-default}"
if [ -z "$LABEL" ]; then
  echo "Usage: $0 <label> <namespace>"
  echo "Default: '<namespace>' = 'default'
  exit 1
fi
for POD in $(kubectl get pods -n "$NAMESPACE" -l "$LABEL" -o name); do
  echo "=== $POD ==="
  kubectl logs -f -n "$NAMESPACE" "$POD" &
done
