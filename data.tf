data "azurerm_kubernetes_cluster" "aks" {
  name                = "your-aks-name" # replace with your AKS cluster name
  resource_group_name = "your-rg-name" # replace with your resource group name
}
data "azurerm_client_config" "current" {}