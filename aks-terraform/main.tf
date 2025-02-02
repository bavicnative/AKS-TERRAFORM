# Create Resource Group
resource "azurerm_resource_group" "aks_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Create AKS Cluster
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_cluster_name
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  dns_prefix          = var.dns_prefix

  default_node_pool {
    name       = "default"
    node_count = var.node_count
    vm_size    = var.node_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  # Enable Role-Based Access Control (RBAC)
  role_based_access_control_enabled = true

  # Enable Azure Monitor
  oms_agent {
    log_analytics_workspace_id = azurerm_log_analytics_workspace.aks_logs.id
  }

  # Enable Kubernetes Dashboard (optional)
  addon_profile {
    kube_dashboard {
      enabled = true
    }
  }

  tags = {
    environment = "dev"
    project     = "AKS Terraform Deployment"
  }
}

# Create Log Analytics Workspace for Monitoring
resource "azurerm_log_analytics_workspace" "aks_logs" {
  name                = "aks-monitoring"
  location            = azurerm_resource_group.aks_rg.location
  resource_group_name = azurerm_resource_group.aks_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
