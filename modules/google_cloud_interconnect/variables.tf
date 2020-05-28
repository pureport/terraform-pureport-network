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
// Google Cloud input parameters
//
variable "gcp_network_name" {
  type        = string
  description = "The Google Cloud network to attach to this connection"
}

variable "gcp_network_description" {
  type        = string
  description = "Short description of the Google Cloud network"
  default     = null
}

variable "gcp_network_routing_mode" {
  type        = string
  description = "Set the network-wide routing mode.  Valid values are 'GLOBAL' or 'REGIONAL'"
  default     = "GLOBAL"
}


//
// Pureport input values
//
variable "pureport_connection_speed" {
  type        = number
  description = "The Pureport connection speed in Mbps of the connection to create."
}

variable "pureport_network_description" {
  type        = string
  description = "Short description of the Pureport network"
  default     = null
}

variable "pureport_network_href" {
  type        = string
  description = "Pureport network link to associate with this connection"
}
