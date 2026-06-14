variable "resource_group_name" {
  description = "The name of the resource group in which the monitoring resources will be created."
  type        = string
}

variable "location" {
  description = "The location in which the monitoring resources will be created."
  type        = string
}

variable "log_analytics_workspace_name" {
  description = "The name of the Log Analytics workspace to be created."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics workspace (e.g., 'PerGB2018', 'Free', 'Standard')."
  type        = string
  default     = "PerGB2018"
}

variable "scopes" {
  description = "A list of resource IDs to which the Log Analytics workspace will be linked."
  type        = list(string)
  default     = []
}

variable "retention_in_days" {
  description = "The number of days to retain data in the Log Analytics workspace."
  type        = number
  default     = 30
}

variable "metric_alert_name" {
  description = "Name of the metric alert"
  type        = string
}

variable "cpu_threshold" {
  description = "CPU percentage threshold for triggering the alert"
  type        = number
  default     = 80
}

variable "memory_threshold" {
  description = "Memory percentage threshold for triggering the alert"
  type        = number
  default     = 80
}

