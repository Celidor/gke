provider "google-beta" {
  #credentials = "${file("account.json")}"
  project = var.project
  region  = var.region
  zone    = var.zone
}

terraform {
  required_providers {
    google-beta = {
      source  = "hashicorp/google-beta"
      version = "~> 4.70.0"
    }
  }
}