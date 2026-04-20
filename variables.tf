variable "enabled" {
  description = "Set to false to prevent the module from creating any resources."
  type        = bool
  default     = true
}

variable "name" {
  description = "Name of the resource."
  type        = string
  default     = ""
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

  validation {
    condition     = alltrue([for k, v in var.extra_labels : trimspace(k) != "" && trimspace(v) != ""])
    error_message = "extra_labels keys and values must be non-empty strings."
  }
}

variable "label_order" {
  description = "Order of labels to include in the generated ID."
  type        = list(string)
  default     = ["environment", "name"]

  validation {
    condition     = length(var.label_order) > 0
    error_message = "label_order must contain at least one label key."
  }

  validation {
    condition = alltrue([
      for k in var.label_order :
      contains(["name", "environment", "project", "owner", "managed_by"], k)
    ])
    error_message = "label_order may only contain: name, environment, project, owner, managed_by."
  }

  validation {
    condition     = length(distinct(var.label_order)) == length(var.label_order)
    error_message = "label_order must not contain duplicate keys."
  }
}

variable "delimiter" {
  description = "Delimiter between labels in the generated ID."
  type        = string
  default     = "-"

  validation {
    condition     = trimspace(var.delimiter) != ""
    error_message = "delimiter must be a non-empty string."
  }
}
