resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "blob_container" {
  name                  = var.container_name
  storage_account_id    = azurerm_storage_account.storage_account.id
  container_access_type = "private"
}

resource "azurerm_role_assignment" "service_binding" {
  count                = var.service_principal_id != null ? 1 : 0
  scope                = azurerm_storage_container.blob_container.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.service_principal_id
}

resource "azurerm_role_assignment" "user_binding" {
  count                = var.user_principal_id != null ? 1 : 0
  scope                = azurerm_storage_container.blob_container.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = var.user_principal_id
}