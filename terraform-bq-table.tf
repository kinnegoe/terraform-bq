// Configure the Google Cloud provider
provider "google" {
  credentials = "${file("../JasonM-ML-Project888-0dec86ec8b3b.json")}"
  project     = "jasonm-ml-project888" //project must be existing
  region      = "us-central1"
}


resource "google_bigquery_dataset" "default" {
  dataset_id                  = "testterraformbq" 
  friendly_name               = "testterraformbq"
  description                 = "This is a test testterraformbq"
  location                    = "EU"
  default_table_expiration_ms = 3600000

  labels {
    env = "default"
  }
}


resource "google_bigquery_table" "default" {
  //dataset_id = "${google_bigquery_dataset.default.id}"
  dataset_id = "testterraformbq" //must be same as above - must exist
  table_id   = "test"

  time_partitioning {
    type = "DAY"
  }

  labels {
    env = "default"
  }

  schema = "${file("terraform-bq-schema.json")}"
}
