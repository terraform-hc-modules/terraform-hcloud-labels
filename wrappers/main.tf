locals {
  merged_items = {
    for k, v in var.items : k => merge(var.defaults, v)
  }
}

module "wrapper" {
  for_each = local.merged_items

  source = "../"

  name   = try(each.value.name, each.key)
  labels = try(each.value.labels, {})
}

