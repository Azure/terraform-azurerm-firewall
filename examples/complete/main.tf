provider "azurerm" {
  version = "~>2.0"
  features {}
}

resource "random_string" "random_name" {
  length    = 5
  special   = false
  lower     = true
  min_lower = 5
}

module "networking" {
  source = "./test-module"
}

module "firewall" {
  source              = "../"
  resource_group_name = module.networking.virtual_network_resource_group_name
  virtual_network     = module.networking.virtual_network
  prefix              = [random_string.random_name.result]
  suffix              = [random_string.random_name.result]
  public_ip_sku       = "Standard"
}
