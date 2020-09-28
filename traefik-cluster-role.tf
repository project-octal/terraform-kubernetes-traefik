resource "kubernetes_cluster_role" "traefik_cluster_role" {
  metadata {
    name = "traefik-ingress"
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "cluster-role"
    }, local.labels)
    annotations = {}
  }
  rule {
    api_groups = [""]
    resources  = ["services", "endpoints", "secrets"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["extensions"]
    resources  = ["ingresses"]
    verbs      = ["get", "list", "watch"]
  }
  rule {
    api_groups = ["extensions"]
    resources = ["ingresses/status"]
    verbs = ["update"]
  }
}

resource "kubernetes_cluster_role_binding" "traefik_cluster_role_binding" {
  metadata {
    name = "traefik-ingress"
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "cluster-role-binding"
    }, local.labels)
    annotations = {}
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = kubernetes_cluster_role.traefik_cluster_role.metadata.0.name
  }
  subject {
    kind      = "ServiceAccount"
    name      = kubernetes_service_account.traefik_service_account.metadata.0.name
    namespace = kubernetes_namespace.traefik_namespace.metadata.0.name
  }
}