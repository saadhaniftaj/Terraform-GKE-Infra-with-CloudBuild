resource "google_service_account" "sa" {
  project      = var.project_id
  account_id   = substr("${var.prefix}-${var.account_id}", 0, 30)
  display_name = var.display_name
}
