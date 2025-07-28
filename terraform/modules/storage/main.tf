resource "google_storage_bucket" "bucket" {
  name          = "${var.prefix}-tf-state"
  project       = var.project_id
  location      = var.location
  force_destroy = true
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = var.crypto_key
  }
}
