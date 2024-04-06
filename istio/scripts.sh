curl -L https://istio.io/downloadIstio | sh -
cd istio-<version>  # Replace <version> with the latest version number
export PATH=$PWD/bin:$PATH

istioctl install --set profile=demo -y

kubectl get pods -n istio-system

kubectl label namespace default istio-injection=enabled

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/bookinfo/platform/kube/bookinfo.yaml

kubectl get pods

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/bookinfo/networking/bookinfo-gateway.yaml

kubectl get gateway

kubectl get svc istio-ingressgateway -n istio-system

http://<EXTERNAL-IP>:<PORT>/productpage


kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/kiali.yaml
kubectl port-forward svc/kiali 20001:20001 -n istio-system

kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/grafana.yaml
kubectl port-forward svc/grafana 3000:3000 -n istio-system


kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.13/samples/addons/prometheus.yaml
kubectl port-forward svc/prometheus 9090:9090 -n istio-system

kubectl apply -f reviews-virtualservice.yaml
