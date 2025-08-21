#!/bin/bash
# Description: Create a token for the Kubernetes Dashboard
# Reference:   Front page of Kubernetes Dashboard
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
  echo "Usage: $0"
  echo "Command: kubectl create token dashboard-admin-sa -n kubernetes-dashboard"
  exit 1
fi
kubectl create token dashboard-admin-sa -n kubernetes-dashboard
