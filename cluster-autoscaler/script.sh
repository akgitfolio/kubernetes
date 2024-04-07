# kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/aws/examples/cluster-autoscaler-one-asg.yaml
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/gce/manifests/cluster-autoscaler.yaml
# kubectl apply -f https://raw.githubusercontent.com/kubernetes/autoscaler/master/cluster-autoscaler/cloudprovider/azure/examples/cluster-autoscaler.yaml

kubectl get pods -n kube-system | grep cluster-autoscaler
kubectl logs -f deployment/cluster-autoscaler -n kube-system

kubectl apply -f stress-test.yaml
kubectl get nodes -w

kubectl delete -f stress-test.yaml
kubectl get nodes -w
