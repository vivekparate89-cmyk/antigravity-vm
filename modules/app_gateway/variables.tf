variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the Application Gateway will be created."
}

variable "app_gw_name" {
  type        = string
  description = "The name of the Application Gateway."
  default     = "agw-frontend"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the Application Gateway subnet."
}

variable "sku_name" {
  type        = string
  description = "The SKU name of the Application Gateway (Standard_v2 or WAF_v2)."
  default     = "Standard_v2"
}

variable "sku_tier" {
  type        = string
  description = "The SKU tier of the Application Gateway (Standard_v2 or WAF_v2)."
  default     = "Standard_v2"
}

variable "sku_capacity" {
  type        = number
  description = "The capacity (instance count) of the Application Gateway."
  default     = 2
}

variable "frontend_port" {
  type        = number
  description = "The frontend port for HTTP listener."
  default     = 80
}

variable "backend_port" {
  type        = number
  description = "The port used by the backend HTTP settings."
  default     = 80
}

variable "backend_ip_addresses" {
  type        = list(string)
  description = "Optional list of backend IP addresses (e.g., Frontend VM private IPs) to include directly in the pool."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
