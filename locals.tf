locals {
  labels = merge({
    "app.kubernetes.io/part-of" : "traefik"
  }, var.labels)

  traefik_values = {
    service = {
      enabled                  = true
      type                     = "LoadBalancer"
      annotations              = var.service_annotations
      spec                     = {}
      loadBalancerSourceRanges = var.service_source_ranges
      externalIPs              = []
    }
    ingressClass = {
      enabled = true
      isDefaultClass = true
    }
    ingressRoute = {
      dashboard = {
        enabled = true
        annotations: {
          kubernetes.io/ingress.class: "traefik"
        }
        labels: {}
      }
    }
  }
}