variable "name" {
  description = "name prefix for resources"
  type        = string
}

variable "region" {
  description = "The location region/zone where the cluster should be deployed"
  type        = string
}

variable "project_id" {
  description = "GCP Project ID"
  type        = string
}
