resource "azurerm_virtual_hub" "hub_suinorth" {
  depends_on = [ azurerm_virtual_wan.poc_vwan ]

  name                = var.vhub_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location
  virtual_wan_id      = azurerm_virtual_wan.poc_vwan.id
  address_prefix      = "10.100.0.0/24"
}