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

### Requirements

See [versions.tf](versions.tf) for required Terraform providers

Note: The AWS CLI must be installed on the local machine and configured to 
confirm the AWS Direct Connect connection.

### Example

Below is an example of using the Pureport module to easily create a new
cloud native network.

```hcl
module "pureport_network" {
    source       = "./modules/terraform-pureport-modules"
    account_id   = var.pureport_account_id
    network_name = "default"
}

```

## Inputs

| Name        | Description                                              | Type   | Default | Required |
| ----------- | -------------------------------------------------------- | ------ | ------- | -------- |
| account_id  | The Pureport account ID to create the network under      | string | null    | yes      |
| name        | The name of the network to create on the Pureport Fabric | string | null    | yes      |
| description | Short, one line description of the Pureport network      | string | null    | no       |


## Outputs

| Name | Description                                                               |
| ---- | ------------------------------------------------------------------------- |
| href | The Pureport network href to be used to attach connections to the network |

## Contirbuting

Please see [CONTRIBUTING](contributing.md) for details on contributing to this project
