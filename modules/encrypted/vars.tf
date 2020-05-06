variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "prefix_enabled" {
  description = "Indicates whether to prefix bucket name with the account id"
  type = bool
  default = true
}

variable "expiration_days" {
  description = "Age of bucket objects (days) before they are deleted"
  type = number
  default = 0
}

variable "versioned" {
  description = "Enable bucket versioning"
  type = bool
  default = false
}

variable "noncurrent_version_expiration" {
  description = "Age of non-current object versions (days) before they are deleted"
  type = number
  default = 0
}

variable "encryption_key" {
  description = "The KMS master key used for server-side encryption"
}
