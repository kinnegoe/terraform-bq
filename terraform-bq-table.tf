// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../JasonM-ML-Project888-0dec86ec8b3b.json")}"
  project     = "jasonm-ml-project888"
  region      = "us-central1"
}


resource "google_bigquery_dataset" "default" {
  dataset_id                  = "test"
  friendly_name               = "test"
  description                 = "This is a test description"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels {
    env = "default"
  }
}


resource "google_bigquery_table" "default" {
  //dataset_id = "${google_bigquery_dataset.default.id}"
  dataset_id = "test-terraform-bq}"
  table_id   = "test"

  time_partitioning {
    type = "DAY"
  }

  labels {
    env = "default"
  }

  schema = "${file("terraform-bq-schema.json")}"
}
