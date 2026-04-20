output "generated_id" {
  description = "The generated ID from labels module"
  value       = module.labels.id
}

output "generated_labels" {
  description = "The generated labels from labels module"
  value       = module.labels.labels
}
