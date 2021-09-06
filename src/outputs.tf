
output "cluster_name" {
  description = "The GKE identifier"
  value       = module.gke.name
}

output "endpoint_gke" {
  description = "The GKE endpoint"
  value       = module.gke.endpoint
  sensitive   = true
}

output "region" {
  description = "The region to host the cluster in"
  value       = var.region
}

output "service_account" {
  description = "The e-mail address of the service account"
  value       = module.gke.svc_account_email
}

output "project" {
  description = "The project ID to host the cluster in"
  value       = var.project_id
}