curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update

helm install prometheus prometheus-community/prometheus \
  --namespace monitoring \
  --create-namespace

kubectl get pods -n monitoring

helm install grafana grafana/grafana \
  --namespace monitoring

kubectl get pods -n monitoring

kubectl port-forward svc/grafana 3000:80 -n monitoring


kubectl edit configmap prometheus-server -n monitoring

kubectl edit configmap prometheus-alertmanager -n monitoring
