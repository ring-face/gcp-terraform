variable "project_id" {
  description = "The ID of the Google Cloud project"
  type        = string
}

variable "region" {
  description = "The region where resources will be created"
  default     = "europe-west3"
  type        = string
}

variable "data_bucket_name" {
  description = "The name of the GCS to store all files"
  type        = string
}

variable "cloud_run_connector"{
  description = "the CR that maps to the function of the downloader"
}

variable "dns-to-global-ip" {
  description = "the FQDN that points to the IP address created in this TF"
}

# variable "ssl_certificate" {
#   description = "the SSL certificate exposed to the interenet"
# }

# variable "ip_address_name" {
#   description = "the GCP created IP address"
  
# }