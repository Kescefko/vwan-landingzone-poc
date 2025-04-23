resource "azurerm_virtual_hub_connection" "hub_spoke_connection_suinorth" {
  name = "hub_spoke_connection_suinorth"
  virtual_hub_id = azurerm_virtual_hub.hub_suinorth.id
  remote_virtual_network_id =azurerm_virtual_network.vnet_suinorth.id
  internet_security_enabled = true
}