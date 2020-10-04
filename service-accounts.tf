resource "kubernetes_service_account" "service_account" {
  metadata {
    name = "traefik"
    namespace = kubernetes_namespace.namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name" = "traefik"
      "app.kubernetes.io/component" = "service-account"
    }, local.labels)
  }
}