provider "azurerm" {
  version = "~>2.0"
  features {}
}

module "networking" {
  source = "./test-module"
}

module "firewall" {
  source              = "../"
  resource_group_name = module.networking.virtual_network_resource_group_name
  virtual_network     = module.networking.virtual_network
}
