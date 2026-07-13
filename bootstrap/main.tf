resource "azurerm_resource_group" "tfstate" {
  name     = "${var.prefix}-tfstate-rg"
  location = var.location
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
  numeric = true
}

resource "azurerm_storage_account" "tfstate" {
  name                     = substr(lower(replace("${var.prefix}tfstate${random_string.suffix.result}", "-", "")), 0, 24)
  resource_group_name      = azurerm_resource_group.tfstate.name
  location                 = azurerm_resource_group.tfstate.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "tfstate" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.tfstate.name
  container_access_type = "private"
}
