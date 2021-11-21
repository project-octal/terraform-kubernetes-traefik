output "ingress_class" {
  # Make sure we're avoiding any race conditions here.
  depends_on = [
    kubernetes_deployment.deployment,
    k8s_manifest.traefik_services,
    k8s_manifest.tls_stores,
    k8s_manifest.tls_options,
    k8s_manifest.middlewares,
    k8s_manifest.ingress_route_udp,
    k8s_manifest.ingress_route_tcp,
    k8s_manifest.ingress_route
  ]
  value = var.ingress_class_name
}