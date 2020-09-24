locals {
  labels = merge({
    "app.kubernetes.io/part-of" : "traefik"
  }, var.labels)
}