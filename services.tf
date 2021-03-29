resource "google_project_service" "enabled_apis" {
  project  = var.project
  for_each = toset(local.service_apis)
  service  = each.value
}
