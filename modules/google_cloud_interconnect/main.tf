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
  region_to_location = {
    us-east1    = "/locations/us-wdc"
    us-east4    = "/locations/us-wdc"
    us-central1 = "/locations/us-chi"
    us-west1    = "/locations/us-sea"
    us-west2    = "/locations/us-sjc"
  }
}

resource "google_compute_router" "main" {
  name    = "router-${local.connection_id}-${count.index + 1}"
  network = var.gcp_network_name
  bgp {
    asn = "16550"
  }
  count = 2
}

resource "google_compute_interconnect_attachment" "main" {
  name                     = "vlan-${local.connection_id}-${count.index + 1}"
  router                   = element(google_compute_router.main.*.self_link, count.index)
  type                     = "PARTNER"
  edge_availability_domain = "AVAILABILITY_DOMAIN_${count.index + 1}"

  depends_on = [google_compute_router.main]
  count      = 2
}

resource "pureport_google_cloud_connection" "main" {
  name = "conn-${local.connection_id}"

  speed             = var.connection_speed
  high_availability = true
  location_href     = local.region_to_location[google_compute_router.main.0.region]
  network_href      = var.pureport_network_href

  primary_pairing_key   = google_compute_interconnect_attachment.main.0.pairing_key
  secondary_pairing_key = google_compute_interconnect_attachment.main.1.pairing_key

  depends_on = [google_compute_interconnect_attachment.main]
}
