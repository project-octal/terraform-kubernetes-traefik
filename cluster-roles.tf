resource "kubernetes_cluster_role" "cluster_role" {
  metadata {
    name = "traefik"
    labels = merge({
      "app.kubernetes.io/name"       = "traefik"
      "app.kubernetes.io/component"  = "cluster-role"
      "app.kubernetes.io/instance"   = local.instance_id
      "app.kubernetes.io/managed-by" = "Terraform"
    }, local.labels)
  }
  rule {
    api_groups = [
      ""
    ]
    resources = [
      "services",
      "endpoints",
      "secrets"
    ]
    verbs = [
      "get",
      "list",
      "watch"
    ]
  }
  rule {
    api_groups = [
      "extensions",
      "networking.k8s.io"
    ]
    resources = [
      "ingresses",
      "ingressclasses"
    ]
    verbs = [
      "get",
      "list",
      "watch"
    ]
  }
  rule {
    api_groups = [
      "extensions",
      "networking.k8s.io"
    ]
    resources = [
      "ingresses/status"
    ]
    verbs = [
      "update"
    ]
  }
  rule {
    api_groups = [
      "traefik.containo.us"
    ]
    resources = [
      "ingressroutes",
      "ingressroutetcps",
      "ingressrouteudps",
      "middlewares",
      "tlsoptions",
      "tlsstores",
      "traefikservices"
    ]
    verbs = [
      "get",
      "list",
      "watch"
    ]
  }
}