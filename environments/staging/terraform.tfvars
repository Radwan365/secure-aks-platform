# === Resource Group ===
resource_group_name = "rg-secure-aks-staging"
location            = "uksouth"

# === VNet ===
vnet_name                        = "vnet-secure-aks-staging"
address_space                    = ["10.1.0.0/16"]
appgateway_subnet_address_prefix = "10.1.1.0/24"
aks_subnet_address_prefix        = "10.1.2.0/24"

# === AKS ===
aks_cluster_name = "aks-secure-aks-staging"
dns_prefix       = "secureaksstaging"
aks_node_count   = 2
aks_node_vm_size = "Standard_DS2_v2"

# === ACR ===
acr_name = "acrsecureaksstaging"
acr_sku  = "Standard"

# === Key Vault ===
key_vault_name = "kv-secure-aks-staging"
sku_name       = "standard"

# === SQL ===
sql_server_name         = "sql-secure-aks-staging"
sql_version             = "12.0"
sql_administrator_login = "sqladmin"

# === App Gateway ===
app_gateway_name            = "appgw-secure-aks-staging"
app_gateway_sku             = "WAF_v2"
app_gateway_capacity        = 2
public_ip_name              = "pip-appgw-secure-aks-staging"
public_ip_sku               = "Standard"
public_ip_allocation_method = "Static"
frontend_port               = 443
backend_port                = 443
waf_enabled                 = true
waf_mode                    = "Prevention"
waf_rule_set_type           = "OWASP"
waf_rule_set_version        = "3.2"

# === Monitoring ===
log_analytics_workspace_name = "log-secure-aks-staging"
log_analytics_sku            = "PerGB2018"
metric_alert_name            = "alert-secure-aks-staging"
cpu_threshold                = 80
memory_threshold             = 80
retention_in_days            = 60
