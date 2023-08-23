resource_group_name     = "TF"
location                = "West Europe"
network_name            = "vnet-for-tf"
cidr_block              = "10.0.0.0/16"
sql_server_count        = 1
sql_server_vm_size      = "Standard_D8as_v4"
report_server_count     = 1
report_server_vm_size   = "Standard_D8as_v4"
sql_server_mssql_edition = "standard"
report_server_mssql_edition = "standard"
sql_server_data_disk_size = 100
report_server_data_disk_size = 100
sql_server_collation         = "SQL_Latin1_General_CP1_CI_AS"
report_server_collation      = "SQL_Latin1_General_CP1_CI_AS"


storage_account_name             = "mystorageaccountfortftestsaks"
storage_account_replication_type = "LRS"
storage_account_tier             = "Standard"
storage_account_location         = "West Europe"


aks_name                = "PrivateAks123"
aks_dns_prefix          = "private-aks-dns"
aks_kubernetes_version = "1.24.9"
aks_node_count          = 1
aks_node_vm_size        = "Standard_D8as_v4"
client_id     = "<YOUR_CLIENT_ID>"
client_secret = "<YOUR_CLIENT_SECRET>"
