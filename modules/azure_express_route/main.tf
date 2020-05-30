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

locals {
  connection_id = substr(sha1(uuid()), 0, 5)

  peering_enum_to_pureport_location = {
    chicago        = "/locations/us-chi"
    dallas         = "/locations/us-dal"
    seattle        = "/locations/us-sea"
    silicon_valley = "/locations/us-sjc"
    washington_dc  = "/locations/ws-wdc"
  }

  peering_enum_to_azure_location = {
    chicago        = "northcentralus"
    dallas         = "southcentralus"
    seattle        = "westus2"
    silicon_valley = "westus"
    washington_dc  = "eastus"
  }

  peering_enum_to_peering_location = {
    chicago        = "Chicago"
    dallas         = "Dallas"
    seattle        = "Seattle"
    silicon_valley = "Silicon Valley"
    washington_dc  = "Washington DC"
  }

}

resource "azurerm_express_route_circuit" "main" {
  name                  = "circuit-${local.connection_id}"
  location              = local.peering_enum_to_azure_location[var.azure_peering_location]
  resource_group_name   = var.azure_resource_group_name
  service_provider_name = "Equinix"
  peering_location      = local.peering_enum_to_peering_location[var.azure_peering_location]
  bandwidth_in_mbps     = var.pureport_connection_speed
  sku {
    tier   = "Standard"
    family = "MeteredData"
  }
}

resource "pureport_azure_connection" "main" {
  name              = "conn-${local.connection_id}"
  speed             = var.pureport_connection_speed
  high_availability = true
  location_href     = local.peering_enum_to_pureport_location[var.azure_peering_location]
  network_href      = var.pureport_network_href
  service_key       = azurerm_express_route_circuit.main.service_key
}

resource "azurerm_express_route_circuit_peering" "main" {
  express_route_circuit_name    = azurerm_express_route_circuit.main.name
  resource_group_name           = var.azure_resource_group_name
  peering_type                  = "AzurePrivatePeering"
  peer_asn                      = pureport_azure_connection.main.gateways.0.pureport_asn
  primary_peer_address_prefix   = pureport_azure_connection.main.gateways.0.peering_subnet
  secondary_peer_address_prefix = pureport_azure_connection.main.gateways.1.peering_subnet
  vlan_id                       = pureport_azure_connection.main.gateways.0.vlan
  shared_key                    = pureport_azure_connection.main.gateways.0.bgp_password
}
