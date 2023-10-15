# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "myTERRACASE"
  location = "westeurope"
}

# Create a virtual network
resource "azurerm_virtual_network" "vnet" {
  name                = "myTERRAnetwork"
  address_space       = ["192.168.50.0/24"]
  location            = "westeurope"
  resource_group_name = azurerm_resource_group.rg.name
}
