resource "azurerm_virtual_wan" "poc_vwan" {
  name                = var.vwan_name
  resource_group_name = data.azurerm_resource_group.rg.name
  location            = var.location

  timeouts {
    create = "60m"   # Increase timeout to 60 minutes
    delete = "30m"
  }
}