resource "kubernetes_manifest" "dashboard_ingress_route" {
  count = var.enable_dashboard ? 1 : 0

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
    apiVersion = "traefik.containo.us/v1alpha1"
    kind       = "IngressRoute"
    metadata = {
      name      = "${local.name}-dashboard"
      namespace = kubernetes_namespace.namespace.metadata.0.name
      labels = merge({
        "app.kubernetes.io/name"       = "${local.name}-dashboard"
        "app.kubernetes.io/component"  = "ingressroute"
        "app.kubernetes.io/instance"   = local.instance_id
        "app.kubernetes.io/part-of"    = local.name
        "app.kubernetes.io/managed-by" = "Terraform"
      }, var.labels)
    }
    spec = {
      entryPoints = [
        "traefik"
      ]
      routes = [
        {
          match = "PathPrefix(`/dashboard`) || PathPrefix(`/api`)"
          kind  = "Rule"
          services = [
            {
              name = "api@internal"
              kind = "TraefikService"
            }
          ]
        }
      ]
    }
  }
}