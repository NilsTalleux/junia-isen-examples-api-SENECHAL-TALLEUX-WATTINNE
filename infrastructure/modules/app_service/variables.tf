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

variable "docker_image" {
  type = string
  nullable = false
}

variable "docker_registry_url" {
  type = string
  default = "https://index.docker.io"
}

variable "app_settings" {
  description = "App service settings (list of environment variables)"
  default = {}
  type = map(string)
}