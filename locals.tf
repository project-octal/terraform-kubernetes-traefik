resource "random_pet" "instance_name" {}
locals {

  name = "traefik"

  cpu_request    = var.resource_requests.cpu == null ? "100m" : var.resource_requests.cpu
  memory_request = var.resource_requests.memory == null ? "50Mi" : var.resource_requests.memory

  cpu_limit    = var.resource_limits.cpu == null ? "300m" : var.resource_limits.cpu
  memory_limit = var.resource_limits.memory == null ? "150Mi" : var.resource_limits.memory

  instance_id = random_pet.instance_name.id
  labels = merge({
    "app.kubernetes.io/part-of"    = local.name
    "app.kubernetes.io/instance"   = local.instance_id
    "app.kubernetes.io/managed-by" = "terraform"
  }, var.labels)
}