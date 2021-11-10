![Alt text](docs/images/project-octal-traefik.svg "Project Octal Traefik")
---

## terraform-kubernetes-traefik
Simplifies the deployment and management of Traefik on a Kubernetes cluster.

### TODO: 
- Update the Terraform version to 1.0+
- Deprecate the `k8s` provider in favor of the `kubernetes_manifest` resource in the `kubernetes` provider.
- Update the list of loadbalancer annotations to ignore so to check which cloud this is being deployed for.
- Add support for newer Traefik releases

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14 |
| <a name="requirement_k8s"></a> [k8s](#requirement\_k8s) | 0.8.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_k8s"></a> [k8s](#provider\_k8s) | 0.9.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.0.2 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [k8s_manifest.ingress_route](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.ingress_route_tcp](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.ingress_route_udp](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.middlewares](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.server_transports](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.tls_options](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.tls_stores](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [k8s_manifest.traefik_services](https://registry.terraform.io/providers/banzaicloud/k8s/0.8.0/docs/resources/manifest) | resource |
| [kubernetes_cluster_role.cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/deployment) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/namespace) | resource |
| [kubernetes_service.service](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/service) | resource |
| [kubernetes_service_account.service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/2.0.2/docs/resources/service_account) | resource |
| [random_pet.instance_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | Determines whether access logs will be kept. | `bool` | `"true"` | no |
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additional Traefik namespace annotations (e.g. for `linkerd.io/inject: enabled` for mesh things) | `map(string)` | `{}` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image to use when deploying Traefik | `string` | `"library/traefik"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. \| `IfNotPresent`: Only pull the image if it does not already exist on the node. \| `Never`: Never pull the image | `string` | `"Always"` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | The image repository to use when pulling images | `string` | `"registry.hub.docker.com"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The version of Traefik to deploy | `string` | `"2.4.8"` | no |
| <a name="input_ingress_class_name"></a> [ingress\_class\_name](#input\_ingress\_class\_name) | n/a | `string` | `"traefik"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | (optional) A map that consists of any additional labels that should be included with resources created by this module. | `map(string)` | `{}` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | (optional) The level at Traefik should be logging at. Options are `INFO`, `DEBUG`, and `TRACE`. | `string` | `"INFO"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (optional) The name given to the namespace in which Traefik will reside. | `string` | `"kube-traefik"` | no |
| <a name="input_pod_termination_grace_period_seconds"></a> [pod\_termination\_grace\_period\_seconds](#input\_pod\_termination\_grace\_period\_seconds) | n/a | `number` | `60` | no |
| <a name="input_preferred_node_selector"></a> [preferred\_node\_selector](#input\_preferred\_node\_selector) | A list of objects that define `preferredDuringSchedulingIgnoredDuringExecution` for this deployment | <pre>list(object({<br>    weight   = number,<br>    key      = string,<br>    operator = string,<br>    values   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | n/a | `number` | `2` | no |
| <a name="input_rolling_update_max_surge"></a> [rolling\_update\_max\_surge](#input\_rolling\_update\_max\_surge) | n/a | `number` | `1` | no |
| <a name="input_rolling_update_max_unavailable"></a> [rolling\_update\_max\_unavailable](#input\_rolling\_update\_max\_unavailable) | n/a | `number` | `1` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | The type used for this deployments service. | `string` | `"LoadBalancer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_class"></a> [ingress\_class](#output\_ingress\_class) | n/a |
<!-- END_TF_DOCS -->
