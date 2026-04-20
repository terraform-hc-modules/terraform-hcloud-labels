variable "name" {
  description = "Name of the application or resource."
  type        = string

  validation {
    condition     = length(var.name) > 0 && length(var.name) <= 63
    error_message = "Name must be between 1 and 63 characters."
  }
}

variable "environment" {
  description = "Environment name (e.g., dev, staging, prod)."
  type        = string
  default     = ""
}

variable "project" {
  description = "Project or application name."
  type        = string
  default     = ""
}

variable "owner" {
  description = "Owner of the resource (team or individual)."
  type        = string
  default     = ""
}

variable "managed_by" {
  description = "Tool managing this resource."
  type        = string
  default     = "terraform"
}

variable "extra_labels" {
  description = "Additional labels to merge with generated labels."
  type        = map(string)
  default     = {}
}

variable "label_order" {
  description = "Order of labels to include in the name. Set to empty list to disable."
  type        = list(string)
  default     = ["environment", "name"]
}

variable "delimiter" {
  description = "Delimiter between labels in the generated name."
  type        = string
  default     = "-"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources."
  type        = bool
  default     = true
}
