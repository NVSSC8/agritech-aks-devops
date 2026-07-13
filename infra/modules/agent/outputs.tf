output "vm_id" {
  description = "Azure DevOps Agent VM ID"
  value       = azurerm_linux_virtual_machine.agent.id
}

output "vm_name" {
  description = "Azure DevOps Agent VM Name"
  value       = azurerm_linux_virtual_machine.agent.name
}

output "public_ip" {
  description = "Public IP of Agent VM"
  value       = azurerm_public_ip.agent_pip.ip_address
}

output "private_ip" {
  description = "Private IP of Agent VM"
  value       = azurerm_network_interface.agent_nic.private_ip_address
}

output "principal_id" {
  description = "Managed Identity Principal ID"
  value       = azurerm_linux_virtual_machine.agent.identity[0].principal_id
}