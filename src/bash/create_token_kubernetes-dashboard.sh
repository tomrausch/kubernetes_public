#!/bin/bash
# Description: Create a token for the Kubernetes Dashboard
# Reference:   Front page of Kubernetes Dashboard
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: $0"
  echo "Command: kubectl -n kubernetes-dashboard create token dashboard-admin-sa"
  exit 1
fi
kubectl -n kubernetes-dashboard create token dashboard-admin-sa
