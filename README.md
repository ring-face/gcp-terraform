# Terraform support for GCS objects

Prerequisites:

* set up access to GCP for the gcloud tool and terraform. `gcloud auth application-default login` will do the job
* manually create a project you want to use in the cloud console, eg `ringface-2`
* set the project name in `terraform.tfvars`
* set the unique bucket name you want to create in `terraform.tfvars`

```bash
project_id       = "ringface-2"
data_bucket_name = "ringface_data_bucket"
```

* copy the `oauth-authorization.json` (ring access token) to this folder. See [./startCreateAuthFile.py](https://github.com/ring-face/ringface-connector) on how to create this file.

## Terraform it

Initialise terraform by `terraform init`

At this point you can create all the GCP resources by executing `terraform apply`
