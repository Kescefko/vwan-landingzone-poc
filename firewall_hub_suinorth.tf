resource "azurerm_firewall" "firewall_hub_suinorth" {
  depends_on = [ azurerm_virtual_hub.hub_suinorth ]

  name = var.firewall_hub_suinorth_name
  resource_group_name = var.resource_group_name
  location = data.azurerm_resource_group.rg.location

  sku_name = "AZFW_Hub"
  sku_tier = "Premium"

  virtual_hub {
    virtual_hub_id = azurerm_virtual_hub.hub_suinorth.id
  }
}