output "storage_account_name" {
  description = "The name of the storage account."
  value       = azurerm_storage_account.storage_account.name
}

output "storage_account_primary_key" {
  description = "The primary access key for the storage account."
  value       = azurerm_storage_account.storage_account.primary_access_key
}

output "blob_container_url" {
  description = "The URL of the blob container."
  value       = azurerm_storage_container.blob_container.id
}