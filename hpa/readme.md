Horizontal Pod Autoscaler (HPA) in Kubernetes automatically scales the number of pods in a deployment, replication controller, or replica set based on observed CPU utilization (or, with custom metrics support, on some other application-provided metrics).

Metrics Server: Ensure that the Metrics Server is deployed in your cluster. Metrics Server provides resource usage metrics to the HPA controller.
