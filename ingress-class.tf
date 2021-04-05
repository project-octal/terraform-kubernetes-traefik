locals {
  dashboard_ingress_route = {
    apiVersion = "networking.k8s.io/v1"
    kind       = "IngressClass"
    metadata = {
      name = local.ingress_class
      annotations = {
        "ingressclass.kubernetes.io/is-default-class" = true
      }
      labels = {
        "app.kubernetes.io/name" : local.ingress_class
        "app.kubernetes.io/instance"   = local.instance_id
        "app.kubernetes.io/managed-by" = "Terraform"
      }
    }
    spec = {
      controller = "traefik.io/ingress-controller"
    }
  }
}


# resource "k8s_manifest" "dashboard_ingress_route" {
#   depends_on = [
#     k8s_manifest.ingress_route,
#     k8s_manifest.ingress_route_tcp,
#     k8s_manifest.ingress_route_udp,
#     k8s_manifest.middlewares,
#     k8s_manifest.tls_options,
#     k8s_manifest.tls_stores,
#     k8s_manifest.traefik_services
#   ]
#   content = yamlencode(local.dashboard_ingress_route)
# }