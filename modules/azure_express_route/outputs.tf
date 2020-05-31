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

output "connection_id" {
  description = "The generated connection ID for the configured connection"
  value       = local.connection_id
}

output "pureport_connection_name" {
  description = "The generated Pureport connection name"
  value       = pureport_azure_connection.main.name
}

output "pureport_location_href" {
  description = "The selected Pureport location href"
  value       = pureport_azure_connection.main.location_href
}

output "azure_circuit_name" {
  description = "The generated Azure ExpressRoute circuit name"
  value       = azurerm_express_route_circuit.main.name
}

output "azure_circuit_service_key" {
  description = "The Azure circuit serivce key used"
  value       = azurerm_express_route_circuit.main.service_key
}

output "azure_location" {
  description = "The Azure location selected"
  value       = azurerm_express_route_circuit.main.location
}
