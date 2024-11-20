resource "azurerm_service_plan" "app_service_plan" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  os_type             = "Linux"
  sku_name            = var.pricing_plan
}

resource "azurerm_linux_web_app" "linux_web_app" {
  name                = var.app_service_name
  location            = var.location
  resource_group_name = var.resource_group_name
  service_plan_id     = azurerm_service_plan.app_service_plan.id

  site_config {
    always_on = false
  }

  app_settings = {
    WEBSITES_ENABLE_APP_SERVICE_STORAGE = "false"
  }
}
