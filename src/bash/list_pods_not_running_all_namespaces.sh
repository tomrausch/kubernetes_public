#!/bin/bash
# Description: List pods not in 'Running' or 'Completed' state
# Reference:   https://medium.com/@obaff/10-bash-scripts-for-troubleshooting-kubernetes-issues-cde367ae4ac3
kubectl get pods --all-namespaces --field-selector=status.phase!=Running,status.phase!=Succeeded -o wide
