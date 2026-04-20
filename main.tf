# -----------------------------------------------------------------------------
# Module: hcloud-labels
# Terraform module for consistent labeling and naming conventions in Hetzner Cloud
# -----------------------------------------------------------------------------

locals {
  enabled = var.enabled

  # Build labels map from variables
  generated_labels = {
    for k, v in {
      "name"        = var.name
      "environment" = var.environment
      "project"     = var.project
      "owner"       = var.owner
      "managed_by"  = var.managed_by
    } : k => v if v != ""
  }

  # Merge generated labels with extra labels (extra_labels takes precedence)
  labels = local.enabled ? merge(local.generated_labels, var.extra_labels) : {}

  # Build name from label_order
  name_parts = local.enabled ? [
    for label in var.label_order : local.generated_labels[label]
    if contains(keys(local.generated_labels), label) && local.generated_labels[label] != ""
  ] : []

  # Generate the full name with delimiter
  id = local.enabled ? join(var.delimiter, local.name_parts) : ""
}
