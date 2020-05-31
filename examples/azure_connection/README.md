# Connecting to Azure

This example demonstrates how to create a connection to Azure

## Setup

1. Obtain vaild cloud service account credentials for Azure and Pureport

2. Export the credentials in your local environment

```bash
   export PUREPORT_API_KEY=xxxxxxxxx
   export PUREPORT_API_SECRET=xxxxxxxxx
   export PUREPORT_ACCOUNT_ID=xxxxxxxxx

   export ARM_CLIENT_ID=xxxxxxxxx
   export ARM_CLIENT_SECRET=xxxxxxxxx
   export ARM_TENANT_ID=xxxxxxxxx
   export ARM_SUBSCRIPTION_ID=xxxxxxxxx

   export TF_VAR_pureport_account_id=${PUREPORT_ACCOUNT_ID}
```

3. Update input variables (optional)

```hcl
  azure_peering_location    = "dallas"
  pureport_connection_speed = 100
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
| azure\_peering\_location | The location of the peering circuit in Azure | `string` | n/a | yes |
| pureport\_account\_id | The Pureport account id used to host the created network | `string` | n/a | yes |
| pureport\_connection\_speed | The Pureport connection speed in Mbps of the connection to create. | `number` | n/a | yes |

## Outputs

No output.

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
