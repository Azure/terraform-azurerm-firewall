#Required Variables

variable "virtual_network" {
  type = object({
    name                    = string
    resource_group_name     = string
    location                = string
  })
  description = "The Virtual Network in which the AzureFirewallSubnet exists within."
}

variable "firewall_subnet_id" {
  type        = string
  description = "The firewall subnet id"
}

#Optional Variables
variable "prefix" {
  type        = list(string)
  description = "A naming prefix to be used in the creation of unique names for Azure resources."
  default     = []
}

variable "suffix" {
  type        = list(string)
  description = "A naming suffix to be used in the creation of unique names for Azure resources."
  default     = []
}

variable "public_ip_sku" {
  type        = string
  description = "The pricing and performance sku to create the Azure Firewalls public IP address to."
  default     = "Standard"
}


