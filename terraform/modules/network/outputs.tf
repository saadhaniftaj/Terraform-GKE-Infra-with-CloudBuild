output "vpc_network" {
  value = google_compute_network.vpc.id
}

output "vpc_subnet" {
  value = google_compute_subnetwork.subnet.id
}
