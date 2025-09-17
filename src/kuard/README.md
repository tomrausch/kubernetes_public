🔹 kubectl create deployment kuard --image=gcr.io/kuar-demo/kuard-amd64:blue
🔹 kubectl expose deployment kuard --type=ClusterIP --port=8080
🔹 kubectl apply -f https://raw.githubusercontent.com/tomrausch/kubernetes_public/refs/heads/main/src/kuard/kuard-allow-ingress-controller-networkpolicy.yaml
