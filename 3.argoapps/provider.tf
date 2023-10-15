## Comment out to deploy to cloud

# provider "google" {
#   credentials = file("~/.gcp/access.json")
#   project     = var.gcp_project_id
#   region      = var.gcp_region
# }

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
  server_addr = "127.0.0.1:8080"
  username    = "admin"
  password    = "JISlUh4w92W78i3l"
  insecure = true
}

provider "kubernetes" {
  config_path    = "~/.kube/config"
  ## To be changed if using cloud
  config_context = "minikube"
}
