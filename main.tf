# Configure the Azure provider
terraform {

  cloud {
    organization = "ACME-CORP-LTD"

    workspaces {
      name = "terraWORKSPACE"
    }
  }

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
