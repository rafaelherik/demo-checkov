terraform {
    required_providers {
      azure_rm = {
        source  = "hashicorp/azurerm"
        version = "=3.0.0"
      }
    }

    backend "azurerm" {
      resource_group_name   = "az-weu-checkov-demo-rg"
      storage_account_name  = "azweucheckovdemost"
      container_name        = "tfstate"
      key                   = "checkov.terraform.tfstate"
      
    }
}


provider "azure_rm" {
  features {}
}