output "webapp_url" {
  value = azurerm_linux_web_app.app-service.default_hostname
}