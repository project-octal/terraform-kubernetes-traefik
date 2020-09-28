resource "kubernetes_service_account" "traefik_service_account" {
  metadata {
    name      = "traefik-ingress"
    namespace = "kube-system"
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "service-account"
    }, local.labels)
    annotations = {}
  }
}