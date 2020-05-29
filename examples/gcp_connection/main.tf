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

locals {
  network_id = substr(sha1(uuid()), 0, 5)
}

//
// Ensure the Google Cloud network exists
//
module "google_cloud_network" {
  source     = "terraform-google-modules/network/google"
  version    = "~> 2.3"
  project_id = var.gcp_project

  network_name            = "vpc-${local.network_id}"
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = true
  subnets                 = []
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
  //source     = "github.com/pureport/terraform-pureport-network"
  source = "../.."

  name       = "network-${local.network_id}"
  account_id = var.pureport_account_id
}

//
// Ensure the connection from Google Cloud to Pureport exists
//
module "google_cloud_interconnect" {
  //
  // When using this module in operational environments, you can set the source
  // to point directly to the Github repo as shown in the below example.  This
  // example uses a relative path for easy testing.
  //
  // source = "git::https://github.com/pureport/terraform-pureport-network//modules/google_cloud_interconnect"
  source = "../../modules/google_cloud_interconnect"

  // Pureport network properties
  pureport_connection_speed = var.pureport_connection_speed
  pureport_network_href     = module.pureport_network.href

  // Google Cloud network properties
  gcp_network_name = module.google_cloud_network.network_name
}
