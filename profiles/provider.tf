terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.12.0"
    }
  }
}

provider "google" {
  //credentials = file("<NAME>.json")
  project = var.project_id
  region  = var.region
}