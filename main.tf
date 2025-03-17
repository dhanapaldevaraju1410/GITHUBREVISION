provider "google" {
  project     = "your-project-id"
  region      = "us-central1"
  credentials = var.google_credentials
}

variable "google_credentials" {
  type = string
}

resource "google_compute_instance" "default" {
  name         = "vm-instance"
  machine_type = "n1-standard-1"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
    }
  }
}
