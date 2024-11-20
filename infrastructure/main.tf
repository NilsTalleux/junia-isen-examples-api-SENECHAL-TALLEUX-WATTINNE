provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
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
}

module "postgresql" {
  source              = "./modules/database"
  server_name         = var.db_server_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  admin_username      = var.db_admin_username
  admin_password      = var.db_admin_password
  database_name       = var.db_name
}
