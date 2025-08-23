output "application_endpoint" {
  value = "http://${azurerm_public_ip.public_ip.fqdn}/index.php"
}


/* value = "http://${azurerm_public_ip.na.fqdn}/index.php */
