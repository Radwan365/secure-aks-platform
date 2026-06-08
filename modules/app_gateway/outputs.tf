output "app_gateway_id" {
  value       = azurerm_application_gateway.app_gateway.id
  description = "The ID of the Application Gateway"
}

output "app_gateway_name" {
  value       = azurerm_application_gateway.app_gateway.name
  description = "The name of the Application Gateway"
}

output "public_ip_id" {
  value       = azurerm_public_ip.public_ip.id
  description = "The ID of the public IP address associated with the Application Gateway"
}
