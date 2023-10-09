# data "google_iam_policy" "assignment-service-account-iam-policy" {
#   binding {
#     role = "roles/owner"
#     members = [ "serviceAccount:${google_service_account.assignment-service-account.email}" ]
#   }
# }

data "google_project" "project" {}