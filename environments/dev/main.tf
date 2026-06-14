data "azurerm_client_config" "current" {}

module "vnet" {
  source = "../../modules/vnet"

  resource_group_name              = var.resource_group_name
  location                         = var.location
  vnet_name                        = var.vnet_name
  address_space                    = var.address_space
  appgateway_subnet_address_prefix = var.appgateway_subnet_address_prefix
  aks_subnet_address_prefix        = var.aks_subnet_address_prefix
}

module "acr" {
  source = "../../modules/acr"

  resource_group_name = var.resource_group_name
  location            = var.location
  acr_name            = var.acr_name
  acr_sku             = var.acr_sku
}

module "key_vault" {
  source = "../../modules/key_vault"

  resource_group_name = var.resource_group_name
  location            = var.location
  key_vault_name      = var.key_vault_name
  sku_name            = var.sku_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  object_id           = module.aks.principal_id
}

module "aks" {
  source = "../../modules/aks"

  resource_group_name = var.resource_group_name
  location            = var.location
  aks_cluster_name    = var.aks_cluster_name
  dns_prefix          = var.dns_prefix
  node_count          = var.aks.node_count
  node_vm_size        = var.aks.node_vm_size
}

module "sql" {
  source = "../../modules/sql"

  resource_group_name     = var.resource_group_name
  location                = var.location
  sql_server_name         = var.sql_server_name
  sql_version             = var.sql_version
  sql_administrator_login = var.sql_administrator_login
  principal_id            = module.aks.principal_id
}

module "app_gateway" {
  source = "../../modules/app_gateway"

  resource_group_name         = var.resource_group_name
  location                    = var.location
  app_gateway_name            = var.app_gateway_name
  app_gateway_sku             = var.app_gateway_sku
  subnet_id                   = module.vnet.appgateway_subnet_id
  public_ip_name              = var.public_ip_name
  public_ip_sku               = var.public_ip_sku
  public_ip_allocation_method = var.public_ip_allocation_method
  app_gateway_capacity        = var.app_gateway_capacity
  frontend_port               = var.frontend_port
  backend_port                = var.backend_port
  waf_enabled                 = var.waf_enabled
  waf_mode                    = var.waf_mode
  waf_rule_set_version        = var.waf_rule_set_version
  waf_rule_set_type           = var.waf_rule_set_type
}

module "monitoring" {
  source = "../../modules/monitoring"

  resource_group_name          = var.resource_group_name
  location                     = var.location
  log_analytics_workspace_name = var.log_analytics_workspace_name
  sku                          = var.log_analytics_sku
  scopes                       = [module.aks.aks_cluster_id]
  retention_in_days            = var.retention_in_days
  metric_alert_name            = var.metric_alert_name
  cpu_threshold                = var.cpu_threshold
  memory_threshold             = var.memory_threshold
}



