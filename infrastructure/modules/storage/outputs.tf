output "blob_container_url" {
  description = "The URL of the blob container."
  value       = azurerm_storage_container.blob_container.id
}

output "url" {
  value = azurerm_storage_account.storage_account.primary_blob_endpoint
  description = "Hostname to connect to the storage account"
}