kubectl apply -f redis-statefulset.yaml
kubectl get statefulsets
kubectl get pods -l app=redis
kubectl get pvc -l app=redis
