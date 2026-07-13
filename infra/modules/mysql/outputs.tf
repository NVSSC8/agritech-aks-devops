output "mysql_fqdn" {
  description = "Azure MySQL Flexible Server FQDN"
  value       = azurerm_mysql_flexible_server.this.fqdn
}