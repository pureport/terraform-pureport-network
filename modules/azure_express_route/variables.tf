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


//
// Azure input values
//
variable "azure_peering_location" {
  type        = string
  description = "The Azure ExpressRoute peering location for this connection"
}

variable "azure_resource_group_name" {
  type        = string
  description = "Name of the Azure Resource Group to add this connection to"
}

//
// Pureport input values
//
variable "pureport_connection_speed" {
  type        = number
  description = "The connection speed to create expresed in Mbps"
}

variable "pureport_network_href" {
  type        = string
  description = "Pureport network link to associate with this connection"
}
