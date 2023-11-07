## Comment out to deploy to cloud

provider "google" {
  credentials = file("~/.gcp/access.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
}

terraform {
  required_providers {
    argocd = {
      source = "oboukili/argocd"
      version = "6.0.3"
    }
  }
}


provider "argocd" {
  ## these need to be changed according to what argocd generated for you
  server_addr = "34.72.66.62"
  username    = "admin"
  password    = "cobbers123"
  insecure = true
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  ## To be changed if using cloud
  config_context = "gke_cs302-devops_us-central1_cob-cluster"
  # config_context = "minikube"
}
