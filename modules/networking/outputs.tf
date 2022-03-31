output "GKE_network" {
    description = "GKE network"
    value = google_compute_network.GKE_network
}

output "GKE_subnetwork" {
    description = "GKE subnetwork"
    value = google_compute_subnetwork.GKE_subnet
}