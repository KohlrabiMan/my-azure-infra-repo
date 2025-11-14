terraform {
  backend "azurerm" {
    resource_group_name  = "myResourceGroup"
    storage_account_name = "mystoragetf"
    container_name       = "my-tf-state-container"
    key                  = "terraform.tfstate"
  }
}