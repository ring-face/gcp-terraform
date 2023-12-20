resource "google_service_account" "connector_sa" {
  account_id = "connector-sa"
  display_name = "Connector Service Account"
}


resource "google_service_account" "classifier_sa" {
  account_id = "classifier-sa"
  display_name = "Classifier Service Account"
}


