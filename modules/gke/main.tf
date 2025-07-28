resource "google_container_cluster" "primary" {
  project  = var.project_id
  name     = "${var.prefix}-gke"
  location = var.region
  network  = var.vpc_network
  subnetwork = var.vpc_subnet

  node_config {
    service_account = var.service_account_email
    oauth_scopes = [
      "https://www.googleapis.com/auth/cloud-platform"
    ]
    machine_type = "e2-medium"
  }

  initial_node_count = 1
}
