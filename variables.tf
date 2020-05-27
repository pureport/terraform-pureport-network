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
variable "network_name" {
  type        = string
  description = "Pureport network name associated with this cloud network"
}

variable "description" {
  type        = string
  description = "Describes the Pureport network to be created"
  default     = null
}

variable "account_id" {
  type        = string
  description = "The Pureport account ID to create the connection for"
}


