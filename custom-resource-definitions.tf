resource "k8s_manifest" "ingress_route" {
  content = templatefile("${path.module}/custom-resource-definitions/ingressroute.yaml", {})
}
resource "k8s_manifest" "ingress_route_tcp" {
  content = templatefile("${path.module}/custom-resource-definitions/ingressroutetcp.yaml", {})
}
resource "k8s_manifest" "ingress_route_udp" {
  content = templatefile("${path.module}/custom-resource-definitions/ingressrouteudp.yaml", {})
}
resource "k8s_manifest" "middlewares" {
  content = templatefile("${path.module}/custom-resource-definitions/middlewares.yaml", {})
}
resource "k8s_manifest" "tls_options" {
  content = templatefile("${path.module}/custom-resource-definitions/tlsoptions.yaml", {})
}
resource "k8s_manifest" "tls_stores" {
  content = templatefile("${path.module}/custom-resource-definitions/tlsstores.yaml", {})
}
resource "k8s_manifest" "traefik_services" {
  content = templatefile("${path.module}/custom-resource-definitions/traefikservices.yaml", {})
}