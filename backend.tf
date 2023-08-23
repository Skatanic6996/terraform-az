terraform {
  backend "azurerm" {
    storage_account_name = "tfbackendstoragefortests"
    container_name       = "tflogs"
    key                  = "terraform.tfstate"
    access_key           = "LYeQoiA/2ifdPHmrGhN7VSNggZDwrqXftTLrg6D3OF56JHZpp1lipEoEZabF4O3VBTkePz+2093D+ASt+acDxw=="
  }
}