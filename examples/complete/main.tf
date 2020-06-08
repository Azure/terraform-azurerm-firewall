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

module "networking" {
  source = "./test-module"
}

module "firewall" {
  source              = "../../"
  resource_group_name = module.networking.virtual_network_resource_group_name
  virtual_network     = module.networking.virtual_network
  prefix              = [local.unique_name_stub]
  suffix              = [local.unique_name_stub]
  public_ip_sku       = "Standard"
}
