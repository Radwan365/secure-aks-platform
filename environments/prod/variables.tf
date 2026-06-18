variable "app_gateway_sku" {
  description = "The SKU for the Application Gateway."
  type        = string
}

variable "app_gateway_capacity" {
  description = "The capacity of the Application Gateway."
  type        = number
}

variable "public_ip_name" {
  description = "The name of the public IP address for the Application Gateway."
  type        = string
}

variable "public_ip_sku" {
  description = "The SKU for the public IP address."
  type        = string
}

variable "public_ip_allocation_method" {
  description = "The allocation method for the public IP address (Static or Dynamic)."
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

variable "log_analytics_sku" {
  description = "The SKU for the Log Analytics workspace."
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
