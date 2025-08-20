#!/bin/bash
# Description: Get (list) all Pods not in Status.Phase = 'Running' and not in Status.Phase = 'Succeeded' in all namespaces
# Reference:   https://medium.com/@obaff/10-bash-scripts-for-troubleshooting-kubernetes-issues-cde367ae4ac3
if [ "$1" == "-h" ]; then
  echo "Usage  : $0"
  echo "kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase!=Succeeded -o wide"
  exit 1
fi
kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase!=Succeeded -o wide
