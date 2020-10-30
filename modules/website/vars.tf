variable "bucket" {
  description = "Name of the S3 bucket"
}

variable "policy" {
  description = "Identifier for a predefined policy to apply"
  default     = "public_read"
}

variable "suffix_enabled" {
  description = "Indicates whether to append the bucket name with a unique string to prevent conflicts"
  type        = bool
  default     = true
}

variable "versioned" {
  description = "Enable bucket versioning"
  type        = bool
  default     = false
}

variable "noncurrent_version_expiration" {
  description = "Age of non-current object versions (days) before they are deleted"
  type        = number
  default     = 0
}

variable "logging_bucket" {
  description = "Another S3 bucket used to capture audit logs"
  default     = ""
}

variable "public_read_whitelist" {
  description = "A CIDR IP range for restricted read access to public buckets"
  default     = ""
}

variable "website_routing_rules" {
  description = "A map of routing conditions and target redirects"
  default     = {}
}
