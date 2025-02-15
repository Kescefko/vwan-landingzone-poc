resource "azurerm_virtual_wan" "poc_vwan" {
  name                = var.vwan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = data.azurerm_resource_group.rg.location
}