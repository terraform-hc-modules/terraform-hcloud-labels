module "wrapper" {
  source = "../"

  for_each = var.items

  enabled      = try(each.value.enabled, true)
  name         = try(each.value.name, each.key)
  environment  = try(each.value.environment, "")
  project      = try(each.value.project, "")
  owner        = try(each.value.owner, "")
  managed_by   = try(each.value.managed_by, "terraform")
  extra_labels = try(each.value.extra_labels, {})
  label_order  = try(each.value.label_order, ["environment", "name"])
  delimiter    = try(each.value.delimiter, "-")
}

variable "items" {
  description = "Map of items to create labels for"
  type        = any
  default     = {}
}

output "wrapper" {
  description = "Map of label outputs"
  value       = module.wrapper
}
