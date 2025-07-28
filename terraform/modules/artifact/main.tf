resource "google_artifact_registry_repository" "app_repo" {
  project       = var.project_id
  location      = var.region
  repository_id = "${var.prefix}-app-repo"
  format        = "DOCKER"
}
