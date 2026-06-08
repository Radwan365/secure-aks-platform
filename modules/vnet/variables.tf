variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Location of the resource group"
}
variable "vnet_name" {
  type        = string
  description = "Name of the virtual network"
}
variable "address_space" {
  type        = list(string)
  description = "Address space for the virtual network"
}
variable "appgateway_subnet_address_prefix" {
  type        = string
  description = "Address prefix for the subnet of the Application Gateway"
}
variable "aks_subnet_address_prefix" {
  type        = string
  description = "Address prefix for the subnet of the AKS cluster"
}
