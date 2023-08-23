variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Azure region for the resources"
  type        = string
}

variable "network_name" {
  description = "Name of the virtual network"
  type        = string
}

variable "cidr_block" {
  description = "CIDR block for the virtual network"
  type        = string
}

variable "sql_server_count" {
  description = "Number of SQL Server virtual machines"
  type        = number
}

variable "sql_server_vm_size" {
  description = "VM size for SQL Server virtual machines"
  type        = string
}

variable "report_server_count" {
  description = "Number of Report Server virtual machines"
  type        = number
}

variable "report_server_vm_size" {
  description = "VM size for Report Server virtual machines"
  type        = string
}


variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_replication_type" {
  description = "Storage account replication type"
  type        = string
}

variable "storage_account_tier" {
  description = "Storage account tier"
  type        = string
}

variable "storage_account_location" {
  description = "Azure region for the storage account"
  type        = string
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "aks_name" {
  description = "Name of the AKS cluster"
  type        = string
}

variable "aks_dns_prefix" {
  description = "DNS prefix for the AKS cluster"
  type        = string
}

variable "aks_kubernetes_version" {
  description = "Kubernetes version for the AKS cluster"
  type        = string
}

variable "aks_node_count" {
  description = "Number of nodes in the AKS cluster"
  type        = number
}

variable "aks_node_vm_size" {
  description = "VM size of the nodes in the AKS cluster"
  type        = string
}

variable "client_id" {
  description = "Azure AD Client ID for the service principal"
  type        = string
}

variable "client_secret" {
  description = "Azure AD Client Secret for the service principal"
  type        = string
}
variable "sql_server_mssql_edition" {
  description = "Edition of MSSQL for SQL Server (standard, enterprise, express)"
  type        = string
}

variable "report_server_mssql_edition" {
  description = "Edition of MSSQL for Report Server (standard, enterprise, express)"
  type        = string
}

variable "sql_server_data_disk_size" {
  description = "Size of the data disk for SQL Server (in GB)"
  type        = number
}

variable "report_server_data_disk_size" {
  description = "Size of the data disk for Report Server (in GB)"
  type        = number
}

variable "sql_server_collation" {
  description = "Collation for SQL Server"
  type        = string
}

variable "report_server_collation" {
  description = "Collation for Report Server"
  type        = string
}
