output "firewall_public_ip" {
  value = azurerm_public_ip.firewall_pip
}

output "firewall" {
  value = azurerm_firewall.firewall
}
