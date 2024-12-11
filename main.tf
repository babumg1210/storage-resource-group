provider "azurerm" {
  features {}
}

module "my_resource_group" {
  source              = "./modules/resource_group"
  resource_group_name = "my-resource-group"
  location           = "East US"
}