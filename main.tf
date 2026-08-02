module "resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "${var.resource_group_name}-${var.environment}"
  location            = var.location
  tags                = var.tags
}

module "networking" {
  source                 = "./modules/networking"
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.location
  vnet_name              = "vnet-3tier-${var.environment}"
  vnet_address_space     = var.vnet_address_space
  frontend_subnet_name   = "snet-frontend-${var.environment}"
  frontend_subnet_prefix = var.frontend_subnet_prefix
  backend_subnet_name    = "snet-backend-${var.environment}"
  backend_subnet_prefix  = var.backend_subnet_prefix
  db_subnet_name         = "snet-db-${var.environment}"
  db_subnet_prefix       = var.db_subnet_prefix
  app_gw_subnet_name     = "ApplicationGatewaySubnet"
  app_gw_subnet_prefix   = var.app_gw_subnet_prefix
  bastion_subnet_name    = "AzureBastionSubnet"
  bastion_subnet_prefix  = var.bastion_subnet_prefix
  db_port                = var.db_port
  tags                   = var.tags
}

module "bastion" {
  source              = "./modules/bastion"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  bastion_name        = "bst-${var.environment}"
  subnet_id           = module.networking.bastion_subnet_id
  tags                = var.tags
}

module "app_gateway" {
  source              = "./modules/app_gateway"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  app_gw_name         = "agw-frontend-${var.environment}"
  subnet_id           = module.networking.app_gw_subnet_id
  frontend_port       = 80
  backend_port        = 80
  tags                = var.tags
}

module "internal_lb" {
  source              = "./modules/load_balancer"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  lb_name             = "lbi-backend-${var.environment}"
  subnet_id           = module.networking.backend_subnet_id
  probe_port          = 8080
  lb_rules = {
    "http-backend" = {
      protocol      = "Tcp"
      frontend_port = 80
      backend_port  = 8080
    }
  }
  tags = var.tags
}

module "frontend_vm" {
  source                          = "./modules/compute"
  resource_group_name             = module.resource_group.resource_group_name
  location                        = module.resource_group.location
  vm_name                         = "vm-frontend-${var.environment}"
  subnet_id                       = module.networking.frontend_subnet_id
  vm_size                         = var.frontend_vm_size
  admin_username                  = var.admin_username
  admin_password                  = var.admin_password
  ssh_public_key                  = var.ssh_public_key
  app_gw_backend_address_pool_ids = [module.app_gateway.backend_address_pool_id]
  tags                            = var.tags
}

module "backend_vm" {
  source                      = "./modules/compute"
  resource_group_name         = module.resource_group.resource_group_name
  location                    = module.resource_group.location
  vm_name                     = "vm-backend-${var.environment}"
  subnet_id                   = module.networking.backend_subnet_id
  vm_size                     = var.backend_vm_size
  admin_username              = var.admin_username
  admin_password              = var.admin_password
  ssh_public_key              = var.ssh_public_key
  lb_backend_address_pool_ids = [module.internal_lb.backend_address_pool_id]
  tags                        = var.tags
}

module "db_vm" {
  source              = "./modules/compute"
  resource_group_name = module.resource_group.resource_group_name
  location            = module.resource_group.location
  vm_name             = "vm-db-${var.environment}"
  subnet_id           = module.networking.db_subnet_id
  vm_size             = var.db_vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  ssh_public_key      = var.ssh_public_key
  tags                = var.tags
}
