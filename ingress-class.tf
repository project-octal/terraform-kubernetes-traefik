locals {
  ingress_class = {
    apiVersion = "networking.k8s.io/v1"
    kind       = "IngressClass"
    metadata = {
      name = var.ingress_class_name
      annotations = {
        "ingressclass.kubernetes.io/is-default-class" = var.ingress_class_default
      }
      labels = merge({
        "app.kubernetes.io/name"       = var.ingress_class_name
        "app.kubernetes.io/component"  = "ingressclass"
        "app.kubernetes.io/instance"   = local.instance_id
        "app.kubernetes.io/part-of"    = local.name
        "app.kubernetes.io/managed-by" = "Terraform"
      }, var.labels)
    }
    spec = {
      controller = "traefik.io/ingress-controller"
    }
  }
}

resource "k8s_manifest" "ingress_class" {
  depends_on = [
    k8s_manifest.ingress_route,
    k8s_manifest.ingress_route_tcp,
    k8s_manifest.ingress_route_udp,
    k8s_manifest.middlewares,
    k8s_manifest.tls_options,
    k8s_manifest.tls_stores,
    k8s_manifest.traefik_services
  ]
  content = yamlencode(local.ingress_class)
} 