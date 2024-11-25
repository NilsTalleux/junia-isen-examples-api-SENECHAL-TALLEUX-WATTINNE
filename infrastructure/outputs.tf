# We declare what will be exposed for our use

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
  value       = module.app_service.url
}

output "database" {
  value = length(module.database) == 0 ? null : {
    host     = local.database_connection.host
    port     = local.database_connection.port
    database = local.database.name
    username = local.database.username
    password = local.database.password
    ssl      = "enabled"
  }
  sensitive   = true
  description = "Database connection information"
}

output "api" {
  value = length(module.app_service) == 0 ? null : {
    url = module.app_service.url
  }
  description = "URL to access the HTTP API"
}

output "storage" {
  value = length(module.storage) == 0 ? null : {
    url = local.storage_url
  }
  description = "URL to access the storage account"
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = module.vnet.subnet_ids
}