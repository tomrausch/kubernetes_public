#!/bin/bash
# Description: Create a token for the Kubernetes Dashboard
# Reference:   Front page of Kubernetes Dashboard
kubectl -n kubernetes-dashboard create token dashboard-admin-sa
