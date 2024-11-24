# We declare the different variables

variable "github_handle" {
  type        = string
  nullable    = false
  description = "Your GitHub username (not your email, your @username)"
}

variable "email_address" {
  type        = string
  nullable    = false
  description = "Your JUNIA email address. Example: firstname.lastname@*.junia.com"
}

variable "subscription_id" {
  description = "Azure subscription ID. Use 'az login' command to get it."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
  default     = "Cloud-Computing-Project"
}

variable "resource_group_location" {
  description = "Resource group location"
  type        = string
  default     = "France Central"
}

variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
  default     = "AppServicePlan"
}

variable "app_service_name" {
  description = "Name of the App Service (MUST BE UNIQUE)"
  type        = string
  default     = "linuxwebapppcntbw"
}

variable "app_service_pricing_plan" {
  description = "Pricing plan for the App Service Plan (e.g., F1 for Free Tier)"
  type        = string
  default     = "F1" # Basic free plan
}

variable "db_server_name" {
  description = "The name of the PostgreSQL server (MUST BE UNIQUE)."
  type        = string
}

variable "db_admin_username" {
  description = "Administrator username for the PostgreSQL server."
  type        = string
}

variable "db_admin_password" {
  description = "Administrator password for the PostgreSQL server."
  type        = string
  sensitive   = true
}

variable "db_name" {
  description = "The name of the PostgreSQL database."
  type        = string
  default     = "mydatabase"
}

variable "storage_account_name" {
  description = "The name of the Storage Account. (MUST BE UNIQUE)"
  type        = string
  default     = "storageaccountccppsntbw"
}

variable "storage_container_name" {
  description = "The name of the Storage Container within the Storage Account."
  type        = string
  default     = "storageccppsntbw"
}

resource "random_password" "database_password" {
  length      = 24
  min_special = 1
  min_numeric = 2
  min_lower   = 2
  min_upper   = 2
}

locals {
  database = {
    server_name = var.db_server_name != null ? var.db_server_name : "playground-computing-${var.github_handle}"
    name        = var.db_name != null ? var.db_name : var.github_handle
    username    = var.db_admin_username != null ? var.db_admin_username : var.github_handle
    password    = var.db_admin_password != null ? var.db_admin_password : random_password.database_password.result
  }

  storage = {
    name = var.storage_account_name != null ? var.storage_account_name : var.github_handle
  }
}

variable "enable_storage_read_for_user" {
  type        = bool
  default     = false
  description = "Whether to enable IAM service blob storage reader role for the user"
}

variable "enable_storage_read_for_api" {
  type        = bool
  default     = false
  description = "Whether to enable IAM blob storage reader role binding for the API service"
}