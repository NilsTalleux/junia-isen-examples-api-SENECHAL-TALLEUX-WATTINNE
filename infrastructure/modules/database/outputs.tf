output "postgresql_server_id" {
  description = "The ID of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql_server.id
}

output "db_server_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL server"
  value       = azurerm_postgresql_flexible_server.postgresql_server.fqdn
}

output "db_server_port" {
  description = "The port of the PostgreSQL server. Always 5432 (default)"
  value       = 5432
}

output "database_name" {
  description = "The name of the PostgreSQL database"
  value       = azurerm_postgresql_flexible_server_database.database.name
}