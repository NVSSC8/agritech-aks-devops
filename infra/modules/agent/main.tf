resource "azurerm_public_ip" "agent_pip" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = var.resource_group_name

  allocation_method = "Static"
  sku               = "Standard"
}

resource "azurerm_network_interface" "agent_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.agent_pip.id
  }
}

resource "azurerm_linux_virtual_machine" "agent" {

  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location

  size = var.vm_size

  admin_username = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.agent_nic.id
  ]

  disable_password_authentication = true

  admin_ssh_key {

    username   = var.admin_username
    public_key = var.ssh_public_key

  }

  source_image_reference {

    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"

  }

  os_disk {

    caching              = "ReadWrite"
    storage_account_type = "StandardSSD_LRS"

  }

  identity {

    type = "SystemAssigned"

  }
  custom_data = base64encode(templatefile("${path.module}/agent-cloud-init.yaml", {

    azure_devops_url = var.azure_devops_url
    agent_pool       = var.agent_pool
    agent_name       = var.vm_name
    pat_token        = var.pat_token
    admin_username   = var.admin_username

  }))

}

