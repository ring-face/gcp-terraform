resource "google_compute_region_network_endpoint_group" "ringface_neg" {
  name                  = "${var.project_id}-neg"
  network_endpoint_type = "SERVERLESS"
  region                = "europe-west3"
  cloud_run {
    service = var.cloud_run_connector
  }
}

resource "google_compute_backend_service" "ringface_backend_service" {
  name                  = "${var.project_id}-backend-service"
  protocol              = "HTTPS"
  load_balancing_scheme = "EXTERNAL"
  timeout_sec           = 30
  backend {
    group = google_compute_region_network_endpoint_group.ringface_neg.id
  }
}

resource "google_compute_url_map" "ringface_url_map" {
  name            = "${var.project_id}-url-map"
  default_service = google_compute_backend_service.ringface_backend_service.id
}

resource "google_compute_managed_ssl_certificate" "ringface_ssl_certificate" {
  name    = "${var.project_id}-ssl-certificate"
  managed {
    domains = [var.dns-to-global-ip]  
  }
}

resource "google_compute_target_https_proxy" "ringface_target_proxy" {
  name             = "${var.project_id}-target-proxy"
  url_map          = google_compute_url_map.ringface_url_map.id
  quic_override    = "NONE"
  ssl_certificates = [google_compute_managed_ssl_certificate.ringface_ssl_certificate.self_link]
}

resource "google_compute_global_forwarding_rule" "ringface_forwarding_rule" {
  name                  = "${var.project_id}-forwarding-rule"
  target                = google_compute_target_https_proxy.ringface_target_proxy.id
  load_balancing_scheme = "EXTERNAL"
  port_range            = "443"
#   ip_address            = var.ip_address_name
  ip_address = google_compute_global_address.ringface_global_ip.address

  ip_protocol           = "TCP"
}
