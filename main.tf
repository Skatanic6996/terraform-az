provider "azurerm" {
  features {}
}

# Create a virtual network
resource "azurerm_virtual_network" "network" {
  name                = var.network_name
  address_space       = [var.cidr_block]
  location            = var.location
  resource_group_name = var.resource_group_name
}
# Create a subnet
resource "azurerm_subnet" "subnet" {
  name                 = "aks-subnet"
  resource_group_name = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.network.name
  address_prefixes     = [var.cidr_block]
}

# Create SQL Server virtual machines
resource "azurerm_mssql_server" "sql_server" {
  count                 = var.sql_server_count
  name                  = "sql-server-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.sql_server_nic[count.index].id]
  vm_size               = var.sql_server_vm_size
  collation = var.sql_server_collation

  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }
  storage_data_disk {
    name          = "sqlserver-datadisk-${count.index}"
    create_option = "Empty"
    lun           = 0
    disk_size_gb  = var.sql_server_data_disk_size
  }
}
resource "azurerm_network_interface" "sql_server_nic" {
  count               = var.sql_server_count
  name                = "nic-sql-server-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal-ip-config-${count.index}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create Report Server virtual machines
resource "azurerm_mssql_server" "report_server" {
  count                 = var.report_server_count
  name                  = "report-server-${count.index}"
  location              = var.location
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.report_server_nic[count.index].id]
  vm_size               = var.report_server_vm_size
  collation = var.report_server_collation

  storage_os_disk {
    name              = "osdisk-${count.index}"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    
  }
  storage_data_disk {
    name          = "reportserver-datadisk-${count.index}"
    create_option = "Empty"
    lun           = 0
    disk_size_gb  = var.report_server_data_disk_size
  }
}
resource "azurerm_network_interface" "report_server_nic" {
  count               = var.report_server_count
  name                = "nic-report-server-${count.index}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal-ip-config-${count.index}"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = "Dynamic"
  }
}

# Create Storage Account
resource "azurerm_storage_account" "storage" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = var.storage_account_location
  account_tier             = var.storage_account_tier
  account_replication_type = var.storage_account_replication_type

  tags = var.tags
}

# Define AKS Module
resource "azurerm_kubernetes_cluster" "aks" {
  name                = var.aks_name
  location            = var.location 
  resource_group_name = var.resource_group_name
  dns_prefix          = var.aks_dns_prefix
  kubernetes_version = var.aks_kubernetes_version

  default_node_pool {
    name       = "default"
    node_count = var.aks_node_count
    vm_size    = var.aks_node_vm_size
  }

  service_principal {
    client_id     = var.client_id
    client_secret = var.client_secret
  }

  network_profile {
    network_plugin = "kubenet"
    load_balancer_sku = "standard"
    dns_service_ip    = "10.2.0.10"
    docker_bridge_cidr = "172.17.0.1/16"
    pod_cidr          = "10.244.0.0/16"
    service_cidr      = "10.2.0.0/24"
  }


  tags = {
    Environment = "Test"
    Owner       = "Skichko"
  }
}


output "service_principal_client_id" {
  value = var.client_id
}

output "service_principal_client_secret" {
  value = var.client_secret
}