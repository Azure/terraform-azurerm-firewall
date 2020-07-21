provider "azurerm" {
  version = "~>2.0"
  features {}
}

module "naming" {
  source = "git::https://github.com/Azure/terraform-azurerm-naming"
  suffix = var.suffix
  prefix = var.prefix
}

resource "azurerm_public_ip" "firewall_pip" {
  name                = module.naming.public_ip.name
  location            = var.virtual_network.location
  resource_group_name = var.virtual_network.resource_group_name
  allocation_method   = "Static"
  sku                 = var.public_ip_sku
}

resource "azurerm_firewall" "firewall" {
  name                = module.naming.firewall.name
  location            = var.virtual_network.location
  resource_group_name = var.virtual_network.resource_group_name

  ip_configuration {
    name                 = module.naming.firewall_ip_configuration.name
    subnet_id            = data.azurerm_subnet.firewall_subnet.id
    public_ip_address_id = azurerm_public_ip.firewall_pip.id
  }
}
