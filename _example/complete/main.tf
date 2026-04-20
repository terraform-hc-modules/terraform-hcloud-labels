locals {
  name = "ex-${basename(path.cwd)}"
}

################################################################################
# Labels Module - Complete Example
################################################################################

module "labels" {
  source = "../../"

  name        = local.name
  environment = "production"
  project     = "ecommerce"
  owner       = "platform-team"
  managed_by  = "terraform"

  label_order = ["project", "environment", "name"]
  delimiter   = "-"

  extra_labels = {
    cost_center = "engineering"
    compliance  = "soc2"
    team        = "devops"
  }
}

################################################################################
# Labels Module - Custom Delimiter
################################################################################

module "labels_underscore" {
  source = "../../"

  name        = local.name
  environment = "staging"
  project     = "api"

  label_order = ["project", "name", "environment"]
  delimiter   = "_"
}

################################################################################
# Labels Module - Minimal Label Order
################################################################################

module "labels_minimal" {
  source = "../../"

  name        = local.name
  environment = "dev"

  label_order = ["name"]
}

################################################################################
# Labels Module - Disabled
################################################################################

module "labels_disabled" {
  source = "../../"

  name        = local.name
  environment = "test"
  enabled     = false
}
