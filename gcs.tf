resource "google_storage_bucket" "ringface_data_bucket" {
  name     = var.data_bucket_name
  location = "europe-west3"

  storage_class = "STANDARD"
}

resource "google_storage_bucket_iam_binding" "bucket_iam_binding" {
  bucket = google_storage_bucket.ringface_data_bucket.id
  role   = "roles/storage.objectViewer"

  members = [
    "serviceAccount:${google_service_account.connector_sa.email}",
  ]
}