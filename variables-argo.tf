variable "argocd_namespace" {
  type        = string
  description = "The namespace that ArgoCD resides in"
}
variable "argocd_project" {
  type        = string
  description = "The name of the ArgoCD project that this application will belong to."
}
variable "chart_repo" {
  type = string
  description = "The repo to pull this Traefik chart from"
  default = "https://containous.github.io/traefik-helm-chart"
}
variable "chart_name" {
  type = string
  description = "The name of the Traefik chart to install"
  default = "traefik"
}
variable "chart_version" {
  type        = string
  description = "The version of Traefik to deploy."
  default     = "6.0.2"
}