
## Module to create the necessary networks and peering
module "Networking" {
  source     = "../modules/networking"
  project_id = var.project_id
  name       = var.name
  region     = var.region
}
