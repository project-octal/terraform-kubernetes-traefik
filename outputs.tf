output "ingress_loadbalancer_ip_list" {
  value = kubernetes_service.service.load_balancer_ingress.*.ip
}