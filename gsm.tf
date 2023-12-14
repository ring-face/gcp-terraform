resource "google_secret_manager_secret" "ring_auth_secret" {
  secret_id = "RING_AUTH_SECRET"
  replication {
        auto {}
  }
}

resource "google_secret_manager_secret_version" "ring_auth_secret_version" {
  secret = google_secret_manager_secret.ring_auth_secret.id

  secret_data = file("${path.module}/oauth-authorization.json")

}

resource "google_secret_manager_secret_iam_binding" "secret_accessor" {
  secret_id = google_secret_manager_secret.ring_auth_secret.id
  role      = "roles/secretmanager.secretAccessor"

  members = [
    "serviceAccount:${google_service_account.connector_sa.email}",
  ]
}

resource "google_secret_manager_secret_iam_binding" "secret_version_adder" {
  secret_id = google_secret_manager_secret.ring_auth_secret.id
  role      = "roles/secretmanager.secretVersionAdder"

  members = [
    "serviceAccount:${google_service_account.connector_sa.email}",
  ]
}