resource "kubernetes_manifest" "ingress_route" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/ingressroute.yaml", {}))
}
resource "kubernetes_manifest" "ingress_route_tcp" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/ingressroutetcp.yaml", {}))
}
resource "kubernetes_manifest" "ingress_route_udp" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/ingressrouteudp.yaml", {}))
}
resource "kubernetes_manifest" "middlewares" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/middlewares.yaml", {}))
}
resource "kubernetes_manifest" "middlewares_tcp" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/middlewarestcp.yaml", {}))
}
resource "kubernetes_manifest" "tls_options" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/tlsoptions.yaml", {}))
}
resource "kubernetes_manifest" "tls_stores" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/tlsstores.yaml", {}))
}
resource "kubernetes_manifest" "traefik_services" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/traefikservices.yaml", {}))
}
resource "kubernetes_manifest" "server_transports" {
  manifest = yamldecode(templatefile("${path.module}/custom-resource-definitions/serverstransports.yaml", {}))
}