resource "kubernetes_namespace" "traefik_namespace" {
  metadata {
    name = var.namespace
    labels = merge({
      "app.kubernetes.io/name" : var.namespace
      "app.kubernetes.io/component" : "namespace"
    }, local.labels)
    annotations = merge({
    }, var.namespace_annotations)
  }
}