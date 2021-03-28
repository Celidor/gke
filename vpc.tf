resource "google_compute_network" "vpc" {
  name                            = "${var.name}-vpc-${local.env}"
  project                         = var.project
  auto_create_subnetworks         = false
  delete_default_routes_on_create = true
}

resource "google_compute_subnetwork" "gke_subnet" {
  name          = "${var.name}-gke-${var.region}-${local.env}"
  project       = var.project
  ip_cidr_range = "10.100.100.0/24"
  region        = var.region
  network       = google_compute_network.vpc.self_link
}
