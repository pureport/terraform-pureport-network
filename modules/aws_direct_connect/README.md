# Pureport Network Module

This submodule is included with the `terraform-pureport-network` module and is
responsible for creating connections from Amazon Web Service to Pureport Fabric 
using Amazon Web Service Direct Connect

## Usage

This module is designed for use with Terraform 0.12 or later.

### Requirements

See [versions.tf](versions.tf) for required Terraform providers

### Example

```hcl

module "aws_direct_connect" {
  source = "git::https://github.com/pureport/terraform-pureport-network//modules/aws_direct_connect"

  // Pureport network properties
  pureport_connection_speed = 50
  pureport_network_href     = module.pureport_network.href

  // AWS Direct Connect settings
  aws_region         = var.aws_region
  aws_account_id     = var.aws_account_id
  aws_vpn_gateway_id = module.aws_network.vgw_id
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| aws\_account\_id | The AWS account ID to use for creating the connection | `string` | n/a | yes |
| aws\_region | Amazon Web Service region to host this connection | `string` | n/a | yes |
| aws\_vpn\_gateway\_id | Amazon Web Servce VPN Gateway to associate with the Direct Connect Gateway | `string` | n/a | yes |
| pureport\_connection\_speed | The connection speed in Mbps to create | `number` | n/a | yes |
| pureport\_network\_description | Short description of the Pureport network | `string` | `null` | no |
| pureport\_network\_href | Pureport network link to associate with this connection | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| connection\_id | The generated connection ID for the configured connection |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
