locals {
  name = "ex-${basename(path.cwd)}"
}

################################################################################
# Labels Module - Full Configuration
################################################################################

module "labels" {
  source = "../../"

  name        = local.name
  environment = "production"
  project     = "myapp"
  owner       = "platform-team"
  managed_by  = "terraform"

  extra_labels = {
    CostCenter = "engineering"
    Compliance = "soc2"
  }

  label_order = ["environment", "project", "name"]
  delimiter   = "-"
}

################################################################################
# Labels Module - Custom Delimiter
################################################################################

module "labels_underscore" {
  source = "../../"

  name        = local.name
  environment = "staging"
  delimiter   = "_"
}

################################################################################
# Labels Module - Disabled
################################################################################

module "labels_disabled" {
  source = "../../"

  enabled = false
  name    = "disabled"
}
