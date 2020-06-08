provider "azurerm" {
  version = "~>2.0"
  features {}
}

locals {
  unique_name_stub = substr(module.naming.unique-seed, 0, 5)
}

module "naming" {
  source = "git::https://github.com/Azure/terraform-azurerm-naming"
}

resource "azurerm_resource_group" "test_group" {
  name     = "${module.naming.resource_group.slug}-${module.naming.firewall.slug}-max-test-${local.unique_name_stub}"
  location = "uksouth"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${module.naming.virtual_network.name}"
  address_space       = ["10.0.0.0/16"]
  location            = azurerm_resource_group.test_group.location
  resource_group_name = azurerm_resource_group.test_group.name
}

resource "azurerm_subnet" "subnet" {
  name                 = "AzureFirewallSubnet"
  resource_group_name  = azurerm_resource_group.test_group.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

