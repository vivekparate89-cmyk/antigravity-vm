resource "azurerm_public_ip" "pip" {
  name                = "pip-${var.app_gw_name}"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku                 = "Standard"
  tags                = var.tags
}

locals {
  backend_address_pool_name      = "be-pool-${var.app_gw_name}"
  frontend_port_name             = "fe-port-${var.app_gw_name}"
  frontend_ip_configuration_name = "fe-ip-${var.app_gw_name}"
  http_setting_name              = "be-htst-${var.app_gw_name}"
  listener_name                  = "httplstn-${var.app_gw_name}"
  request_routing_rule_name      = "rqrt-${var.app_gw_name}"
  gateway_ip_cfg_name            = "gw-ip-cfg-${var.app_gw_name}"
}

resource "azurerm_application_gateway" "agw" {
  name                = var.app_gw_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags

  sku {
    name     = var.sku_name
    tier     = var.sku_tier
    capacity = var.sku_capacity
  }

  gateway_ip_configuration {
    name      = local.gateway_ip_cfg_name
    subnet_id = var.subnet_id
  }

  frontend_port {
    name = local.frontend_port_name
    port = var.frontend_port
  }

  frontend_ip_configuration {
    name                 = local.frontend_ip_configuration_name
    public_ip_address_id = azurerm_public_ip.pip.id
  }

  backend_address_pool {
    name         = local.backend_address_pool_name
    ip_addresses = var.backend_ip_addresses
  }

  backend_http_settings {
    name                  = local.http_setting_name
    cookie_based_affinity = "Disabled"
    port                  = var.backend_port
    protocol              = "Http"
    request_timeout       = 60
  }

  http_listener {
    name                           = local.listener_name
    frontend_ip_configuration_name = local.frontend_ip_configuration_name
    frontend_port_name             = local.frontend_port_name
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = local.request_routing_rule_name
    rule_type                  = "Basic"
    http_listener_name         = local.listener_name
    backend_address_pool_name  = local.backend_address_pool_name
    backend_http_settings_name = local.http_setting_name
    priority                   = 100
  }
}
