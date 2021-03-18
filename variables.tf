variable "namespace" {
  type        = string
  description = "(optional) The name given to the namespace in which Traefik will reside."
  default     = "kube-traefik"
}
#<<<<<<< HEAD
variable "annotations" {
  type = map(string)
  #=======
  #variable "namespace_annotations" {
  #  type        = map(string)
  #>>>>>>> main
  description = "Additional Traefik namespace annotations (e.g. for `linkerd.io/inject: enabled` for mesh things)"
  default     = {}
}
variable "image_tag" {
  type        = string
  description = "The version of Traefik to deploy"
  default     = "2.3.1"
}
variable "image_name" {
  type        = string
  description = "The image to use when deploying Traefik"
  default     = "library/traefik"
}
variable "image_repository" {
  type        = string
  description = "The image repository to use when pulling images"
  default     = "registry.hub.docker.com"
}
variable "image_pull_policy" {
  type        = string
  description = "Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. | `IfNotPresent`: Only pull the image if it does not already exist on the node. | `Never`: Never pull the image"
  default     = "Always"
}
variable "labels" {
  type        = map(string)
  description = "(optional) A map that consists of any additional labels that should be included with resources created by this module."
  default     = {}
}

variable "access_logs" {
  type        = bool
  description = "Determines whether access logs will be kept."
  default     = "true"
}

variable "log_level" {
  type        = string
  description = "(optional) The level at Traefik should be logging at. Options are `INFO`, `DEBUG`, and `TRACE`."
  default     = "INFO"
}
variable "replicas" {
  type        = number
  description = ""
  default     = 2
}
variable "rolling_update_max_surge" {
  type        = number
  description = ""
  default     = 1
}
variable "rolling_update_max_unavailable" {
  type        = number
  description = ""
  default     = 1
}
variable "pod_termination_grace_period_seconds" {
  type        = number
  description = ""
  default     = 60
}

variable "service_type" {
  type = string
  description = "The type used for this deployments service."
  default = "LoadBalancer"
}

variable "preferred_node_selector" {
  type = list(object({
    weight = number,
    key = string,
    operator = string,
    values = list(string)
  }))
  description = "A list of objects that define `preferredDuringSchedulingIgnoredDuringExecution` for this deployment"
  default = []
}