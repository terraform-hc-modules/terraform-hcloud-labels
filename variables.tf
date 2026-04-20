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
}

variable "label_order" {
  description = "Order of labels to include in the generated ID."
  type        = list(string)
  default     = ["environment", "name"]
}

variable "delimiter" {
  description = "Delimiter between labels in the generated ID."
  type        = string
  default     = "-"
}
