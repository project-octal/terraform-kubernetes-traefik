resource "kubernetes_service" "service" {
  metadata {
    name      = local.name
    namespace = kubernetes_namespace.namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name"       = local.name
      "app.kubernetes.io/component"  = "service-account"
      "app.kubernetes.io/instance"   = local.instance_id
      "app.kubernetes.io/managed-by" = "Terraform"
    }, local.labels)
  }
  spec {
    type = var.service_type
    selector = {
      "app.kubernetes.io/name"     = local.name
      "app.kubernetes.io/instance" = local.instance_id
    }
    port {
      name        = "web"
      protocol    = "TCP"
      port        = 80
      target_port = "web"
    }
    port {
      name        = "websecure"
      protocol    = "TCP"
      port        = 443
      target_port = "websecure"
    }
  }
}