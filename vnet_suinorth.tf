data "azurerm_virtual_network" "vnet_suinorth" {
  name                = var.vnet_name
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "snet_suinorth_pe" {
  name = "default"
  resource_group_name = var.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet_suinorth.name
}