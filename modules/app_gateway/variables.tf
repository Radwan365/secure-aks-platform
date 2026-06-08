variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}
variable "location" {
  type        = string
  description = "Location of the resource group"
}
variable "app_gateway_name" {
  type        = string
  description = "Name of the Application Gateway"
}
variable "app_gateway_sku" {
  type        = string
  description = "SKU of the Application Gateway (e.g., Standard_v2, WAF_v2)"
}
variable "subnet_id" {
  type        = string
  description = "ID of the subnet where the Application Gateway will be deployed"
}
variable "public_ip_name" {
  type        = string
  description = "Name of the public IP address to be associated with the Application Gateway"
}

variable "public_ip_sku" {
  type        = string
  description = "SKU of the public IP address (e.g., Standard, Basic)"
}

variable "public_ip_allocation_method" {
  type        = string
  description = "Allocation method for the public IP address (e.g., Static, Dynamic)"
}

variable "app_gateway_capacity" {
  type        = number
  description = "Capacity of the Application Gateway (number of instances)"
}

variable "frontend_port" {
  type        = number
  description = "Frontend port number for the Application Gateway"
}

variable "backend_port" {
  type        = number
  description = "Backend port number for the Application Gateway"
}

variable "waf_enabled" {
  type        = bool
  description = "Whether to enable Web Application Firewall (WAF) for the Application Gateway"
}

variable "waf_mode" {
  type        = string
  description = "WAF mode (e.g., Prevention, Detection)"
  default     = "Prevention"
}

variable "waf_rule_set_type" {
  type        = string
  description = "WAF rule set type (e.g., OWASP)"
  default     = "OWASP"
}

variable "waf_rule_set_version" {
  type        = string
  description = "WAF rule set version (e.g., 3.2)"
  default     = "3.2"
}
