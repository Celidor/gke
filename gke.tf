resource "google_container_cluster" "primary" {
  name     = "${var.name}-${local.env}"
  location = var.region
  project  = var.project

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1
  network                  = google_compute_network.vpc.self_link
  subnetwork               = google_compute_subnetwork.gke_subnet.self_link

  release_channel {
    channel = "RAPID"
  }

  master_auth {
    username = ""
    password = ""

    client_certificate_config {
      issue_client_certificate = false
    }
  }

  node_config {
    service_account = google_service_account.service_account.email
  }
}

resource "google_container_node_pool" "primary_nodes" {
  name       = "${var.name}-${local.env}"
  location   = var.region
  project    = var.project
  cluster    = google_container_cluster.primary.name
  node_count = 1

  node_config {
    machine_type    = var.machine_type
    service_account = google_service_account.service_account.email

    metadata = {
      disable-legacy-endpoints = "true"
    }

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/devstorage.read_only",
    ]
  }
}

