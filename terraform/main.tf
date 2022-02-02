terraform {
  backend "azurerm" {
  storage_account_name = "epamtfbackendstorage"
  container_name = "terraform-tcg"
  key = "terraform.tfstate"

  }
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "~> 2.26"
    }
  }
}


provider "azurerm" {
  features {}
}

###############################

resource "azurerm_resource_group" "rg" {
  name     = "TCG-TF"
  location = "West Europe"
}

resource "azurerm_cognitive_account" "computervision" {
  name                = "tcg-computer-vision"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "ComputerVision"

  sku_name = "F0"

  tags = {
    Acceptance = "Test"
  }
}
