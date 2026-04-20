locals {
  name = "ex-${basename(path.cwd)}"
}

################################################################################
# Labels Module
################################################################################

module "labels" {
  source = "../../"

  name        = local.name
  environment = "dev"
}
