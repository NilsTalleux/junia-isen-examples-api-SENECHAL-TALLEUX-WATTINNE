output "app_service_url" {
  description = "The default hostname of the Linux App Service"
  value       = azurerm_linux_web_app.linux_web_app.default_hostname
}
