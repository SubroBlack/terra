
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
  secondary_ip_range {
    range_name    = "services-range"
    ip_cidr_range = "10.24.0.0/20"
    }
  secondary_ip_range {
    range_name    = "pod-range"
    ip_cidr_range = "10.28.0.0/20"
  }
}

# Firwall rule to allow ingress
resource "google_compute_firewall" "gke" {
  name    = "${var.name}-ingress-firewall-gke"
  network = google_compute_network.GKE_network.name
  direction = "INGRESS"
  source_ranges = ["0.0.0.0/0"]
  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
    ports    = ["443", "8080", "8081", "8082"]
  }
  depends_on = [
    google_compute_network.GKE_network
  ]
}