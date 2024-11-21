resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.pricing_plan
}

resource "azurerm_linux_web_app" "app_service" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  app_settings        = var.app_settings

  identity {
    type = "SystemAssigned"
  }

  site_config {
    always_on = false
    application_stack {
      docker_registry_url = var.docker_registry_url
      docker_image_name   = var.docker_image
    }
  }
}
