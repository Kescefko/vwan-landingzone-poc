resource "azurerm_resource_group" "rg" {
  name = var.resource_group_name
  location = var.firewall_hub_suinorth_name
}