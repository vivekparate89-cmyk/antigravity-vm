output "vm_id" {
  description = "The ID of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm.id
}

output "vm_name" {
  description = "The name of the virtual machine."
  value       = azurerm_linux_virtual_machine.vm.name
}

output "network_interface_id" {
  description = "The ID of the network interface attached to the VM."
  value       = azurerm_network_interface.nic.id
}

output "network_interface_name" {
  description = "The name of the network interface attached to the VM."
  value       = azurerm_network_interface.nic.name
}

output "private_ip_address" {
  description = "The private IP address of the virtual machine."
  value       = azurerm_network_interface.nic.private_ip_address
}
