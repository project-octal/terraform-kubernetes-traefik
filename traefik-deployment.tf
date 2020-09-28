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
        service_account_name             = kubernetes_service_account.traefik_service_account.metadata.0.name
        termination_grace_period_seconds = 60
        container {
          name              = "traefik-ingress"
          image             = "${var.image_repository}/${var.traefik_image}:${var.traefik_image_tag}"
          image_pull_policy = var.image_pull_policy
          args = [
            "--api=true",
            "--providers.kubernetesingress=true",
            "--log=true",
            "--log.format=json",
            "--log.level=${var.traefik_log_level}"
          ]
          port {
            name           = "http"
            container_port = 80
          }
          port {
            name           = "admin"
            container_port = 8080
          }
          volume_mount {
            name = "service-account-token"
            mount_path = "/var/run/secrets/kubernetes.io/serviceaccount/"
            read_only = true
          }
          volume_mount {
            name = "traefik-config"
            mount_path = "/var/run/secrets/kubernetes.io/serviceaccount/"
          }
        }
        volume {
          name = "traefik-config"
          config_map {
            name = kubernetes_config_map.traefik_config_map.metadata.0.name
          }
        }
        volume {
          name = "service-account-token"
          projected {
            sources {
              service_account_token {
                path = "token"
                expiration_seconds = 7200
                audience = "api"
              }
            }
          }
        }
      }
    
    }
  
  }

}