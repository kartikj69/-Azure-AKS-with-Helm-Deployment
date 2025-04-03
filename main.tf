resource "helm_release" "nginx" {
  name       = "nginx"
  repository = "https://charts.bitnami.com/bitnami"
  chart      = "nginx"
  version    = "15.1.0"  # Specify a version or omit for latest
  namespace  = "default"
  set {
    name  = "service.type"
    value = "LoadBalancer"  # Changed from ClusterIP to LoadBalancer
  }
  set {
    name  = "service.port"
    value = "80"
  }
  set {
    name  = "replicaCount"
    value = "2"
  }
  set {
    name  = "resources.limits.cpu"
    value = "200m"
  }
  set {
    name  = "resources.limits.memory"
    value = "256Mi"
  }
  timeout = 600
}
