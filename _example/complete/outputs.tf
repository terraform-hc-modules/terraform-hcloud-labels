################################################################################
# Labels Module Outputs
################################################################################

output "id" {
  description = "Generated resource ID (e.g., ecommerce-production-ex-complete)"
  value       = module.labels.id
}

output "name" {
  description = "Name variable value"
  value       = module.labels.name
}

output "environment" {
  description = "Environment variable value"
  value       = module.labels.environment
}

output "project" {
  description = "Project variable value"
  value       = module.labels.project
}

output "labels" {
  description = "Map of labels including extra_labels"
  value       = module.labels.labels
}

output "labels_as_list" {
  description = "Labels formatted as key=value list"
  value       = module.labels.labels_as_list
}

################################################################################
# Custom Delimiter Module Outputs
################################################################################

output "underscore_id" {
  description = "Generated ID with underscore delimiter"
  value       = module.labels_underscore.id
}

output "underscore_labels" {
  description = "Labels from underscore delimiter module"
  value       = module.labels_underscore.labels
}

################################################################################
# Minimal Module Outputs
################################################################################

output "minimal_id" {
  description = "Generated ID with minimal label order"
  value       = module.labels_minimal.id
}

################################################################################
# Disabled Module Outputs
################################################################################

output "disabled_enabled" {
  description = "Enabled status of disabled module"
  value       = module.labels_disabled.enabled
}

output "disabled_id" {
  description = "ID of disabled module (should be empty)"
  value       = module.labels_disabled.id
}

output "disabled_labels" {
  description = "Labels of disabled module (should be empty)"
  value       = module.labels_disabled.labels
}
