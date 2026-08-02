variable "resource_group_name" {
  type        = string
  description = "The name of the resource group."
}

variable "location" {
  type        = string
  description = "The Azure region where the VM will be created."
}

variable "vm_name" {
  type        = string
  description = "The name of the virtual machine."
}

variable "subnet_id" {
  type        = string
  description = "The ID of the subnet where the VM network interface will be attached."
}

variable "vm_size" {
  type        = string
  description = "The SKU size of the virtual machine."
  default     = "Standard_B2s"
}

variable "admin_username" {
  type        = string
  description = "The administrator username for the virtual machine."
  default     = "adminuser"
}

variable "admin_password" {
  type        = string
  description = "The administrator password for the virtual machine. If null, ssh_public_key must be provided."
  default     = null
  sensitive   = true
}

variable "ssh_public_key" {
  type        = string
  description = "The SSH public key for the admin user. If null, admin_password must be provided."
  default     = null
}

variable "os_disk_type" {
  type        = string
  description = "The storage account type for the OS disk."
  default     = "StandardSSD_LRS"
}

variable "os_disk_size_gb" {
  type        = number
  description = "The size of the OS disk in GB."
  default     = 30
}

variable "source_image_reference" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  description = "The source image reference for the virtual machine."
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}

variable "custom_data" {
  type        = string
  description = "Base64 encoded cloud-init script or custom data to pass to the virtual machine."
  default     = null
}

variable "enable_boot_diagnostics" {
  type        = bool
  description = "Whether to enable boot diagnostics (with managed storage account)."
  default     = true
}

variable "private_ip_address_allocation" {
  type        = string
  description = "The allocation method for the private IP address (Dynamic or Static)."
  default     = "Dynamic"
}

variable "private_ip_address" {
  type        = string
  description = "The static private IP address (if private_ip_address_allocation is Static)."
  default     = null
}

variable "lb_backend_address_pool_ids" {
  type        = list(string)
  description = "List of Load Balancer backend address pool IDs to associate with this VM's network interface."
  default     = []
}

variable "app_gw_backend_address_pool_ids" {
  type        = list(string)
  description = "List of Application Gateway backend address pool IDs to associate with this VM's network interface."
  default     = []
}

variable "tags" {
  type        = map(string)
  description = "A mapping of tags to assign to the resources."
  default     = {}
}
