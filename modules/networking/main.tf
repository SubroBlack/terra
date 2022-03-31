
# GKE networks
resource "google_compute_network" "GKE_network" {
  name       = "${var.name}-${terraform.workspace}-gke-network"
  auto_create_subnetworks = false
}
# GKE Subnet
resource "google_compute_subnetwork" "GKE_subnet" {
  name          = "${var.name}-${terraform.workspace}-gke-subnet"
  ip_cidr_range = "10.2.0.0/16"
  region        = var.region
  network       = google_compute_network.GKE_network.name
}