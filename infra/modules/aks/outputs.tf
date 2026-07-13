output "aks_name" {
  description = "AKS Cluster Name"
  value       = azurerm_kubernetes_cluster.this.name
}

output "aks_id" {
  description = "AKS Resource ID"
  value       = azurerm_kubernetes_cluster.this.id
}

output "kubelet_identity" {
  description = "AKS Kubelet Managed Identity Object ID"
  value       = azurerm_kubernetes_cluster.this.kubelet_identity[0].object_id
}