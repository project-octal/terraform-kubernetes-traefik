resource "kubernetes_deployment" "traefik_deployment" {
  metadata {
    name      = "traefik-ingress"
    namespace = kubernetes_namespace.traefik_namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name" : "traefik-ingress"
      "app.kubernetes.io/component" : "deployment"
    }, local.labels)
    annotations = {}
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        "app.kubernetes.io/name" : "traefik-ingress"
      }
    }
    template {
      metadata {
        labels = merge({
          "app.kubernetes.io/name" : "traefik-ingress"
        }, local.labels)
      }
      spec {
        service_account_name             = "traefik-ingress"
        termination_grace_period_seconds = 60
        container {
          name = "traefik-ingress"
          image             = "${var.image_repository}/${var.traefik_image}:${var.traefik_image_tag}"
          image_pull_policy = var.image_pull_policy
          args = [
            "--api",
            "--kubernetes",
            "--logLevel=${var.traefik_log_level}"
          ]
          port {
            name           = "http"
            container_port = 80
          }
          port {
            name           = "admin"
            container_port = 8080
          }
        }
      }
    }
  }
}