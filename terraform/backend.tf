terraform {
  backend "gcs" {
    bucket  = "tf-gke-unique-20250727-tf-state"
    prefix  = "terraform/state"
  }
}
