output "lb_public_ip" {
  description = "Public IP of the load balancer"
  value       = azurerm_public_ip.lb.ip_address
}

output "lb_dns" {
  description = "DNS name of the load balancer"
  value       = azurerm_public_ip.lb.fqdn
}

output "vmss_name" {
  description = "Name of the Virtual Machine Scale Set"
  value       = azurerm_orchestrated_virtual_machine_scale_set.web_server.name
}

output "application_url" {
  description = "URL to access the web application"
  value       = "http://${azurerm_public_ip.lb.fqdn}"
}
