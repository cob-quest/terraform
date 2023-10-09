

// Create GKE cluster with autopilot
resource "google_container_cluster" "my_cluster" {
  name = "cob-cluster"
  location = var.gcp_region
  enable_autopilot = true
  node_config {
    service_account = "{{google_service_account.my_service_account.email}}"
  }

}

# output "service_account_email" {
#   value = google_service_account.my_service_account.email
# }

output "cluster_endpoint" {
  value = google_container_cluster.my_cluster.endpoint
}