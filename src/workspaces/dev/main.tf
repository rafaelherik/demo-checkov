terraform {
    required_providers {
      azurerm = {
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


module "app-one" {
  source = "../../modules/app-one"
  resource_group_name = "myResourceGroup"
  location            = "eastus"
  vnet_name           = "myVnet"
  vnet_address_space  = "10.0.0.0/16"
  subnet_name         = "mySubnet"
  subnet_address_prefix = "10.0.1.0/24"
  nic_name            = "myNic"
  vm_name             = "myVM"
  vm_size             = "Standard_DS1_v2"
  admin_username      = "azureuser"
  admin_password      = "P@ssw0rd1234!"
}

provider "azurerm" {
  features {}
}