terraform {
  required_version = ">= 1.5.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.49.0"
    }
  }
}

provider "hcloud" {}

module "labels" {
  source = "../../"

  name        = "web-server"
  environment = "dev"
}

output "id" {
  value = module.labels.id
}

output "labels" {
  value = module.labels.labels
}
