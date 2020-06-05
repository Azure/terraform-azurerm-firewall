data "azurerm_resource_group" "base" {
  name = var.virtual_network.resource_group_name
}

data "azurerm_subnet" "firewall_subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = var.virtual_network.resource_group_name
  virtual_network_name = var.virtual_network.name
}
