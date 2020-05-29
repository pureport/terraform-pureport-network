# Multicloud

This example demonstrates how to use create a multicloud network

## Setup

1. Obtain vaild cloud service account credentials for Google Cloud, Amazon
   Web Service and Pureport

2. Export the credentials in your local environment

```
   export PUREPORT_API_KEY=xxxxxxxxx
   export PUREPORT_API_SECRET=xxxxxxxxx
   export PUREPORT_ACCOUNT_ID=xxxxxxxxx

   export AWS_ACCESS_KEY=xxxxxxxxx
   export AWS_SECRET_ACCESS_KEY=xxxxxxxxx
   export AWS_ACCOUNT_ID=xxxxxxxxx

   export GOOGLE_CREDENTIALS=<path to gcp json>
   export GCP_PROJECT=xxxxxxxxx

   export TF_VAR_pureport_account_id=${PUREPORT_ACCOUNT_ID}
   export TF_VAR_gcp_project=${GCP_PROJECT}
   export TF_VAR_aws_account_id=${AWS_ACCOUNT_ID}
```

3.  Run Terraform

```
   terraform init
   terraform plan -var-file vars/default.tfvars
   terraform apply -var-file vars/default.tfvars
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_account\_id | The Amazon Web Service account id to use | `string` | n/a | yes |
| aws\_network\_name | The name of the Amazon Web Service network to be created | `string` | `null` | no |
| aws\_region | The Amazon Web Service region to use | `string` | n/a | yes |
| gcp\_network\_name | The name of the Google Cloud network to be created | `string` | `null` | no |
| gcp\_project | The Google Cloud project to use | `string` | n/a | yes |
| gcp\_region | The Google Cloud region to use | `string` | n/a | yes |
| pureport\_account\_id | The Pureport account id used to host the created network | `string` | n/a | yes |
| pureport\_network\_name | The name of the Pureport network to be created | `string` | `null` | no |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
