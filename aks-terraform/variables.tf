variable "location" {
  description = "Azure region for deployment"
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
  default     = "aks-resource-group"
}

variable "aks_cluster_name" {
  description = "AKS Cluster Name"
  type        = string
  default     = "aks-cluster"
}

variable "node_count" {
  description = "Number of AKS worker nodes"
  type        = number
  default     = 2
}

variable "node_vm_size" {
  description = "VM size for AKS worker nodes"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for AKS nodes"
  type        = string
  default     = "aksadmin"
}

variable "dns_prefix" {
  description = "DNS Prefix for the AKS Cluster"
  type        = string
  default     = "aksdns"
}
