output "GKE-subnet" {
  description = "The subnet for GKE"
  value       = module.Networking.GKE_subnetwork
}