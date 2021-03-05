output "ingress_loadbalancer_ip_list" {
  value = kubernetes_service.service.ip
}
output "ingress_class" {
  value = local.ingress_class
}