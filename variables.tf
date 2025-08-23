variable "env" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
}

variable "resource_group_name" {
  type        = string
  description = "The cointainer to hold all resource"
  default     = "kml_rg_main-1a21c94512594f06"
}

variable "location" {
  type        = string
  description = "The location where resource are provision"
  default     = "westus"
}

variable "network_config" {
  type        = tuple([string, string, number])
  description = "Network Configurations"
  default     = ["192.168.0.0/16", "192.168.2.0", 24]
}


variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
}

variable "lb_backend_pool_name" {
  description = "Name of the backend pool for Load Balancer"
  type        = string
}

variable "lb_frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway for outbound connectivity"
  type        = string
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
}

variable "nsg_rules" {
  description = "List of NSG rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "Allow-LB"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    }
  ]
}

variable "state_rg" {
  description = "Resource Group for storing Terraform backend state"
  type        = string
}

variable "state_storage_account" {
  description = "Storage Account for Terraform backend state"
  type        = string
}

variable "state_container" {
  description = "Blob Container for Terraform backend state"
  type        = string
}


variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default = {
    modified_on = formatdate("YYYY_MM_DD", timestamp())
  }
}
