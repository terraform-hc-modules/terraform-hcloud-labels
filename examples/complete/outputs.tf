################################################################################
# Full Configuration
################################################################################

output "id" {
  description = "Generated ID"
  value       = module.labels.id
}

output "labels" {
  description = "Generated labels"
  value       = module.labels.labels
}

output "labels_as_list" {
  description = "Labels as list"
  value       = module.labels.labels_as_list
}

################################################################################
# Custom Delimiter
################################################################################

output "underscore_id" {
  description = "ID with underscore delimiter"
  value       = module.labels_underscore.id
}

################################################################################
# Disabled
################################################################################

output "disabled_enabled" {
  description = "Disabled module enabled status"
  value       = module.labels_disabled.enabled
}
