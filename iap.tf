resource "google_project_service" "iap_api" {
  service = "iap.googleapis.com"
  project = var.project_id
}

# resource "google_iap_web_backend_service_iam_binding" "iap_binding" {
#   project = var.project_id
#   web_backend_service = google_compute_backend_service.ringface_backend_service.id
#   role            = "roles/iap.httpsResourceAccessor"

#   members = var.iap-members-connector
# }
