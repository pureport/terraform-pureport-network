//
// Connection input values
//
variable "connection_speed" {
  type        = number
  description = "The speed in Mbps of the connection to create."
}

//
// Amazon Web Service input values
//
variable "aws_account_id" {
  type        = string
  description = "The AWS account ID to use for creating the connection"
}

variable "aws_region" {
  type        = string
  description = "Amazon Web Service region to host this connection"
}

variable "aws_vpn_gateway_id" {
  type        = string
  description = "Amazon Web Servce VPN Gateway to associate with the Direct Connect Gateway"
}


//
// Pureport input values
//
variable "pureport_network_description" {
  type        = string
  description = "Short description of the Pureport network"
  default     = null
}

variable "pureport_network_href" {
  type        = string
  description = "Pureport network link to associate with this connection"
}
