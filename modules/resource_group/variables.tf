variable "resource_group_name" {
  type        = string
  description = "The name of the Azure Resource Group."
}

variable "location" {
  type        = string
  description = "The Azure region where resources will be created."
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resource group."
  default     = {}
}
