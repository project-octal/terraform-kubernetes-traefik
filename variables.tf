variable "kubernetes_cluster_base64_ca_certificate" {
    type = string
    description = "The target clusters base64 encoded CA certificate"
}
variable "namespace" {
  type        = string
  description = "(optional) The name given to the namespace in which Traefik will reside."
  default     = "kube-traefik"
}
variable "labels" {
  type        = map(string)
  description = "(optional) A map that consists of any additional labels that should be included with resources created by this module."
  default     = {}
}
variable "traefik_image" {
  type        = string
  description = "The image to use for the `traefik-ingress` deployment"
  default     = "library/traefik"
}
variable "traefik_image_tag" {
  type        = string
  description = "The version of Traefik to deploy."
  default     = "v2.3.0"
}
variable "image_repository" {
  type        = string
  description = "The image repository to use when pulling images."
  default     = "registry.hub.docker.com"
}
variable "image_pull_policy" {
  type        = string
  description = "Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. | `IfNotPresent`: Only pull the image if it does not already exist on the node. | `Never`: Never pull the image"
  default     = "Always"
}
variable "traefik_log_level" {
  type        = string
  description = "(optional) The level at Traefik should be logging at. Options are `INFO`, `DEBUG`, and `TRACE`."
  default     = "INFO"
}