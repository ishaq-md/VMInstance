# This is the provider used to spin up the gcloud instance
provider "google" {
  credentials = file("terraform.json")
  project = "migcpproject"
  region  = "us-central1"
  
}

resource "google_compute_instance" "vm-instance" {
  name         = "starup-script"
  machine_type = "f1-micro"
  zone         = "us-central1-a"
  tags = ["prod"]

  metadata = {
    startup-script-url = "gs://test-mi/sunday.sh"
  }

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }
    
  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }
}


