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
module _direct_connect" {
  source = "git:https://github.com/pureport/terraform-pureport-network//modules/aws_direct_connect"

    connection_speed = var.speed

      // AWS Direct Connect settings
        aws_region         = var.aws_region
          aws_account_id     = var.aws_account_id
            aws_vpn_gateway_id = module.aws_network.vgw_id

              // Pureport network properties
                pureport_network_href = module.pureport_network.href
                }
                google_cloud_interconnect" {
  source = "./modules/google_cloud_interconnect"

  // Connection properties for connecting two networks
  connection_speed = var.speed

  // Google Cloud network properties 
  gcp_network_name = module.google_cloud_network.network_name

  // Pureport network properties
  pureport_network_href = module.pureport_network.href
}

```

## Inputs

| Name                         | Description                                                       | Type   | Default | Required |
| ---------------------------- | ----------------------------------------------------------------- | ------ | ------- | -------- |
| connection_speed             | The speed of the connect expressed in Mbps                        | number | null    | yes      |
| aws_account_id               | The AWS account ID to create this connection under                | string | null    | yes      |
| aws_region                   | The AWS region to create this connection in                       | string | null    | yes      |
| aws_vpn_gateway_id           | The AWS virtual gateway ID to associate with this connection      | string | null    | yes      |
| pureport_network_href        | The Pureport network link to associate with this connection       | string | null    | yes      |
| pureport_network_description | Short description to include wiht the Pureport network definition | string | null    | no       |


## Outputs

| Name          | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| connection_id | The auto-generated `connection_id` value used to configure the connection |


