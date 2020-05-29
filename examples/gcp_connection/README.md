# Creating connections to Google Cloud

This example demonstrates a simple connection from Pureport to Google Cloud

## Setup

1. Obtain vaild cloud service account credentials for Google Cloud and Pureport

2. Export the credentials in your local environment

```bash
   export PUREPORT_API_KEY=xxxxxxxxx
   export PUREPORT_API_SECRET=xxxxxxxxx
   export PUREPORT_ACCOUNT_ID=xxxxxxxxx

   export GOOGLE_CREDENTIALS=<path to gcp json>
   export GCP_PROJECT=xxxxxxxxx

   export TF_VAR_pureport_account_id=${PUREPORT_ACCOUNT_ID}
   export TF_VAR_gcp_project=${GCP_PROJECT}
```

3. Update input variables (optional)

```hcl
  gcp_region                = "us-central1"
  pureport_connection_speed = 50
```


4.  Run Terraform

```bash
   terraform init
   terraform plan -var-file default.tfvars
   terraform apply -var-file default.tfvars
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gcp\_project | The Google Cloud project to use | `string` | n/a | yes |
| gcp\_region | The Google Cloud region to use | `string` | n/a | yes |
| pureport\_account\_id | The Pureport account id used to host the created network | `string` | n/a | yes |
| pureport\_connection\_speed | The Pureport connection speed in Mbps of the connection to create. | `number` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
