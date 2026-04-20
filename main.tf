locals {
  enabled = var.enabled

  label_values = {
    name        = var.name
    environment = var.environment
    project     = var.project
    owner       = var.owner
    managed_by  = var.managed_by
  }

  id_parts = [
    for label in var.label_order : local.label_values[label]
    if try(local.label_values[label], "") != ""
  ]

  id = local.enabled ? lower(join(var.delimiter, local.id_parts)) : ""

  base_labels = {
    for k, v in local.label_values : k => v
    if v != ""
  }

  labels = local.enabled ? merge(local.base_labels, var.extra_labels) : {}

  labels_as_list = [
    for k, v in local.labels : {
      key   = k
      value = v
    }
  ]
}
