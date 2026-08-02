variable "environment" {
  type        = string
  description = "The environment name (e.g., dev, prod, staging)."
  default     = "prod"
}

variable "location" {
  type        = string
  description = "The Azure region where all resources will be deployed."
  default     = "eastus"
}

variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
  default     = "rg-3tier-prod"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "The address space for the Virtual Network."
  default     = ["10.0.0.0/16"]
}

variable "frontend_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Frontend subnet."
  default     = ["10.0.1.0/24"]
}

variable "backend_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Backend subnet."
  default     = ["10.0.2.0/24"]
}

variable "db_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Database subnet."
  default     = ["10.0.3.0/24"]
}

variable "app_gw_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Application Gateway subnet."
  default     = ["10.0.10.0/24"]
}

variable "bastion_subnet_prefix" {
  type        = list(string)
  description = "The address prefix for the Azure Bastion subnet."
  default     = ["10.0.20.0/26"]
}

variable "admin_username" {
  type        = string
  description = "The admin username for all VMs."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The admin password for VMs. Leave null if using SSH keys."
  default     = null
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key for VM authentication."
  default     = null
}

variable "frontend_vm_size" {
  type        = string
  description = "The VM size for the Frontend tier."
  default     = "Standard_B2s"
}

variable "backend_vm_size" {
  type        = string
  description = "The VM size for the Backend tier."
  default     = "Standard_B2s"
}

variable "db_vm_size" {
  type        = string
  description = "The VM size for the Database tier."
  default     = "Standard_B2s"
}

variable "db_port" {
  type        = number
  description = "The database port to allow traffic from backend (e.g., 5432 for Postgres, 3306 for MySQL)."
  default     = 5432
}

variable "tags" {
  type        = map(string)
  description = "Common tags to apply to all resources."
  default = {
    Environment = "Production"
    Project     = "3-Tier-App"
    ManagedBy   = "Terraform"
  }
}
