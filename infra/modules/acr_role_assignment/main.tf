resource "azurerm_role_assignment" "acr_pull" {

  principal_id = var.kubelet_identity

  role_definition_name = "AcrPull"

  scope = var.acr_id
}