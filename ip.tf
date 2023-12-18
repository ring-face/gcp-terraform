resource "google_compute_global_address" "ringface_global_ip" {
  name = "${var.project_id}-global-address"
}
