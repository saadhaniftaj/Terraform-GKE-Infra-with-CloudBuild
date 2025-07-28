resource "google_kms_key_ring" "state_keyring" {
  project  = var.project_id
  name     = "${var.prefix}-keyring"
  location = var.region
}

resource "google_kms_crypto_key" "state_crypto_key" {
  name     = "${var.prefix}-crypto-key"
  key_ring = google_kms_key_ring.state_keyring.id
}
