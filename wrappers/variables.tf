variable "defaults" {
  description = "Default values applied to each item."
  type        = any
  default     = {}
}

variable "items" {
  description = "Map of per-item module inputs. Keys are instance identifiers."
  type        = any
  default     = {}
}

