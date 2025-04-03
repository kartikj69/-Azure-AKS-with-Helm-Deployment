# Azure AKS (Entra ID with Azure RBAC) with Helm Deployment

This repository demonstrates how to deploy resources on Azure Kubernetes Service (AKS) using Terraform and Helm. The setup integrates Azure Entra ID (formerly Azure AD) with Azure RBAC for authentication and addresses challenges related to token injection and kubeconfig automation.

## Purpose

- Deploy an AKS cluster with Azure Entra ID integration.
- Use Helm to deploy resources (e.g., NGINX) on the AKS cluster.
- Overcome challenges with authentication and kubeconfig management.

## Challenges

1. **No Client ID / Client Certificate**: Azure Entra ID with Azure RBAC does not generate client credentials (Client ID and Client Certificate) for authentication.
2. **`az aks` Command Issues**: The Azure CLI `az aks` commands fail due to token injection problems.
3. **Unreliable Kubeconfig Path Automation**: Automating the kubeconfig path is not reliable.

## Solution

- **Use Azure CLI Login**: Authenticate using the Azure CLI (`az login`) to handle Azure Entra ID authentication for the AKS cluster.
- Implement Terraform code to manage the AKS cluster and Helm resources.

## Prerequisites
1. Install [Terraform](https://www.terraform.io/downloads.html).
2. Install [Helm](https://helm.sh/docs/intro/install/).
3. Install [Kubelogin](https://github.com/Azure/kubelogin) for Azure Entra ID authentication.
4. Ensure you have access to an Azure subscription.

## Setup Instructions

1. Clone this repository:
    ```bash
    git clone https://github.com/kartikj69/-Azure-AKS-with-Helm-Deployment
    cd auth-AKS
    ```

2. Log in to Azure:
    ```bash
    az login
    ```

3. Initialize Terraform:
    ```bash
    terraform init
    ```

4. Apply the Terraform configuration:
    ```bash
    terraform apply
    ```

5. Retrieve the AKS cluster credentials:
    ```bash
    az aks get-credentials --resource-group <RESOURCE_GROUP_NAME> --name <AKS_CLUSTER_NAME>
    ```

6. Verify the AKS cluster connection:
    ```bash
    kubectl get nodes
    ```

## Files

- `provider.tf`: Configures the Azure provider and authentication.
- `main.tf`: Deploys Helm resources (e.g., NGINX).
- `vars.tf`: Defines variables for the Azure subscription.
- `data.tf`: Fetches data about the AKS cluster.
- `.gitignore`: Excludes sensitive files and Terraform state files.

## Notes

- Ensure you are logged in to Azure using the `az login` command before proceeding.
- Modify the `vars.tf` file to set your Azure subscription ID.
- Update the `data.tf` file with your existing AKS cluster name and resource group name.

## References

- [Azure Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/)
- [Terraform Azure Provider](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs)
- [Helm Documentation](https://helm.sh/docs/)
