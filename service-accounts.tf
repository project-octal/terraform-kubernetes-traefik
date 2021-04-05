resource "kubernetes_service_account" "service_account" {
  metadata {
    name      = "traefik"
    namespace = kubernetes_namespace.namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name"       = "traefik"
      "app.kubernetes.io/component"  = "service-account"
      "app.kubernetes.io/instance"   = local.instance_id
      "app.kubernetes.io/managed-by" = "Terraform"
    }, local.labels)
  }
}