output "enabled" {
  description = "Whether the module is enabled."
  value       = local.enabled
}

output "id" {
  description = "Generated ID/name based on label_order and delimiter."
  value       = local.id
}

output "name" {
  description = "The name variable value."
  value       = var.name
}

output "environment" {
  description = "The environment variable value."
  value       = var.environment
}

output "project" {
  description = "The project variable value."
  value       = var.project
}

output "labels" {
  description = "Map of labels to apply to resources."
  value       = local.labels
}

output "labels_as_list" {
  description = "Labels formatted as a list of key=value strings."
  value       = [for k, v in local.labels : "${k}=${v}"]
}
