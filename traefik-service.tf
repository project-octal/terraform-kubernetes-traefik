resource "kubernetes_service" "traefik_ingress_service" {
  metadata {
    name      = "traefik-ingress-service"
    namespace = kubernetes_namespace.traefik_namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress-service"
      "app.kubernetes.io/component" : "service"
    }, local.labels)
    annotations = {}
  }
  spec {
    type = "NodePort"
    selector = {
      "app.kubernetes.io/name" = kubernetes_deployment.traefik_deployment.metadata.0.name
    }
    port {
      name     = "web"
      protocol = "TCP"
      port     = 80
    }
    port {
      name     = "admin"
      protocol = "TCP"
      port     = 8080
    }
  }
}