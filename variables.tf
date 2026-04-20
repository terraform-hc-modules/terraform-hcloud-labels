variable "name" {
  description = "Name prefix for all resources created by this module."
  type        = string

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 63
    error_message = "Name must be between 1 and 63 characters."
  }
}

variable "labels" {
  description = "A map of labels to apply to all supported resources."
  type        = map(string)
  default     = {}
}

