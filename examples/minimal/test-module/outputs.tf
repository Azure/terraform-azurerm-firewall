output "virtual_network" {
  value = azurerm_virtual_network.vnet
  depends_on = [
    azurerm_subnet.subnet
  ]
}

output "virtual_network_resource_group_name" {
  value = azurerm_resource_group.test_group.name
}
