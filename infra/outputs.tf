output "resource_group_name" {
  description = "Azure Resource Group Name"
  value       = module.resource_group.name
}

output "storage_account_name" {
  description = "Terraform Backend Storage Account"
  value       = module.storage_account.name
}

output "mysql_fqdn" {
  description = "Azure MySQL Flexible Server FQDN"
  value       = module.mysql.mysql_fqdn
}

output "acr_login_server" {
  description = "Azure Container Registry Login Server"
  value       = module.acr.login_server
}

output "vnet_id" {
  description = "Virtual Network ID"
  value       = module.vnet.vnet_id
}

output "key_vault_name" {
  description = "Azure Key Vault Name"
  value       = module.key_vault.key_vault_name
}

output "key_vault_id" {
  description = "Azure Key Vault Resource ID"
  value       = module.key_vault.key_vault_id
}

output "key_vault_uri" {
  description = "Azure Key Vault URI"
  value       = module.key_vault.key_vault_uri
}

output "aks_name" {
  description = "AKS Cluster Name"
  value       = module.aks.aks_name
}

output "aks_id" {
  description = "AKS Cluster Resource ID"
  value       = module.aks.aks_id
}

output "agent_vm_name" {
  description = "Azure DevOps Agent VM Name"
  value       = module.agent.vm_name
}

output "agent_public_ip" {
  description = "Azure DevOps Agent Public IP"
  value       = module.agent.public_ip
}

output "agent_private_ip" {
  description = "Azure DevOps Agent Private IP"
  value       = module.agent.private_ip
}

output "agent_principal_id" {
  description = "Azure DevOps Agent Managed Identity Principal ID"
  value       = module.agent.principal_id
}