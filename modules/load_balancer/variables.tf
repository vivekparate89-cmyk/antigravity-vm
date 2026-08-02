variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the load balancer will be created."
}

variable "lb_name" {
  type        = string
  description = "The name of the internal load balancer."
  default     = "lbi-backend"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the internal load balancer frontend IP will reside."
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method for the internal load balancer frontend IP."
  default     = "Dynamic"
}

variable "private_ip_address" {
  type        = string
  description = "The static private IP address for the internal load balancer."
  default     = null
}

variable "backend_pool_name" {
  type        = string
  description = "The name of the load balancer backend address pool."
  default     = "be-pool-backend"
}

variable "probe_name" {
  type        = string
  description = "The name of the health probe."
  default     = "hp-backend"
}

variable "probe_port" {
  type        = number
  description = "The port for the health probe."
  default     = 8080
}

variable "probe_protocol" {
  type        = string
  description = "The protocol for the health probe (Tcp, Http, or Https)."
  default     = "Tcp"
}

variable "probe_request_path" {
  type        = string
  description = "The URI path for HTTP/HTTPS probes."
  default     = null
}

variable "lb_rules" {
  type = map(object({
    protocol      = string
    frontend_port = number
    backend_port  = number
  }))
  description = "A mapping of load balancing rules to create."
  default = {
    "http-rule" = {
      protocol      = "Tcp"
      frontend_port = 80
      backend_port  = 8080
    }
  }
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
