################################################################################
# Labels Module Outputs
################################################################################

output "id" {
  description = "Generated resource ID"
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

output "labels" {
  description = "Map of labels to apply to resources"
  value       = module.labels.labels
}
