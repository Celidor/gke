resource "google_compute_route" "default_internet" {
  name             = "${var.name}-default-route-internet-${var.region}-${local.env}"
  description      = "Default route to Internet"
  project          = var.project
  dest_range       = "0.0.0.0/0"
  network          = google_compute_network.vpc.name
  next_hop_gateway = "default-internet-gateway"
  priority         = 1000
}