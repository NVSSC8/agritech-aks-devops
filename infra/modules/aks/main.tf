resource "azurerm_kubernetes_cluster" "this" {

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix = var.cluster_name

  sku_tier = "Free"

  default_node_pool {

    name       = "system"
    node_count = var.node_count

    vm_size = var.vm_size

    vnet_subnet_id = var.subnet_id

    upgrade_settings {
      max_surge = "10%"
    }
  }

  identity {
    type = "SystemAssigned"
  }

  oms_agent {
    log_analytics_workspace_id = var.workspace_id
  }

  network_profile {

    network_plugin = "azure"

    load_balancer_sku = "standard"
  }
}