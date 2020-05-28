# Pureport Network Module

This submodule is included with the `terraform-pureport-network` module and is
responsible for creating connections from Google Cloud to Pureport Fabric using 
Google Cloud Interconnect.

## Usage

This module is designed for use with Terraform 0.12 or later.

### Requirements

See [versions.tf](versions.tf) for required Terraform providers

### Example

```hcl
module "google_cloud_interconnect" {
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

| Name                         | Description                                                            | Type                                                               | Default  | Required |
| --- | --- | --- | --- | --- |
| connection_speed             | The speed of the connect expressed in Mbps                             | number                                                             | null     | yes      |
| gcp_network_name             | The name of the Google Cloud network to associate with this connection | string                                                             | null     | yes      |
| gcp_network_description      | Short description to include with the Google Cloud network             | string                                                             | null     | no       |
| gcp_network_routing_mode     | Specifies the network routing mode as either `GLOBAL` or `REGIONAL`    | string                                                             | `GLOBAL` | no       |
| pureport_network             | name                                                                   | The name of the Pureport network to associate with this connection | string   | null     | yes |
| pureport_network_description | Short description to include wiht the Pureport network definition      | string                                                             | null     | no       |


## Outputs

| Name          | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| connection_id | The auto-generated `connection_id` value used to configure the connection |


