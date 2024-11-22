resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name
  administrator_login = var.admin_username
  administrator_password = var.admin_password

  auto_grow_enabled             = false             # Disables automatic storage scaling
  backup_retention_days         = 7
  geo_redundant_backup_enabled  = false
  sku_name                      = "B_Standard_B1ms" # Performance level (basic here)
  storage_tier                  = "P4"
  storage_mb                    = "32768"           # Size allocated for storage in megabytes (32 GB here)
  version                       = "16" 
  public_network_access_enabled = false             # Firewall

  authentication {
    active_directory_auth_enabled = true
    password_auth_enabled         = true
    tenant_id                     = var.entra_administrator_tenant_id
  }
}

resource "azurerm_postgresql_flexible_server_active_directory_administrator" "administrator" {
  tenant_id           = var.entra_administrator_tenant_id
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_flexible_server.postgresql_server.name
  principal_type      = var.entra_administrator_principal_type
  object_id           = var.entra_administrator_object_id
  principal_name      = var.entra_administrator_principal_name
}

resource "azurerm_postgresql_flexible_server_database" "database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  collation = var.database_collation                # Language used in the DB (en_US)
  charset   = "UTF8"
}
