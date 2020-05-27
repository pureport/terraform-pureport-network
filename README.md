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

## Compatibility

This module is designed for use with Terraform 0.12 or later.

## Requirements

* Terraform 0.12 or later
* Pureport Provider 1.1.8 or later

### Provider configuration

Please see this [link](http://terraform.io/docs/providers/pureport/index.html) 
for details on how to configure the Pureport provider using API keys.

## Usage

Below is an example of using the Pureport module to easily create a new
cloud native network.

```
    module "pureport_network" {
       source       = "../../privateip/terraform-pureport-modules"
       account_id   = var.pureport_account_id
       network_name = "default"
    }

```

## Inputs

| Name         | Description                                              | Type   | Default | Required |
| --- | --- | --- | --- | --- |
| account_id   | The Pureport account ID to create the network under      | string | null    | yes      |
| network_name | The name of the network to create on the Pureport Fabric | stirng | null    | yes      |


## Outputs

| Name | Description                                                               |
| ---- | ------------------------------------------------------------------------- |
| href | The Pureport network href to be used to attach connections to the network |

## Contirbuting

Please see (CONTRIBUTING)[contributing.md] for details on contributing to this project
