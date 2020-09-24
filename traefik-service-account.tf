resource "kubernetes_service_account" "traefik_service_account" {
  metadata {
    name      = "traefik-ingress"
    namespace = kubernetes_namespace.traefik_namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "service-account"
    }, local.labels)
    annotations = {}
  }
}