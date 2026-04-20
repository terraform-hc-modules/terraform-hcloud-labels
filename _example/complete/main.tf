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

  name        = "api"
  environment = "production"
  project     = "ecommerce"
  owner       = "platform-team"
  managed_by  = "terraform"

  label_order = ["project", "environment", "name"]
  delimiter   = "-"

  extra_labels = {
    "cost_center" = "engineering"
    "compliance"  = "soc2"
  }
}

# Example: Use labels with a server resource
# resource "hcloud_server" "example" {
#   name        = module.labels.id
#   server_type = "cx22"
#   image       = "ubuntu-24.04"
#   labels      = module.labels.labels
# }

output "id" {
  description = "Generated resource ID"
  value       = module.labels.id
}

output "labels" {
  description = "Labels to apply to resources"
  value       = module.labels.labels
}
