variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Location of the resource group"
}
variable "aks_cluster_name" {
  type        = string
  description = "Name of the AKS cluster"
}
variable "node_count" {
  type        = number
  description = "Number of nodes in the node pool"
}
variable "node_vm_size" {
  type        = string
  description = "Size of the VMs in the node pool"
}
variable "dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
}
