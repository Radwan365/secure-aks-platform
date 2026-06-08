output "aks_cluster_id" {
  description = "The ID of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.id
}
output "aks_cluster_name" {
  description = "The name of the AKS cluster"
  value       = azurerm_kubernetes_cluster.aks.name
}
output "principal_id" {
  description = "The principal ID of the AKS cluster's system-assigned identity"
  value       = azurerm_kubernetes_cluster.aks.identity[0].principal_id
}
