variable "vm_name" {
  description = "Azure DevOps Agent VM Name"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
}

variable "admin_username" {
  description = "VM Administrator Username"
  type        = string
}

variable "ssh_public_key" {
  description = "SSH Public Key"
  type        = string
}

variable "azure_devops_url" {
  type = string
}

variable "agent_pool" {
  type = string
}

variable "pat_token" {
  type      = string
  sensitive = true
}