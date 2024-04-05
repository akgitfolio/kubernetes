Using Helm with Kubernetes provides a convenient way to package, deploy, and manage applications as Helm charts. Helm also offers templating capabilities to customize configurations for different environments.

helm init

helm create mychart

helm package .

helm install myrelease mychart-<version>.tgz

helm list

helm upgrade myrelease mychart-<new-version>.tgz

helm rollback myrelease <revision-number>

helm uninstall myrelease
