kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/cloud/deploy.yaml

kubectl get pods -n ingress-nginx

check_add_hosts 127.0.0.1 demo.example.com