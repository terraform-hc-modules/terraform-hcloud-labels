terraform {
  required_version = ">= 1.5.0"

  required_providers {
    hcloud = {
      source  = "hetznercloud/hcloud"
      version = ">= 1.49.0"
    }
  }
}

provider "hcloud" {
  # Configure via environment variable:
  # export HCLOUD_TOKEN="your-api-token"
}

module "this" {
  source = "../../"

  name = "basic-example"
}
