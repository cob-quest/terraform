

resource "google_service_account" "assignment-service-account" {
  account_id   = "assignment-service-account"
  display_name = "A service account assignment can interact"
}

resource "google_service_account_iam_binding" "assignment-service-iam-owner" {
  service_account_id = google_service_account.assignment-service-account.name
  role               = "roles/owner"

  members = [
    "serviceAccount:${google_service_account.assignment-service-account.email}",
  ]
}



resource "google_service_account_iam_binding" "admin-account-iam-workload" {
  service_account_id = google_service_account.assignment-service-account.name
  role               = "roles/iam.workloadIdentityUser"

  members = [
    "serviceAccount:${data.google_project.project.project_id}.svc.id.goog[assignment-service/assignment-service]",
  ]
}


# resource "google_service_account_iam_policy" "assignment-service-account-iam" {
#   service_account_id = google_service_account.assignment-service-account.name
#   policy_data        = data.google_iam_policy.assignment-service-account-iam-policy.policy_data
# }