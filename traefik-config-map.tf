resource "kubernetes_config_map" "traefik_config_map" {
  metadata {
    name      = "traefik-configmap"
    namespace = kubernetes_namespace.traefik_namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "config-map"
    }, local.labels)
    annotations = {}
  }
  data = {
    "ca.crt"     = base64decode(var.kubernetes_cluster_base64_ca_certificate)
  }
}