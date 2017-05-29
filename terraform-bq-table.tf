// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../JasonM-ML-Project888-0dec86ec8b3b.json1")}"
  project     = "jasonm-ml-project888"
  region      = "us-central1"
}

// Create a new instance
resource "google_compute_instance" "default" {
  # ...
}

resource "google_bigquery_dataset_terraform" "default" {
  dataset_id                  = "test_terraform"
  friendly_name               = "test_terraform"
  description                 = "This is a test description - terraform"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels {
    env = "default"
  }
}

resource "google_bigquery_table" "default" {
  dataset_id = "${google_bigquery_dataset_terraform.default.id}"
  table_id   = "test_terraform"

  time_partitioning {
    type = "DAY"
  }

  labels {
    env = "default"
  }

  schema = "${file("terraform-bq-schema.json")}"
}
 
 
