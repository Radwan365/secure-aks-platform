# === Resource Group ===
resource_group_name = "rg-secure-aks-prod"
location            = "uksouth"

# === VNet ===
vnet_name                        = "vnet-secure-aks-prod"
address_space                    = ["10.2.0.0/16"]
appgateway_subnet_address_prefix = "10.2.1.0/24"
aks_subnet_address_prefix        = "10.2.2.0/24"

# === AKS ===
aks_cluster_name = "aks-secure-aks-prod"
dns_prefix       = "secureaksprod"
aks_node_count   = 3
aks_node_vm_size = "Standard_B2s"

# === ACR ===
acr_name = "acrsecureaksprod"
acr_sku  = "Premium"

# === Key Vault ===
key_vault_name = "kv-secure-aks-prod"
sku_name       = "standard_DS3_v2"

# === SQL ===
sql_server_name         = "sql-secure-aks-prod"
sql_version             = "12.0"
sql_administrator_login = "sqladmin"

# === App Gateway ===
app_gateway_name            = "appgw-secure-aks-prod"
app_gateway_sku             = "WAF_v2"
app_gateway_capacity        = 3
public_ip_name              = "pip-appgw-secure-aks-prod"
public_ip_sku               = "Standard"
public_ip_allocation_method = "Static"
frontend_port               = 443
backend_port                = 443
waf_enabled                 = true
waf_mode                    = "Prevention"
waf_rule_set_type           = "OWASP"
waf_rule_set_version        = "3.2"

# === Monitoring ===
log_analytics_workspace_name = "log-secure-aks-prod"
log_analytics_sku            = "PerGB2018"
metric_alert_name            = "alert-secure-aks-prod"
cpu_threshold                = 80
memory_threshold             = 80
retention_in_days            = 90
