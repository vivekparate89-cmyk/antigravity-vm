output "bastion_id" {
  description = "The ID of the Azure Bastion host."
  value       = azurerm_bastion_host.bastion.id
}

output "bastion_name" {
  description = "The name of the Azure Bastion host."
  value       = azurerm_bastion_host.bastion.name
}

output "bastion_public_ip" {
  description = "The public IP address of the Azure Bastion host."
  value       = azurerm_public_ip.pip.ip_address
}
