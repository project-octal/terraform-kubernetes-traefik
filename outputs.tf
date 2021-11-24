output "ingress_class" {
  # Make sure we're avoiding any race conditions here.
  depends_on = [
    kubernetes_deployment.deployment,
    kubernetes_manifest.traefik_services,
    kubernetes_manifest.tls_stores,
    kubernetes_manifest.tls_options,
    kubernetes_manifest.middlewares,
    kubernetes_manifest.ingress_route_udp,
    kubernetes_manifest.ingress_route_tcp,
    kubernetes_manifest.ingress_route
  ]
  value = var.ingress_class_name
}