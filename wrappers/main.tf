locals {
  merged_items = {
    for k, v in var.items : k => merge(var.defaults, v)
  }
}

module "wrapper" {
  for_each = local.merged_items

  source = "../"

  name         = try(each.value.name, each.key)
  environment  = try(each.value.environment, "")
  project      = try(each.value.project, "")
  owner        = try(each.value.owner, "")
  managed_by   = try(each.value.managed_by, "terraform")
  label_order  = try(each.value.label_order, ["environment", "name"])
  delimiter    = try(each.value.delimiter, "-")
  extra_labels = try(each.value.extra_labels, {})
  enabled      = try(each.value.enabled, true)
}
