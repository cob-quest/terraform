## Comment out to deploy to cloud

# provider "google" {
#   credentials = file("~/.gcp/access.json")
#   project     = var.gcp_project_id
#   region      = var.gcp_region
# }
provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
    ## switch context between cloud and local deployment
    # config_context = "gke_cs302-devops_us-central1_cob-cluster"
    config_context = "minikube"
  }
}