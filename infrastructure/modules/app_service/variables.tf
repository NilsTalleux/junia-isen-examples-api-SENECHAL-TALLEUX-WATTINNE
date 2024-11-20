variable "app_service_plan_name" {
  description = "Name of the App Service Plan"
  type        = string
}

variable "app_service_name" {
  description = "Name of the App Service"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resource group"
  type        = string
}

variable "pricing_plan" {
  description = "Pricing plan for the App Service Plan (e.g., F1, B1)"
  type        = string
  default     = "F1"
}