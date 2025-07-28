
variable "project_id" {
  description = "GCP project ID"
  type        = string
  default     = "devops-terra-464510"
}

variable "region" {
  description = "GCP region"
  type        = string
  default     = "us-central1"
}

variable "prefix" {
  description = "Prefix for resource names"
  type        = string
  default     = "tf-gke-unique-20250725"
}
