provider "google" {
  version     = "~> 4.8"
  credentials = file("~/.gcp/access.json")
  project     = var.gcp_project_id
  region      = var.gcp_region
}
