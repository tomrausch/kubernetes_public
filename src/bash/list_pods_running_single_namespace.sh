#!/bin/bash
# Reference: https://medium.com/p/24bc24c867e8
NAMESPACE=$1   # Takes namespace as an argument
echo "NAMESPACE = $1"
if [ -z "$NAMESPACE" ]; then
  echo "Usage: $0 <namespace>"
  exit 1
fi
kubectl get pods -n "$NAMESPACE" --field-selector=status.phase=Running
