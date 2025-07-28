resource "google_storage_bucket" "tf_state" {
  name          = "${var.prefix}-tf-state-20250725"
  location      = var.region
  project       = var.project_id
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
  encryption {
    default_kms_key_name = var.kms_crypto_key_id
  }
  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"
}

resource "google_storage_bucket_iam_member" "tf_state_admin" {
  bucket = google_storage_bucket.tf_state.name
  role   = "roles/storage.objectAdmin"
  member = "serviceAccount:${var.service_account_email}"
}

