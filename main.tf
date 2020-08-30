# Configure the Google Cloud provider
provider "google" {
  project = "ishaqgcpproject"
  #credentials = file("terraform.json")
  region  = "us-central1"
}

# Create a Google Compute instance
resource "google_compute_instance" "example" {
  name          = "terraform"
  machine_type  = "f1-micro"
  zone          = "us-central1-f"
  #tags = ["prod","web"]
  
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
