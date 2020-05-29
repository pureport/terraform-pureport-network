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
// Google Cloud input values
//
variable "gcp_region" {
  type        = string
  description = "The Google Cloud region to use"
}

variable "gcp_project" {
  type        = string
  description = "The Google Cloud project to use"
}


//
// Pureport input values
//
variable "pureport_account_id" {
  type        = string
  description = "The Pureport account id used to host the created network"
}

variable "pureport_connection_speed" {
  type        = number
  description = "The Pureport connection speed in Mbps of the connection to create."
}
