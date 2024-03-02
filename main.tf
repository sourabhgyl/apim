resource "azurerm_resource_group" "sg-apim-rg" {
  name = "sg-apim-rg"
  location = var.location
}


resource "azurerm_virtual_network" "vnet-apim" {
  name                = "vnet-apim"
  resource_group_name = azurerm_resource_group.sg-apim-rg.name
  address_space       = ["10.0.0.0/8"]
  location            = var.location
}

resource "azurerm_subnet" "vnet-apim-default" {
  name                 = "vnet-apim-apim"
  resource_group_name  = azurerm_resource_group.sg-apim-rg.name
  address_prefixes     = ["10.0.0.0/16"]
  virtual_network_name = azurerm_virtual_network.vnet-apim-default.name
}