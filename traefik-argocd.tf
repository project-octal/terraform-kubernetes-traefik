module "argocd-application" {
  source             = "github.com/dylanturn/terraform-kubernetes-argocd-application"
  argocd_namespace   = var.argocd_namespace
  destination_server = "https://kubernetes.default.svc"
  name               = "traefik"
  path               = ""
  release_name       = "traefik"
  namespace          = kubernetes_namespace.traefik_namespace.metadata.0.name
  project            = var.argocd_project
  repo_url           = var.chart_repo
  chart              = var.chart_name
  target_revision    = var.chart_version
  #helm_values        = #local.traefik_values
  #helm_parameters    = []
}