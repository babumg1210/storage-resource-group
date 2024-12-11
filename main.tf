provider "azurerm" {
  features {}
 # Optionally, you can specify the client ID, client secret, tenant ID, and subscription ID directly
  client_id       = var.servicePrincipalId
  client_secret   = var.servicePrincipalKey
  tenant_id       = var.tenantId
  subscription_id  = var.subscriptionId
}

module "my_resource_group" {
   source              = "./resource_group"  # Ensure this path is correct
   name     =  var.resource_group_name
  location =   var.location
}
