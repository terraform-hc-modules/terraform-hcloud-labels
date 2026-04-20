output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "Generated ID based on label_order."
  value       = local.id
}

output "id_parts" {
  description = "Ordered ID parts (after filtering empty values) used to build id."
  value       = local.id_parts
}

output "label_values" {
  description = "Raw label values before filtering empties and before merging extra_labels."
  value       = local.label_values
}

output "base_labels" {
  description = "Base labels derived from label_values with empty values removed (before merging extra_labels)."
  value       = local.base_labels
}

output "labels" {
  description = "Map of labels for use with hcloud resources."
  value       = local.labels
}

output "labels_as_list" {
  description = "Labels as a list of key-value objects."
  value       = local.labels_as_list
}

output "name" {
  description = "The name input."
  value       = var.name
}

output "environment" {
  description = "The environment input."
  value       = var.environment
}

output "project" {
  description = "The project input."
  value       = var.project
}

output "owner" {
  description = "The owner input."
  value       = var.owner
}

output "managed_by" {
  description = "The managed_by input."
  value       = var.managed_by
}
