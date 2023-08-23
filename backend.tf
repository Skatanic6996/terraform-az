terraform {
  backend "azurerm" {
    storage_account_name = ""
    container_name       = "tflogs"
    key                  = "terraform.tfstate"
    access_key           = ""
  }
}