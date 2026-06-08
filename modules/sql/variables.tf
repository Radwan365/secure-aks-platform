variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "sql_server_name" {
  type        = string
  description = "Name of the SQL Server"
}

variable "sql_version" {
  type        = string
  description = "Version of the SQL Server (e.g., '12.0' for SQL Server 2014, '14.0' for SQL Server 2017)"
  default     = "12.0"
}

variable "sql_administrator_login" {
  type        = string
  description = "Administrator login name for the SQL Server"
}

variable "principal_id" {
  type        = string
  description = "Object ID of the user or service principal to grant access to the SQL Server"
}
