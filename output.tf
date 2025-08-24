/*output "application_endpoint" {
  value = "http://${azurerm_public_ip.public_ip.fqdn}/index.php"
}


/* value = "http://${azurerm_public_ip.na.fqdn}/index.php */


output "lb_public_ip" {
  value = azurerm_public_ip.lb.ip_address
}

output "lb_dns" {
  value = azurerm_public_ip.lb.fqdn
}

output "vmss_name" {
  value = azurerm_orchestrated_virtual_machine_scale_set.web_server.name
}
