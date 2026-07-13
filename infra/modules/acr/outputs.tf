output "login_server" {
  description = "Azure Container Registry Login Server"
  value       = azurerm_container_registry.this.login_server
}

output "id" {
  description = "Azure Container Registry Resource ID"
  value       = azurerm_container_registry.this.id
}