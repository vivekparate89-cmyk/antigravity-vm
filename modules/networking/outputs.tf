output "vnet_id" {
  description = "The ID of the Virtual Network."
  value       = azurerm_virtual_network.vnet.id
}

output "vnet_name" {
  description = "The name of the Virtual Network."
  value       = azurerm_virtual_network.vnet.name
}

output "frontend_subnet_id" {
  description = "The ID of the Frontend subnet."
  value       = azurerm_subnet.frontend.id
}

output "backend_subnet_id" {
  description = "The ID of the Backend subnet."
  value       = azurerm_subnet.backend.id
}

output "db_subnet_id" {
  description = "The ID of the Database subnet."
  value       = azurerm_subnet.db.id
}

output "app_gw_subnet_id" {
  description = "The ID of the Application Gateway subnet."
  value       = azurerm_subnet.app_gw.id
}

output "bastion_subnet_id" {
  description = "The ID of the Azure Bastion subnet."
  value       = azurerm_subnet.bastion.id
}

output "frontend_nsg_id" {
  description = "The ID of the Frontend NSG."
  value       = azurerm_network_security_group.frontend_nsg.id
}

output "backend_nsg_id" {
  description = "The ID of the Backend NSG."
  value       = azurerm_network_security_group.backend_nsg.id
}

output "db_nsg_id" {
  description = "The ID of the Database NSG."
  value       = azurerm_network_security_group.db_nsg.id
}
