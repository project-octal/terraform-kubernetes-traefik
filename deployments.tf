

resource "kubernetes_deployment" "deployment" {
  metadata {
    name      = local.name
    namespace = kubernetes_namespace.namespace.metadata.0.name
    labels = merge({
      "app.kubernetes.io/name"       = local.name
      "app.kubernetes.io/component"  = "deployment"
      "app.kubernetes.io/instance"   = local.instance_id
      "app.kubernetes.io/part-of"    = local.name
      "app.kubernetes.io/managed-by" = "Terraform"
    }, local.labels)
  }
  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        "app.kubernetes.io/name" : local.name
        "app.kubernetes.io/instance" : local.instance_id
      }
    }
    strategy {
      type = "RollingUpdate"
      rolling_update {
        max_surge       = var.rolling_update_max_surge
        max_unavailable = var.rolling_update_max_unavailable
      }
    }
    template {
      metadata {
        name      = local.name
        namespace = kubernetes_namespace.namespace.metadata.0.name
        labels = merge({
          "app.kubernetes.io/name"       = local.name
          "app.kubernetes.io/component"  = "deployment"
          "app.kubernetes.io/instance"   = local.instance_id
          "app.kubernetes.io/part-of"    = local.name
          "app.kubernetes.io/managed-by" = "Terraform"
        }, local.labels)
      }
      spec {

        dynamic "affinity" {
          for_each = var.preferred_node_selector
          content {
            node_affinity {
              preferred_during_scheduling_ignored_during_execution {
                weight = affinity.value["weight"]
                preference {
                  match_expressions {
                    key      = affinity.value["key"]
                    operator = affinity.value["operator"]
                    values   = affinity.value["values"]
                  }
                }
              }
            }
          }
        }

        service_account_name             = kubernetes_service_account.service_account.metadata.0.name
        termination_grace_period_seconds = var.pod_termination_grace_period_seconds
        automount_service_account_token  = false
        host_network                     = false
        container {
          name              = local.name
          image             = "${var.image_repository}/${var.image_name}:${var.image_tag}"
          image_pull_policy = var.image_pull_policy
          args = [
            "--global.checknewversion",
            "--global.sendanonymoususage",
            "--serverstransport.insecureskipverify=true",
            "--entryPoints.web.address=:8000/tcp",
            "--entryPoints.websecure.address=:8443/tcp",
            "--entryPoints.traefik.address=:9000/tcp",
            "--log.level=${var.log_level}",
            "--accesslog=${var.access_logs}",
            "--ping=true",
            "--providers.kubernetescrd",
            "--providers.kubernetesingress",
            "--providers.kubernetesingress.ingressclass=${var.ingress_class_name}",
            "--api.dashboard=${var.enable_dashboard}"
          ]
          resources {
            requests = {
              cpu    = local.cpu_request
              memory = local.memory_request
            }
            limits = {
              cpu    = local.cpu_limit
              memory = local.memory_limit
            }
          }
          readiness_probe {
            http_get {
              path = "/ping"
              port = 9000
            }
            failure_threshold     = 1
            initial_delay_seconds = 10
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 2
          }
          liveness_probe {
            http_get {
              path = "/ping"
              port = 9000
            }
            failure_threshold     = 3
            initial_delay_seconds = 10
            period_seconds        = 10
            success_threshold     = 1
            timeout_seconds       = 2
          }
          security_context {
            capabilities {
              drop = [
                "ALL"
              ]
            }
            read_only_root_filesystem = true
            run_as_non_root           = true
            run_as_user               = 65532
            run_as_group              = 65532
          }
          port {
            name           = "traefik"
            protocol       = "TCP"
            container_port = 9000
          }
          port {
            name           = "web"
            protocol       = "TCP"
            container_port = 8000
          }
          port {
            name           = "websecure"
            protocol       = "TCP"
            container_port = 8443
          }
          volume_mount {
            name       = "service-token"
            mount_path = "/var/run/secrets/kubernetes.io/serviceaccount/"
            read_only  = true
          }
          volume_mount {
            name       = "data"
            mount_path = "/data"
          }
          volume_mount {
            name       = "tmp"
            mount_path = "/tmp"
          }
        }
        volume {
          name = "service-token"
          secret {
            secret_name = kubernetes_service_account.service_account.default_secret_name
          }
        }
        volume {
          name = "data"
          empty_dir {}
        }
        volume {
          name = "tmp"
          empty_dir {}
        }
        security_context {
          fs_group = 65532
        }
      }
    }
  }
}