#We declare the variables

variable "storage_account_name" {
  description = "Name of the Storage Account (must be globally unique)."
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group."
  type        = string
}

variable "location" {
  description = "Location for the Storage Account."
  type        = string
}

variable "container_name" {
  description = "Name of the Blob Container."
  type        = string
  default     = "default-container"
}

variable "user_principal_id" {
  type        = string
  default     = null
  description = "Principal ID of the user to assign the blob storage reader role to"
}

variable "service_principal_id" {
  type        = string
  default     = null
  description = "Principal ID of the app service to assign the blob storage reader role to"
}