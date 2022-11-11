provider "helm" {
  kubernetes {
    config_path = ".kubeconfig"
  }
}

provider "kubermatic" {
  host       = "https://kaas.cloudpunks.io/"
  token_path = ".kubermatic"
}

provider "aws" {
  region  = "eu-central-1"
  profile = ""

  default_tags {
    tags = {
      project = "ops-k8s-bootstrap"
      Owner   = "ops"
      Name    = "ops-k8s-bootstrap"
    }
  }
}

provider "kubectl" {
  load_config_file = true
  config_path      = ".kubeconfig"
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.38.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.7.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.4.3"
    }
    kubermatic = {
      source  = "kubermatic/kubermatic"
      version = "0.2.1"
    }
  }
}
