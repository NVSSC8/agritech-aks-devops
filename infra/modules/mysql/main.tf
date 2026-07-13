resource "azurerm_mysql_flexible_server" "this" {

  name                = var.name
  resource_group_name = var.resource_group_name

  location = var.location

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  sku_name = "GP_Standard_D2ds_v4"

  version = "8.0.21"

  storage {

    size_gb = 20
  }
}