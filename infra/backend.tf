terraform {
  backend "azurerm" {
    resource_group_name  = "agritech-rg"
    storage_account_name = "agritechdevappxi9il"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}