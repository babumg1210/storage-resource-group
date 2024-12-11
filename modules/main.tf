# Resource Block
# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  name                  =    azurerm_resource_group.myrg.name
  location              =    azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}

resource "azurerm_private_endpoint" "example" {
  name                = "${var.storage_account_name}-endpoint"
  name                  =    azurerm_resource_group.myrg.name
  location              =    azurerm_resource_group.myrg.location
  subnet_id           =       var.subnet_id
  
  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}
resource "azurerm_private_dns_zone" "example" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name = var.resource_group_name
}
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "${var.vnet_name}-vnetlink"
  resource_group_name   = var.resource_group_name
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = var.vnet_id
}
