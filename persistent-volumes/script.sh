kubectl apply -f pv.yaml
kubectl apply -f pvc.yaml
kubectl apply -f sfs.yaml


kubectl get statefulsets
kubectl get pods -l app=redis
kubectl get pvc
