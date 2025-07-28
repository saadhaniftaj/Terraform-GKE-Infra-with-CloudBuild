variable "prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "project_id" {
  description = "GCP project ID"
  type        = string
}

variable "region" {
  description = "GCP region"
  type        = string
}

variable "kms_crypto_key_id" {
  description = "KMS crypto key ID"
  type        = string
}

variable "service_account_email" {
  description = "Service account email"
  type        = string
}
