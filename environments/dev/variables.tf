variable "resource_group_name" {
  description = "The name of the resource group where the resources will be created."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
}

variable "vnet_name" {
  description = "The name of the virtual network."
  type        = string
}

variable "address_space" {
  description = "The address space for the virtual network."
  type        = list(string)
}

variable "appgateway_subnet_address_prefix" {
  description = "The address prefix for the Application Gateway subnet."
  type        = string
}

variable "aks_subnet_address_prefix" {
  description = "The address prefix for the AKS subnet."
  type        = string
}

variable "aks_cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "aks_node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
}

variable "aks_node_vm_size" {
  description = "The size of the virtual machines for the AKS nodes."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "acr_name" {
  description = "The name of the Azure Container Registry."
  type        = string
}

variable "acr_sku" {
  description = "The SKU of the Azure Container Registry."
  type        = string
}

variable "key_vault_name" {
  description = "The name of the Azure Key Vault."
  type        = string
}

variable "sku_name" {
  description = "The SKU name for the Azure Key Vault."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the Azure SQL Server."
  type        = string
}

variable "sql_version" {
  description = "The version of the Azure SQL Server."
  type        = string
}

variable "sql_administrator_login" {
  description = "The administrator login for the Azure SQL Server."
  type        = string
}

variable "app_gateway_name" {
  description = "The name of the Azure Application Gateway."
  type        = string
}

variable "app_gateway_sku" {
  description = "The SKU of the Azure Application Gateway."
  type        = string
}

variable "app_gateway_capacity" {
  description = "The capacity of the Azure Application Gateway."
  type        = number
}

variable "public_ip_name" {
  description = "The name of the public IP address for the Application Gateway."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address (Static or Dynamic)."
  type        = string
}

variable "public_ip_sku" {
  description = "The SKU of the public IP address (Basic or Standard)."
  type        = string
}

variable "frontend_port" {
  description = "The frontend port for the Application Gateway."
  type        = number
}

variable "backend_port" {
  description = "The backend port for the Application Gateway."
  type        = number
}

variable "waf_enabled" {
  description = "Indicates whether the Web Application Firewall (WAF) is enabled for the Application Gateway."
  type        = bool
}

variable "waf_mode" {
  description = "The mode of the Web Application Firewall (WAF) for the Application Gateway (Prevention or Detection)."
  type        = string
}

variable "waf_rule_set_type" {
  description = "The type of the WAF rule set for the Application Gateway (e.g., OWASP)."
  type        = string
}

variable "waf_rule_set_version" {
  description = "The version of the WAF rule set for the Application Gateway."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace."
  type        = string
}

variable "metric_alert_name" {
  description = "The name of the metric alert."
  type        = string
}

variable "cpu_threshold" {
  description = "The CPU threshold for the metric alert."
  type        = number
}

variable "memory_threshold" {
  description = "The memory threshold for the metric alert."
  type        = number
}

variable "retention_in_days" {
  description = "The retention period in days for the Log Analytics workspace."
  type        = number
}

variable "log_analytics_sku" {
  description = "The SKU for the Log Analytics workspace."
  type        = string
}
