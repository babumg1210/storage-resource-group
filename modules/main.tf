# Resource Block
# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}
resource "azurerm_storage_account" "storage_account" {
  name                     = var.storage_account_name
  resource_group_name                  =    azurerm_resource_group.myrg.name
  location              =    azurerm_resource_group.myrg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = var.environment
  }
}
resource "azurerm_virtual_network" "vnet" {
  name                = "${var.vnet_name}-${random_string.myrandom.result}"
  address_space       = var.vnet_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = var.environment
  }
}
# Resource-1: Create WebTier Subnet
resource "azurerm_subnet" "websubnet" {
  name                 = var.web_subnet_name
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = var.web_subnet_address  
}
resource "azurerm_private_endpoint" "example" {
  name                = "${var.storage_account_name}-endpoint"
  resource_group_name                 =    azurerm_resource_group.myrg.name
  location              =    azurerm_resource_group.myrg.location
  subnet_id           =       azurerm_subnet.id
  
  private_service_connection {
    name                           = "example-privateserviceconnection"
    private_connection_resource_id = azurerm_storage_account.storage_account.id
    is_manual_connection           = false
    subresource_names              = ["blob"]
  }
}
resource "azurerm_private_dns_zone" "example" {
  name                = "privatelink.blob.core.windows.net"
  resource_group_name =  azurerm_resource_group.myrg.name
}
resource "azurerm_private_dns_zone_virtual_network_link" "example" {
  name                  = "${var.vnet_name}-vnetlink"
  resource_group_name   =  azurerm_resource_group.myrg.name
  private_dns_zone_name = azurerm_private_dns_zone.example.name
  virtual_network_id    = azurerm_virtual_network.vnet.id
}
