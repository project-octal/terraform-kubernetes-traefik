![Project Octal: Traefik](docs/images/project-octal-traefik.svg "Project Octal: Traefik")
---

Simplifies the deployment and management of Traefik on a Kubernetes cluster.

### TODO: 
- Update the list of loadbalancer annotations to ignore so to check which cloud this is being deployed for.
- Add support for newer Traefik releases

## v0.0.2 to v1.0.0 Upgrade
```terraform
```

```shell

# Import the Traefik dashboard if one was deployed
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.dashboard_ingress_route[0]' \
"apiVersion=traefik.containo.us/v1alpha1,kind=IngressRoute,namespace=kube-traefik,name=traefik-dashboard"

# Import the Traefik IngressClass
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.ingress_class' \
"apiVersion=networking.k8s.io/v1,kind=IngressClass,name=traefik"

# Import the Traefik Ingress Route CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.ingress_route' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=ingressroutes.traefik.containo.us"

# Import the Traefik Ingress TCP Route CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.ingress_route_tcp' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=ingressroutetcps.traefik.containo.us"

# Import the Traefik Ingress UDP Route CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.ingress_route_udp' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=ingressrouteudps.traefik.containo.us"

# Import the Traefik Ingress Middleware CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.middlewares' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=middlewares.traefik.containo.us"

# Import the Traefik Server Transports CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.server_transports' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=serverstransports.traefik.containo.us"

# Import the Traefik TLS Options CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.tls_options' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=tlsoptions.traefik.containo.us"

# Import the Traefik TLS Stores CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.tls_stores' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=tlsstores.traefik.containo.us"

# Import the Traefik Services CRD
terraform import -var-file=secrets.tfvars \
'module.traefik.kubernetes_manifest.traefik_services' \
"apiVersion=apiextensions.k8s.io/v1,kind=CustomResourceDefinition,name=traefikservices.traefik.containo.us"

# Delete the state reference to the old k8s_manifest objects
terraform state rm 'module.traefik.k8s_manifest.dashboard_ingress_route[0]'
terraform state rm 'module.traefik.k8s_manifest.ingress_class'
terraform state rm 'module.traefik.k8s_manifest.ingress_route'
terraform state rm 'module.traefik.k8s_manifest.ingress_route_tcp'
terraform state rm 'module.traefik.k8s_manifest.ingress_route_udp'
terraform state rm 'module.traefik.k8s_manifest.middlewares'
terraform state rm 'module.traefik.k8s_manifest.server_transports'
terraform state rm 'module.traefik.k8s_manifest.tls_options'
terraform state rm 'module.traefik.k8s_manifest.tls_stores'
terraform state rm 'module.traefik.k8s_manifest.traefik_services'

# Lastly, run a Terraform apply to make sure the states are synced up.
terraform apply -var-file secrets.tfvars
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.14.8, < 2.0.0 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | ~> 2.6.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | ~> 2.6.1 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_cluster_role.cluster_role](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.cluster_role_binding](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_deployment.deployment](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/deployment) | resource |
| [kubernetes_manifest.dashboard_ingress_route](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.ingress_class](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.ingress_route](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.ingress_route_tcp](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.ingress_route_udp](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.middlewares](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.server_transports](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.tls_options](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.tls_stores](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_manifest.traefik_services](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/manifest) | resource |
| [kubernetes_namespace.namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/namespace) | resource |
| [kubernetes_service.service](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service) | resource |
| [kubernetes_service_account.service_account](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [random_pet.instance_name](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | Determines whether access logs will be kept. | `bool` | `"true"` | no |
| <a name="input_annotations"></a> [annotations](#input\_annotations) | Additional Traefik namespace annotations (e.g. for `linkerd.io/inject: enabled` for mesh things) | `map(string)` | `{}` | no |
| <a name="input_dashboard_ingress_host"></a> [dashboard\_ingress\_host](#input\_dashboard\_ingress\_host) | The Traefik dashboard ingress host | `string` | `null` | no |
| <a name="input_enable_dashboard"></a> [enable\_dashboard](#input\_enable\_dashboard) | Set to `true` to enable the Traefik dashboard | `string` | `true` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | The image to use when deploying Traefik | `string` | `"library/traefik"` | no |
| <a name="input_image_pull_policy"></a> [image\_pull\_policy](#input\_image\_pull\_policy) | Determines when the image should be pulled prior to starting the container. `Always`: Always pull the image. \| `IfNotPresent`: Only pull the image if it does not already exist on the node. \| `Never`: Never pull the image | `string` | `"Always"` | no |
| <a name="input_image_repository"></a> [image\_repository](#input\_image\_repository) | The image repository to use when pulling images | `string` | `"registry.hub.docker.com"` | no |
| <a name="input_image_tag"></a> [image\_tag](#input\_image\_tag) | The version of Traefik to deploy | `string` | `"2.4.8"` | no |
| <a name="input_ingress_class_default"></a> [ingress\_class\_default](#input\_ingress\_class\_default) | Set to true to make the ingress class of this Traefik instance the default. | `bool` | `true` | no |
| <a name="input_ingress_class_name"></a> [ingress\_class\_name](#input\_ingress\_class\_name) | The name of the Traefik ingress class | `string` | `"traefik"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | (optional) A map that consists of any additional labels that should be included with resources created by this module. | `map(string)` | `{}` | no |
| <a name="input_log_level"></a> [log\_level](#input\_log\_level) | (optional) The level at Traefik should be logging at. Options are `INFO`, `DEBUG`, and `TRACE`. | `string` | `"INFO"` | no |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | (optional) The name given to the namespace in which Traefik will reside. | `string` | `"kube-traefik"` | no |
| <a name="input_pod_termination_grace_period_seconds"></a> [pod\_termination\_grace\_period\_seconds](#input\_pod\_termination\_grace\_period\_seconds) | n/a | `number` | `60` | no |
| <a name="input_preferred_node_selector"></a> [preferred\_node\_selector](#input\_preferred\_node\_selector) | A list of objects that define `preferredDuringSchedulingIgnoredDuringExecution` for this deployment | <pre>list(object({<br>    weight   = number,<br>    key      = string,<br>    operator = string,<br>    values   = list(string)<br>  }))</pre> | `[]` | no |
| <a name="input_replicas"></a> [replicas](#input\_replicas) | n/a | `number` | `2` | no |
| <a name="input_resource_limits"></a> [resource\_limits](#input\_resource\_limits) | Resource limits for the Traefik deployment pods | <pre>object({<br>    cpu    = optional(string),<br>    memory = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_resource_requests"></a> [resource\_requests](#input\_resource\_requests) | Resource requests for the Traefik deployment pods | <pre>object({<br>    cpu    = optional(string),<br>    memory = optional(string)<br>  })</pre> | `{}` | no |
| <a name="input_rolling_update_max_surge"></a> [rolling\_update\_max\_surge](#input\_rolling\_update\_max\_surge) | n/a | `number` | `1` | no |
| <a name="input_rolling_update_max_unavailable"></a> [rolling\_update\_max\_unavailable](#input\_rolling\_update\_max\_unavailable) | n/a | `number` | `1` | no |
| <a name="input_service_type"></a> [service\_type](#input\_service\_type) | The type used for this deployments service. | `string` | `"LoadBalancer"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_class"></a> [ingress\_class](#output\_ingress\_class) | n/a |
<!-- END_TF_DOCS -->
