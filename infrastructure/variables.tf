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