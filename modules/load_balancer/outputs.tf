output "lb_id" {
  description = "The ID of the Load Balancer."
  value       = azurerm_lb.lb.id
}

output "lb_name" {
  description = "The name of the Load Balancer."
  value       = azurerm_lb.lb.name
}

output "lb_private_ip_address" {
  description = "The private IP address of the Load Balancer frontend."
  value       = azurerm_lb.lb.private_ip_address
}

output "backend_address_pool_id" {
  description = "The ID of the Load Balancer Backend Address Pool."
  value       = azurerm_lb_backend_address_pool.pool.id
}
