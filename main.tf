# Create a resource group
resource "azurerm_resource_group" "dev-rg" {
  name     = "dev-environment-rg"
  location = var.location
}

# Create app service plan
resource "azurerm_service_plan" "service-plan" {
  name = "simple-service-plan"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  os_type = "Linux"
  sku_name = "S1"
  tags = {
    environment = "dev"
  }
}
# Create Web App service for hosting Java Web App in Tomcat server
resource "azurerm_linux_web_app" "app-service" {
  name = "mysuperjavawebapp2"
  location = azurerm_resource_group.dev-rg.location
  resource_group_name = azurerm_resource_group.dev-rg.name
  service_plan_id = azurerm_service_plan.service-plan.id

        site_config {
        always_on          = true
          application_stack {
             java_server         = "TOMCAT"
             java_server_version = "8.5"
             java_version        = "11"
         }
        }
tags = {
    environment = "dev"
  }
}