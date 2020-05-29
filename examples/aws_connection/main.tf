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

provider "aws" {
  region = var.aws_region
}

locals {
  network_id = substr(sha1(uuid()), 0, 5)
}

//
// Ensure the Amazon Web Service VPC exists
//
module "aws_network" {
  source = "terraform-aws-modules/vpc/aws"

  name               = "vpc-${local.network_id}"
  enable_vpn_gateway = true
  cidr               = "10.0.0.0/16"
}

//
// Ensure the Pureport network exists
//
module "pureport_network" {
  //
  // When using this module in operational environments, you can set the source
  // to point directly to the Github repo as shown in the below example.  This
  // example uses a relative path for easy testing.
  //
  // source  = "github.com/pureport/terraform-pureport-network"
  source = "../.."

  name       = "network-${local.network_id}"
  account_id = var.pureport_account_id
}

//
// Ensure the connection from Amazon Web Service to Pureport exists
//
module "aws_direct_connect" {
  //
  // When using this module in operational environments, you can set the source
  // to point directly to the Github repo as shown in the below example.  This
  // example uses a relative path for easy testing.
  //
  // source = "git::https://github.com/pureport/terraform-pureport-network//modules/aws_direct_connect"
  source = "../../modules/aws_direct_connect"

  // Pureport network properties
  pureport_connection_speed = 50
  pureport_network_href     = module.pureport_network.href

  // AWS Direct Connect settings
  aws_region         = var.aws_region
  aws_account_id     = var.aws_account_id
  aws_vpn_gateway_id = module.aws_network.vgw_id
}
