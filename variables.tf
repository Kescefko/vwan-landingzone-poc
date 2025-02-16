variable "subscription_id" {
  default = "1c2b3b73-e5d4-4ab6-9ac4-c807cb39e0ef"
  sensitive = true
}

variable "resource_group_name" {
  default = "rg-gyorgy-shared-dev"
}

variable "vwan_name" {
  default = "poc-vwan"
}

variable "vhub_name" {
  default = "hub_suinorth"
}

variable "vnet_name" {
  default = "vnet-gyorgy-shared-dev-sn"
}

variable "firewall_hub_suinorth_name" {
  default = "fw-huvb_suinorth"
}