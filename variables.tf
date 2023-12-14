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