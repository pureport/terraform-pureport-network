locals {
  connection_id = substr(sha1(uuid()), 0, 5)
  region_to_location = {
    us-east-1 = "/locations/us-wdc"
    us-east-2 = "/locations/us-chi"
    us-west-1 = "/locations/us-sjc"
    us-west-2 = "/locations/us-sea"
  }
}

resource "aws_dx_gateway" "main" {
  name            = "dxg-${local.connection_id}"
  amazon_side_asn = 64512
}

resource "aws_dx_gateway_association" "main" {
  dx_gateway_id         = aws_dx_gateway.main.id
  associated_gateway_id = var.aws_vpn_gateway_id
}

resource "pureport_aws_connection" "main" {
  name = "conn-${local.connection_id}"

  speed             = var.connection_speed
  high_availability = true

  location_href = local.region_to_location[var.aws_region]
  network_href  = var.pureport_network_href

  aws_region     = var.aws_region
  aws_account_id = var.aws_account_id

  provisioner "local-exec" {
    command = "aws directconnect --region ${var.aws_region} confirm-connection --connection-id ${pureport_aws_connection.main.gateways[0].remote_id}"
  }

  provisioner "local-exec" {
    command = "aws directconnect --region ${var.aws_region} confirm-connection --connection-id ${pureport_aws_connection.main.gateways[1].remote_id}"
  }

  provisioner "local-exec" {
    command = "sleep 300"
  }
}

resource "aws_dx_private_virtual_interface" "main" {
  name = "vif-${local.connection_id}-${count.index + 1}"

  connection_id = element(pureport_aws_connection.main.gateways.*.remote_id, count.index)
  dx_gateway_id = aws_dx_gateway.main.id

  address_family   = "ipv4"
  vlan             = element(pureport_aws_connection.main.gateways.*.vlan, count.index)
  bgp_asn          = element(pureport_aws_connection.main.gateways.*.pureport_asn, count.index)
  customer_address = element(pureport_aws_connection.main.gateways.*.pureport_ip, count.index)
  amazon_address   = element(pureport_aws_connection.main.gateways.*.customer_ip, count.index)
  bgp_auth_key     = element(pureport_aws_connection.main.gateways.*.bgp_password, count.index)

  count = 2
}
