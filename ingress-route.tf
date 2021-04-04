# locals {
#   dashboard_ingress_route = {
#     apiVersion = "traefik.containo.us/v1alpha1"
#     kind       = "IngressRoute"
#     metadata = {
#       name      = "${local.name}-dashboard"
#       namespace = kubernetes_namespace.namespace.metadata.0.name
#       labels = merge({
#         "app.kubernetes.io/part-of"    = local.name
#         "app.kubernetes.io/instance"   = local.instance_id
#         "app.kubernetes.io/managed-by" = "Terraform"
#       }, var.labels)
#     }
#     spec = {
#       entryPoints = [
#         "traefik"
#       ]
#       routes = [
#         {
#           match = "PathPrefix(`/dashboard`) || PathPrefix(`/api`)"
#           kind  = "Rule"
#           services = [
#             {
#               name = "api@internal"
#               kind = "TraefikService"
#             }
#           ]
#         }
#       ]
#     }
#   }
# }
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