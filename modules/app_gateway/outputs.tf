output "app_gw_id" {
  description = "The ID of the Application Gateway."
  value       = azurerm_application_gateway.agw.id
}

output "app_gw_name" {
  description = "The name of the Application Gateway."
  value       = azurerm_application_gateway.agw.name
}

output "public_ip_address" {
  description = "The public IP address of the Application Gateway."
  value       = azurerm_public_ip.pip.ip_address
}

output "public_ip_id" {
  description = "The ID of the public IP address of the Application Gateway."
  value       = azurerm_public_ip.pip.id
}

output "backend_address_pool_id" {
  description = "The ID of the Application Gateway backend address pool."
  value       = tolist(azurerm_application_gateway.agw.backend_address_pool)[0].id
}
