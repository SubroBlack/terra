
## Module to create the necessary networks and peering
module "Networking" {
  source     = "../modules/networking"
  project_id = var.project_id
  name       = var.name
  region     = var.region
}

## Module to create a GKE cluster 
module "Cluster" {
  source = "../modules/cluster"
  project_id = var.project_id
  name = "${var.name}-${terraform.workspace}-cluster"
  zone = var.zone
  network = module.Networking.GKE_network
  subnetwork = module.Networking.GKE_subnetwork
  services_range = module.Networking.GKE_subnetwork.secondary_ip_range[0].range_name
  pods_range     = module.Networking.GKE_subnetwork.secondary_ip_range[1].range_name
}