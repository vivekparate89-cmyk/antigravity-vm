output "resource_group_name" {
  description = "The name of the deployed resource group."
  value       = module.resource_group.resource_group_name
}

output "vnet_name" {
  description = "The name of the Virtual Network."
  value       = module.networking.vnet_name
}

output "app_gateway_public_ip" {
  description = "The Public IP address of the Application Gateway."
  value       = module.app_gateway.public_ip_address
}

output "bastion_public_ip" {
  description = "The Public IP address of the Azure Bastion host."
  value       = module.bastion.bastion_public_ip
}

output "frontend_vm_private_ip" {
  description = "The private IP address of the Frontend VM."
  value       = module.frontend_vm.private_ip_address
}

output "backend_vm_private_ip" {
  description = "The private IP address of the Backend VM."
  value       = module.backend_vm.private_ip_address
}

output "db_vm_private_ip" {
  description = "The private IP address of the Database VM."
  value       = module.db_vm.private_ip_address
}

output "internal_lb_private_ip" {
  description = "The private IP address of the Internal Load Balancer frontend."
  value       = module.internal_lb.lb_private_ip_address
}
