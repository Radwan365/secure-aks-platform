output "vnet_id" {
  description = "The ID of the virtual network"
  value       = azurerm_virtual_network.vnet.id
}
output "appgateway_subnet_id" {
  description = "The ID of the subnet for the Application Gateway"
  value       = azurerm_subnet.appgateway_subnet.id
}
output "aks_subnet_id" {
  description = "The ID of the subnet for the AKS cluster"
  value       = azurerm_subnet.aks_subnet.id
}
