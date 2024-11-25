output "vnet_id" {
  description = "The ID of the created Virtual Network"
  value       = azurerm_virtual_network.vnet.id
}

output "subnet_ids" {
  description = "The IDs of the created subnets"
  value       = [for subnet in azurerm_subnet.subnet : subnet.id]
}