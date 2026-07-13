resource "azurerm_public_ip" "public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
  sku                 = var.public_ip_sku
}

resource "azurerm_web_application_firewall_policy" "waf" {
  name                = "${var.app_gateway_name}-waf"
  resource_group_name = var.resource_group_name
  location            = var.location

  managed_rules {
    managed_rule_set {
      type    = var.waf_rule_set_type
      version = var.waf_rule_set_version
    }
  }

  policy_settings {
    enabled                     = var.waf_enabled
    mode                        = var.waf_mode
    request_body_check          = true
    file_upload_limit_in_mb     = 100
    max_request_body_size_in_kb = 128
  }
}

resource "azurerm_application_gateway" "app_gateway" {
  name                = var.app_gateway_name
  location            = var.location
  resource_group_name = var.resource_group_name
  firewall_policy_id  = azurerm_web_application_firewall_policy.waf.id

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
    protocol              = "Http"
  }

  http_listener {
    name                           = "${var.app_gateway_name}-httplistener"
    frontend_ip_configuration_name = "${var.app_gateway_name}-frontendip"
    frontend_port_name             = "${var.app_gateway_name}-frontendport"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${var.app_gateway_name}-routingrule"
    rule_type                  = "Basic"
    http_listener_name         = "${var.app_gateway_name}-httplistener"
    backend_address_pool_name  = "${var.app_gateway_name}-backendpool"
    backend_http_settings_name = "${var.app_gateway_name}-backendhttpsettings"
    priority                   = 100
  }
}
