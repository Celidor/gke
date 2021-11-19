provider "google" {
  #credentials = "${file("account.json")}"
  project = var.project
  region  = var.region
  zone    = var.zone
}

terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 3.70.0"
    }
  }
}