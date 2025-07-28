provider "google" {
  project = "devops-terra-464510"
  region  = "us-central1"
}

module "kms" {
  source     = "./modules/kms"
  prefix     = "tf-gke-20250727"
  project_id = "devops-terra-464510"
  region     = "us-central1"
}

module "network" {
  source     = "./modules/network"
  prefix     = "tf-gke-20250727"
  project_id = "devops-terra-464510"
  region     = "us-central1"
}

module "service_account" {
  source       = "./modules/service-account"
  prefix       = "tf-gke"
  project_id   = "devops-terra-464510"
  account_id   = "sa-20250727"
  display_name = "Terraform GKE Service Account"
}

module "storage" {
  source     = "./modules/storage"
  prefix     = "tf-gke-20250727"
  project_id = "devops-terra-464510"
  location   = "us-central1"
  crypto_key = module.kms.crypto_key
}

module "artifact" {
  source     = "./modules/artifact"
  prefix     = "tf-gke-20250727"
  project_id = "devops-terra-464510"
  region     = "us-central1"
}

module "gke" {
  source                = "./modules/gke"
  prefix                = "tf-gke-20250727"
  project_id            = "devops-terra-464510"
  region                = "us-central1"
  vpc_network           = module.network.vpc_name
  vpc_subnet            = module.network.subnet_name
  service_account_email = module.service_account.email
}
