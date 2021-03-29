resource "random_string" "random" {
  length      = 5
  min_lower   = 3
  min_numeric = 2
  special     = false
}

resource "google_service_account" "service_account" {
  project      = var.project
  account_id   = "${var.name}-gke-${local.env}-${random_string.random.result}"
  display_name = "Kubernetes nodes service account"
  depends_on   = [google_project_service.enabled_apis]
}

resource "google_project_iam_member" "service_account-roles" {
  project  = var.project
  for_each = toset(local.all_service_account_roles)
  role     = each.value
  member   = "serviceAccount:${google_service_account.service_account.email}"
}
