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
  default     = "LinuxWebApppcntbw"
}

variable "app_service_pricing_plan" {
  description = "Pricing plan for the App Service Plan (e.g., F1 for Free Tier)"
  type        = string
  default     = "F1" # Basic free plan
}