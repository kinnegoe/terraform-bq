// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../JasonM-ML-Project888-0dec86ec8b3b.json")}"
  project     = "jasonm-ml-project888"
  region      = "us-central1"
}

resource "google_bigquery_dataset" "default" {
  dataset_id                  = "test_terraform"
  friendly_name               = "test_terraform"
  description                 = "This is a test description - terraform"
  location                    = "US"
  default_table_expiration_ms = 3600000

  labels {
    env = "default"
  }
 //schema = "${file("terraform-bq-schema.json")}"
}
