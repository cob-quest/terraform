terraform {
  backend "gcs" {
    bucket          = "tfstate-bucket-cs302-devops"
    prefix          = "/gke/platform/terraform.tfstate"
    credentials     = "~/.gcp/access.json"
  }
}