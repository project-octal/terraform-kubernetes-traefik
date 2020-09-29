locals {
  labels = merge({
    "app.kubernetes.io/part-of" : "traefik"
  }, var.labels)

  traefik_values = {
    image = {
      name = "traefik"
      tag = "2.3.0"
      pullPolicy = "IfNotPresent"
    }
    deployment = {
      enabled = true
      replicas = var.replicas
    }
  }

}