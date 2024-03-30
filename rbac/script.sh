kubectl apply -f .

kubectl auth can-i get pods --as=jane -n default
kubectl auth can-i create deployments --as=admin
