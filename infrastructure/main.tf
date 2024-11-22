data "azurerm_subscription" "current" {
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

# Entra disabled due to authorization problem
/*
data "azuread_user" "user" {
  user_principal_name = var.email_address
}
*/

data "github_user" "user" {
  username = var.github_handle
}

locals {
  app_name       = "ccproject-${var.github_handle}"
}

module "resource_group" {
  source                  = "./modules/ressource_group"
  resource_group_name     = var.resource_group_name
  resource_group_location = var.resource_group_location
}

module "app_service" {
  source                = "./modules/app_service"
  app_service_plan_name = var.app_service_plan_name
  app_service_name      = var.app_service_name
  resource_group_name   = module.resource_group.resource_group_name
  location              = module.resource_group.resource_group_location
  pricing_plan          = var.app_service_pricing_plan

  docker_image        = "fhuitelec/examples-api:2.1.0"
  docker_registry_url = "https://ghcr.io"

  app_settings = {
    DATABASE_HOST     = local.database_connection.host
    DATABASE_PORT     = local.database_connection.port
    DATABASE_NAME     = local.database.name
    DATABASE_USER     = local.database.username
    DATABASE_PASSWORD = local.database.password

    STORAGE_ACCOUNT_URL = local.storage_url

    #NEW_RELIC_LICENSE_KEY = var.new_relic_licence_key
    #NEW_RELIC_APP_NAME    = local.app_name
  }
}

module "database" {
  source              = "./modules/database"
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name

  # Entra disabled due to authorization problem
  /*
  entra_administrator_tenant_id      = data.azurerm_subscription.current.tenant_id
  entra_administrator_object_id      = data.azuread_user.user.object_id
  entra_administrator_principal_type = "User"
  entra_administrator_principal_name = data.azuread_user.user.user_principal_name
  */

  server_name         = var.db_server_name
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
  database_name       = var.db_name
}

locals {
  database_connection = {
    host = try(module.database[0].server_address, null)
    port = try(module.database[0].port, null)
  }
}


module "storage" {
  source                 = "./modules/storage"
  storage_account_name = local.storage.name
  resource_group_name    = module.resource_group.resource_group_name
  location               = module.resource_group.resource_group_location
  container_name         = var.storage_container_name

  service_principal_id = var.enable_storage_read_for_api ? module.app_service[0].principal_id : null
  user_principal_id    = null
  
  # Entra disabled due to authorization problem
  #user_principal_id    = var.enable_storage_read_for_user ? data.azuread_user.user.object_id : null
}

locals {
  storage_url = try(module.storage[0].url, null)
}