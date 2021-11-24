resource "kubernetes_manifest" "ingress_class" {
  depends_on = [
    kubernetes_manifest.ingress_route,
    kubernetes_manifest.ingress_route_tcp,
    kubernetes_manifest.ingress_route_udp,
    kubernetes_manifest.middlewares,
    kubernetes_manifest.tls_options,
    kubernetes_manifest.tls_stores,
    kubernetes_manifest.traefik_services
  ]
  manifest = {
    apiVersion = "networking.k8s.io/v1"
    kind       = "IngressClass"
    metadata = {
      name = var.ingress_class_name
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