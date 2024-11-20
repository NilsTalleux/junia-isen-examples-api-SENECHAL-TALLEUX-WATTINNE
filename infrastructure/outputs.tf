output "resource_group_name" {
  description = "The name of the resource group"
  value       = module.resource_group.resource_group_name
}

output "resource_group_location" {
  description = "The location of the resource group"
  value       = module.resource_group.resource_group_location
}

output "resource_group_id" {
  description = "The ID of the resource group"
  value       = module.resource_group.resource_group_id
}

output "app_service_url" {
  description = "The default hostname of the App Service"
  value       = module.app_service.app_service_url
}