output "name" {
  description = "The name used for resources"
  value       = module.this.name
}

output "labels" {
  description = "The labels applied to resources"
  value       = module.this.labels
}
