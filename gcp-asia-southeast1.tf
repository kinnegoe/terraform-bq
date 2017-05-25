#####################################################################
# Google Cloud Platform
#####################################################################
provider "google" {  
    credentials = "${file("JasonM-ML-Project888-0dec86ec8b3b.json")}"
    project = "jasonm-ml-project888"
    region = "asia-southeast1"
}
