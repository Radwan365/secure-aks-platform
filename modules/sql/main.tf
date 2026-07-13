resource "random_password" "sql_admin_password" {
  length  = 24
  special = true
}

resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  version                      = var.sql_version
  administrator_login          = var.sql_administrator_login
  administrator_login_password = random_password.sql_admin_password.result
  azuread_administrator {
    login_username = "aks-managed-identity"
    object_id      = var.principal_id
  }

  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_mssql_server_transparent_data_encryption" "sql_tde" {
  server_id = azurerm_mssql_server.sql_server.id
}

