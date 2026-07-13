resource "azurerm_log_analytics_workspace" "this" {
  name                = var.log_analytics_workspace_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku
  retention_in_days   = var.retention_in_days
}

resource "azurerm_monitor_metric_alert" "cpu_alert" {
  name                = var.metric_alert_name
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = "CPU usage alert"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.ContainerService/managedClusters"
    metric_name      = "node_cpu_usage_percentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.cpu_threshold
  }
}

resource "azurerm_monitor_metric_alert" "memory_alert" {
  name                = "${var.metric_alert_name}-memory"
  resource_group_name = var.resource_group_name
  scopes              = var.scopes
  description         = "Memory usage alert"
  severity            = 2
  frequency           = "PT1M"
  window_size         = "PT5M"

  criteria {
    metric_namespace = "Microsoft.ContainerService/managedClusters"
    metric_name      = "node_memory_working_set_percentage"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.memory_threshold
  }
}


