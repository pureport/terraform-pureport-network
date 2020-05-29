# Pureport Network Module

This submodule is included with the `terraform-pureport-network` module and is
responsible for creating connections from Google Cloud to Pureport Fabric using
Google Cloud Interconnect.

## Usage

This module is designed for use with Terraform 0.12 or later.

### Example

```hcl
module "google_cloud_interconnect" {
  source = "git::https://github.com/pureport/terraform-pureport-network//modules/google_cloud_interconnect"

  // Pureport network properties
  pureport_network_href = module.pureport_network.href
  pureport_connection_speed = var.speed

  // Google Cloud network properties
  gcp_network_name = module.google_cloud_network.network_name

}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| gcp\_network\_description | Short description of the Google Cloud network | `string` | `null` | no |
| gcp\_network\_name | The Google Cloud network to attach to this connection | `string` | n/a | yes |
| gcp\_network\_routing\_mode | Set the network-wide routing mode.  Valid values are 'GLOBAL' or 'REGIONAL' | `string` | `"GLOBAL"` | no |
| pureport\_connection\_speed | The Pureport connection speed in Mbps of the connection to create. | `number` | n/a | yes |
| pureport\_network\_description | Short description of the Pureport network | `string` | `null` | no |
| pureport\_network\_href | Pureport network link to associate with this connection | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| connection\_id | The generated connection ID for the configured connection |
| pureport\_connection\_name | The generated Pureport connection name |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
