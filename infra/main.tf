module "resource_group" {
  source   = "./modules/resource_group"
  name     = var.resource_group_name
  location = var.location
  tags     = local.common_tags
}

module "storage_account" {
  source              = "./modules/storage_account"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "vnet" {
  source              = "./modules/vnet"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  address_space       = var.vnet_address_space
  vm_subnet_prefixes  = var.vm_subnet_prefixes
  tags                = local.common_tags
}

module "nsg" {
  source              = "./modules/nsg"
  name_prefix         = local.name_prefix
  resource_group_name = module.resource_group.name
  location            = var.location
  tags                = local.common_tags
}

module "log_analytics" {
  source = "./modules/log_analytics"

  workspace_name      = "${local.name_prefix}-law"
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "app_insights" {
  source = "./modules/app_insights"

  name                = "${local.name_prefix}-appi"
  location            = var.location
  resource_group_name = module.resource_group.name

  workspace_id = module.log_analytics.workspace_id
}

module "acr" {
  source = "./modules/acr"

  name                = var.acr_name
  location            = var.location
  resource_group_name = module.resource_group.name
}

module "key_vault" {
  source = "./modules/key_vault"

  key_vault_name      = var.key_vault_name
  location            = var.location
  resource_group_name = module.resource_group.name
  tenant_id           = var.tenant_id
  tags                = local.common_tags
}


module "agent" {

  source = "./modules/agent"

  vm_name             = "${local.name_prefix}-agent"
  location            = var.location
  resource_group_name = module.resource_group.name

  subnet_id = module.vnet.vm_subnet_id

  vm_size = "Standard_D2s_v4"

  admin_username = var.admin_username
  ssh_public_key = var.ssh_public_key

  azure_devops_url = var.azure_devops_url
  agent_pool       = var.agent_pool
  pat_token        = var.pat_token
}

module "mysql" {
  source = "./modules/mysql"

  name                = "${local.name_prefix}-mysql"
  resource_group_name = module.resource_group.name
  location            = var.location

  admin_username = var.mysql_admin_username
  admin_password = var.mysql_admin_password
}

module "aks" {
  source = "./modules/aks"

  cluster_name        = var.aks_name
  location            = var.location
  resource_group_name = module.resource_group.name

  node_count = var.node_count
  vm_size    = var.vm_size

  subnet_id    = module.vnet.vm_subnet_id
  workspace_id = module.log_analytics.workspace_id
}