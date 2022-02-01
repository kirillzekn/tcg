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
