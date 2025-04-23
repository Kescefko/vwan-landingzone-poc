resource "azurerm_firewall" "firewall_hub_suinorth" {
  depends_on = [ azurerm_virtual_hub.hub_suinorth ]

  name = var.firewall_hub_suinorth_name
  resource_group_name = var.resource_group_name
  location = var.location

  sku_name = "AZFW_Hub"
  sku_tier = "Premium"

  virtual_hub {
    virtual_hub_id = azurerm_virtual_hub.hub_suinorth.id
  }
}

# policy
resource "azurerm_firewall_policy" "firewall_hub_suinorth_policy" {
  name = "firewall_hub_suinorth_policy"
  location = var.location
  resource_group_name = azurerm_resource_group.rg.name
}

# rules
resource "azurerm_firewall_policy_rule_collection_group" "firewall_hub_suinorth_policy_rule_group" {
  name               = "firewall_hub_suinorth_policy_rule_group"
  firewall_policy_id = azurerm_firewall_policy.firewall_hub_suinorth_policy.id
  priority           = 100

  application_rule_collection {
    name     = "AppRules"
    priority = 100
    action   = "Allow"

    rule {
      name = "AllowHTTPSExampleSite"
      source_addresses = ["10.0.0.0/16"]
      destination_fqdns = ["www.example.com"]
      protocols {
        type = "Https"
        port = 443
      }
    }

    rule {
      name = "DenyHttp"
      source_addresses = ["10.0.0.0/16"]
      destination_fqdns = ["*"]
      protocols {
        type = "Http"
        port = "80"
      }
    }
  }
}

# Attach Firewall Policy to Firewall
resource "azurerm_firewall_policy_rule_collection_group" "policy_association" {
  name               = "firewall-policy-association"
  firewall_policy_id = azurerm_firewall.firewall_hub_suinorth.id
  priority           = 200
}