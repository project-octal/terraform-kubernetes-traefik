resource "kubernetes_namespace" "namespace" {
  metadata {
    name = var.namespace
    labels = merge({
      "app.kubernetes.io/name"       = var.namespace
      "app.kubernetes.io/component"  = "namespace"
      "app.kubernetes.io/instance"   = local.instance_id
      "app.kubernetes.io/managed-by" = "Terraform"
    }, local.labels)
    annotations = merge({
    }, var.annotations)
  }
}