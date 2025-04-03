data "azurerm_kubernetes_cluster" "aks" {
  name                = "cni"
  resource_group_name = "kartik-rg"
}
data "azurerm_client_config" "current" {}