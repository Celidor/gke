resource "random_string" "random" {
  length  = 5
  special = false
}

resource "google_service_account" "service_account" {
  project      = var.project
  account_id   = "${var.name}-gke-${local.env}-${random_string.random.result}"
  display_name = "Service Account"
}

resource "google_project_iam_member" "service_account-roles" {
  project  = var.project
  for_each = toset(local.all_service_account_roles)
  role     = each.value
  member   = "serviceAccount:${google_service_account.service_account.email}"
}
