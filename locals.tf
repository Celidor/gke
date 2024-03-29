locals {
  env = lower(terraform.workspace)
}

locals {
  all_service_account_roles = [
    "roles/logging.logWriter",
    "roles/monitoring.metricWriter",
    "roles/monitoring.viewer",
    "roles/stackdriver.resourceMetadata.writer"
  ]
}

locals {
  service_apis = [
    "container.googleapis.com",
    "containersecurity.googleapis.com",
    "iam.googleapis.com"
  ]
}