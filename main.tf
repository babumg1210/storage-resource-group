provider "azurerm" {
  features {}
}

module "my_resource_group" {
   source              = "./resource_group"  # Ensure this path is correct
   resource_group_name = "my-resource-group"
   location           = "East US"
}
