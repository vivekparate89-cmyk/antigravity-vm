variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where Azure Bastion will be created."
}

variable "bastion_name" {
  type        = string
  description = "The name of the Azure Bastion host."
  default     = "bst-backend"
}

variable "subnet_id" {
  type        = string
  description = "The ID of the AzureBastionSubnet."
}

variable "sku" {
  type        = string
  description = "The SKU of Azure Bastion (Basic or Standard)."
  default     = "Standard"
}

variable "copy_paste_enabled" {
  type        = bool
  description = "Whether copy/paste feature is enabled."
  default     = true
}

variable "file_copy_enabled" {
  type        = bool
  description = "Whether file copy feature is enabled (requires Standard SKU)."
  default     = true
}

variable "tunneling_enabled" {
  type        = bool
  description = "Whether native client tunneling is enabled (requires Standard SKU)."
  default     = true
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
