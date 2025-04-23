resource "azurerm_virtual_network" "vnet_suinorth" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.101.0.0/24"]  # Safe range, not overlapping with 10.100.0.0/24

  tags = {
    environment = "poc"
  }
}

resource "azurerm_subnet" "snet_suinorth_pe" {
  name                 = "default"
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.vnet_suinorth.name
  address_prefixes     = ["10.101.0.0/27"]
}
