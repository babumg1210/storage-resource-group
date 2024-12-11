# Resource Block
# Create a resource group
resource "azurerm_resource_group" "myrg" {
  name     = var.resource_group_name
  location = var.resource_group_location
}