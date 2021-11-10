terraform {
  required_version = ">= 0.14"
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.0.2"
    }
    k8s = {
      source  = "banzaicloud/k8s"
      version = "0.8.0"
    }
  }
  experiments = [module_variable_optional_attrs]
}