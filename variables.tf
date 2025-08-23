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
