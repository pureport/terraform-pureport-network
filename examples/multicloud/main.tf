/**
 * Copyright (C) 2020 Pureport
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/

provider "pureport" {
}

provider "google" {
  region  = var.gcp_region
  project = var.gcp_project
}

provider "aws" {
  region = var.aws_region
}

locals {
  network_id   = substr(sha1(uuid()), 0, 5)
  network_name = "network-${local.network_id}"
}

//
// Ensure the Google Cloud network exists
//
module "google_cloud_network" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 2.3"
  project_id = var.gcp_project

  network_name            = var.gcp_network_name == "" ? local.network_name : var.gcp_network_name
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = true
  subnets                 = []
}

//
// Ensure the Amazon Web Service VPC exists
//
module "aws_network" {
  source = "terraform-aws-modules/vpc/aws"

  name               = var.aws_network_name == "" ? local.network_name : var.aws_network_name
  enable_vpn_gateway = true
  cidr               = "10.0.0.0/16"
}

//
// Ensure the Pureport network exists
//
module "pureport_network" {
  source     = "github.com/pureport/terraform-pureport-network"
  account_id = var.pureport_account_id

  name = var.pureport_network_name == "" ? local.network_name : var.pureport_network_name
}

//
// Ensure the connection from Google Cloud to Pureport exists
//
module "google_cloud_interconnect" {
  source = "git::https://github.com/pureport/terraform-pureport-network//modules/google_cloud_interconnect"

  // Pureport network properties
  pureport_connection_speed = 50
  pureport_network_href     = module.pureport_network.href

  // Google Cloud network properties
  gcp_network_name = module.google_cloud_network.network_name
}

//
// Ensure the connection from Amazon Web Service to Pureport exists
//
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
