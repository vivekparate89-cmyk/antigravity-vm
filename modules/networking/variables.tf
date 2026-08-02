variable "resource_group_name" {
  type        = string
  description = "The name of the resource group in which to create the networking resources."
}

variable "location" {
  type        = string
  description = "The Azure region where networking resources will be created."
}

variable "vnet_name" {
  type        = string
  description = "The name of the Virtual Network."
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "frontend_subnet_name" {
  type        = string
  description = "The name of the Frontend Subnet."
  default     = "snet-frontend"
}

variable "frontend_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Frontend Subnet."
  default     = ["10.0.1.0/24"]
}

variable "backend_subnet_name" {
  type        = string
  description = "The name of the Backend Subnet."
  default     = "snet-backend"
}

variable "backend_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Backend Subnet."
  default     = ["10.0.2.0/24"]
}

variable "db_subnet_name" {
  type        = string
  description = "The name of the Database Subnet."
  default     = "snet-database"
}

variable "db_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Database Subnet."
  default     = ["10.0.3.0/24"]
}

variable "app_gw_subnet_name" {
  type        = string
  description = "The name of the Application Gateway Subnet (Must be ApplicationGatewaySubnet or custom dedicated)."
  default     = "ApplicationGatewaySubnet"
}

variable "app_gw_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Application Gateway Subnet."
  default     = ["10.0.10.0/24"]
}

variable "bastion_subnet_name" {
  type        = string
  description = "The name of the Azure Bastion Subnet (MUST be named AzureBastionSubnet)."
  default     = "AzureBastionSubnet"
}

variable "bastion_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Azure Bastion Subnet (Must be /26 or larger)."
  default     = ["10.0.20.0/26"]
}

variable "db_port" {
  type        = number
  description = "The database port to open from backend to database tier (e.g., 5432 for PostgreSQL, 3306 for MySQL, 1433 for MSSQL)."
  default     = 5432
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
