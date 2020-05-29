# Pureport Terraform Module

This module provides support for building cloud native networks using the
Pureport Fabric.  It automates the provisioning of virtual cloud native networks
and cloud connections to those networks.

This module supports:

  * Pureport Networks
  * Connecting Google Cloud to a Pureport network
  * Connecting Amazon Web Service to a Pureport network

Public cloud connectivity implementations are supported as submodules.  See
the modules directory for usage.

## Usage

This module is designed for use with Terraform 0.12 or later.

Note: The AWS CLI must be installed on the local machine and configured to
confirm the AWS Direct Connect connection.

### Example

Below is an example of using the Pureport module to easily create a new
cloud native network.

```hcl
module "pureport_network" {
    source       = "github.com/pureport/terraform-pureport-network"
    account_id   = var.pureport_account_id
    network_name = "default"
}

```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_id | The Pureport account ID to create the connection for | `string` | n/a | yes |
| description | Describes the Pureport network to be created | `string` | `null` | no |
| name | The name of the Pureport network to be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| href | Link the identifies the network within Pureport |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->


## Contirbuting

Please see [CONTRIBUTING](contributing.md) for details on contributing to this project
