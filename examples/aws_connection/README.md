# Creating connections to Amazon Web Service

This example demonstrates a simple connection from Pureport to Amazon Web
Service over DirectConnect.

## Setup

1. Obtain vaild cloud service account credentials for Amazon Web Service and Pureport

2. Export the credentials in your local environment

```bash
   export PUREPORT_API_KEY=xxxxxxxxx
   export PUREPORT_API_SECRET=xxxxxxxxx
   export PUREPORT_ACCOUNT_ID=xxxxxxxxx

   export AWS_ACCESS_KEY=xxxxxxxxx
   export AWS_SECRET_ACCESS_KEY=xxxxxxxxx
   export AWS_ACCOUNT_ID=xxxxxxxxx

   export TF_VAR_pureport_account_id=${PUREPORT_ACCOUNT_ID}
   export TF_VAR_aws_account_id=${AWS_ACCOUNT_ID}
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
| aws\_account\_id | The Amazon Web Service account id to use | `string` | n/a | yes |
| aws\_region | The Amazon Web Service region to use | `string` | n/a | yes |
| pureport\_account\_id | The Pureport account id used to host the created network | `string` | n/a | yes |
| pureport\_connection\_speed | The Pureport connection speed in Mbps of the connection to create. | `number` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
