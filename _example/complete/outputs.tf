output "generated_id" {
  description = "The generated ID (e.g., ecommerce-production-api)"
  value       = module.labels.id
}

output "generated_labels" {
  description = "All labels including extra_labels"
  value       = module.labels.labels
}

output "labels_as_list" {
  description = "Labels as list of key=value"
  value       = module.labels.labels_as_list
}
