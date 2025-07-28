variable "prefix" {
  type = string
}

variable "project_id" {
  type    = string
  default = "devops-terra-464510"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "vpc_network" {
  type = string
}

variable "vpc_subnet" {
  type = string
}

variable "service_account_email" {
  type = string
}
