resource "google_storage_bucket" "challenge-bucket" {
  name     = var.bucket_name
  location = var.gcp_region

  versioning {
    enabled = true
  }
}

resource "google_service_account" "challenge-bucket-account" {
  account_id   = "challenge-bucket-account"
  display_name = "A service account to interact with challenge bucket"
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.challenge-bucket.name
  role   = "roles/storage.admin"
  member = "serviceAccount:${google_service_account.challenge-bucket-account.email}"
}

resource "google_service_account_key" "mykey" {
  service_account_id = google_service_account.challenge-bucket-account.name
}

output "private-key" {
  value     = google_service_account_key.mykey.private_key
  sensitive = true
}

resource "local_file" "myaccountjson" {
  content  = base64decode(google_service_account_key.mykey.private_key)
  filename = "challenge-bucket-key.json"
}
