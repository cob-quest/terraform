## Comment this out for cloud deployment

terraform {
  backend "gcs" {
    bucket          = "tfstate-bucket-cs302-devops"
    prefix          = "/gke/argocd/terraform.tfstate"
    credentials     = "~/.gcp/access.json"
  }
}