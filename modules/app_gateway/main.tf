resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku {
    name     = var.app_gateway_sku
    tier     = var.app_gateway_sku
    capacity = var.app_gateway_capacity
  }
  gateway_ip_configuration {
    name      = "${var.app_gateway_name}-ipconfig"
    subnet_id = var.subnet_id
  }
  frontend_port {
    name = "${var.app_gateway_name}-frontendport"
    port = var.frontend_port
  }
  frontend_ip_configuration {
    name                 = "${var.app_gateway_name}-frontendip"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }
  backend_address_pool {
    name = "${var.app_gateway_name}-backendpool"
  }
  backend_http_settings {
    name                  = "${var.app_gateway_name}-backendhttpsettings"
    cookie_based_affinity = "Disabled"
    port                  = var.backend_port
    protocol              = "Https"
  }
  http_listener {
    name                           = "${var.app_gateway_name}-httplistener"
    frontend_ip_configuration_name = "${var.app_gateway_name}-frontendip"
    frontend_port_name             = "${var.app_gateway_name}-frontendport"
    protocol                       = "Https"
  }
  request_routing_rule {
    name                       = "${var.app_gateway_name}-routingrule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_gateway_name}-httplistener"
    backend_address_pool_name  = "${var.app_gateway_name}-backendpool"
    backend_http_settings_name = "${var.app_gateway_name}-backendhttpsettings"
    priority                   = 100
  }
  waf_configuration {
    enabled          = var.waf_enabled
    firewall_mode    = var.waf_mode
    rule_set_type    = var.waf_rule_set_type
    rule_set_version = var.waf_rule_set_version
  }
}
