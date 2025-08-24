variable "env" {
  description = "Deployment environment (dev, staging, prod)"
  type        = string
  default     = "dev"
}

variable "resource_group_name" {
  description = "Resource Group name"
  type        = string
  default     = "kml_rg_main-7ef002048c3c41fc"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "westus"
}

variable "network_config" {
  description = "Network Configurations [vnet_cidr, subnet_prefix, subnet_mask]"
  type        = tuple([string, string, number])
  default     = ["192.168.0.0/16", "192.168.2.0", 24]
}

variable "lb_name" {
  description = "Name of the Load Balancer"
  type        = string
  default     = "loadbalancer"
}

variable "lb_backend_pool_name" {
  description = "Name of the backend pool for Load Balancer"
  type        = string
  default     = "myBackendAddresspool"
}

variable "lb_frontend_ip_name" {
  description = "Name of the frontend IP configuration"
  type        = string
  default     = "lb_frontend_ip"
}

variable "nat_gateway_name" {
  description = "Name of the NAT Gateway"
  type        = string
  default     = "nat_gateway"
}

variable "nsg_name" {
  description = "Name of the Network Security Group"
  type        = string
  default     = "nsg"
}

variable "nsg_rules" {
  description = "NSG rules list"
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

  # Default: allow LB, allow SSH, deny-all inbound, allow-all outbound
  default = [
    {
      name                       = "allow-lb"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-ssh-via-lb-nat"
      priority                   = 150
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "deny-all-inbound"
      priority                   = 200
      direction                  = "Inbound"
      access                     = "Deny"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "allow-all-outbound"
      priority                   = 100
      direction                  = "Outbound"
      access                     = "Allow"
      protocol                   = "*"
      source_port_range          = "*"
      destination_port_range     = "*"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  ]
}

variable "tags" {
  description = "Common tags applied to all resources"
  type        = map(string)
  default     = {}

}




variable "storage_account_name" {
  type        = string
  description = "The Storage account for the blob"
  default     = "train11567"
}

variable "container_name" {
  type        = string
  description = "The container for the tfstate file"
  default     = "tfstate"
}
