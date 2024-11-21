variable "server_name" {
  description = "The name of the PostgreSQL server"
  type        = string
}

variable "location" {
  description = "Azure region where the server will be deployed"
  type        = string
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "Administrator username for the PostgreSQL server"
  type        = string
}

variable "admin_password" {
  description = "Administrator password for the PostgreSQL server"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the database"
  type        = string
  default     = "mydatabase"
}

variable "database_collation" {
  description = "Collation for the database"
  type        = string
  default     = "en_US.utf8"
}

variable "entra_administrator_tenant_id" {
  type = string
  nullable = false
  description = "ID of the tenant in which the Microsoft Entra entity is located"
}

variable "entra_administrator_object_id" {
  type = string
  nullable = false
  description = "Object ID of the Microsoft Entra entity that will be used as a database administrator"
}

variable "entra_administrator_principal_type" {
  type = string
  nullable = false
  description = "Microsoft Entra entity type"
}

variable "entra_administrator_principal_name" {
  type = string
  nullable = false
  description = "Microsoft Entra entity name"
}