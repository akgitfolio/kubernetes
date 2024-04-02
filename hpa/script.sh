kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl apply -f deployment.yaml
kubectl apply -f hpa.yaml

hey -z 5m -c 10 http://<nginx-service-ip>
