terraform {
  backend "azurerm" {
    resource_group_name  = "powershell-grp"
    storage_account_name = "appstore400089891210"
    container_name       = "subbu"
    key                  = "dev-terraform.tfstate"
  }
}
provider "azurerm" { 
features {}  
}
variable "resource_group_name" {
  description = "Provide the resource group name"
  type        = string
  default     = "test-rg12"
}

variable "resource_group_location" {
  description = "Provide the location of the resource group"
  type        = string
  default     = "west us"
}

# Random String Resource
resource "random_string" "myrandom" {
  length  = 6
  upper   = false 
  special = false
  numeric = false   
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type        = string
  default = "teststorageaccount"
}
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default = "dev"
}
## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type = string
  default = "vnet-app"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)
  default = ["10.1.0.0/16"]
}


# Web Subnet Name
variable "web_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
  default = "app-websubnet"
}
# Web Subnet Address Space
variable "web_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
  default = ["10.1.1.0/24"]
}
variable "num_instances" { 
description = "Number of instances to create" 
type = number 
default = 2 
}
module "finalrg" { 
  source = "./modules"  # Ensure this path is correct
  count = var.num_instances
  resource_group_name = "${var.resource_group_name}-${random_string.myrandom.result}}"  # Use the random string
  resource_group_location = var.resource_group_location
  storage_account_name = lower(replace("${var.storage_account_name}${random_string.myrandom.result}${count.index}", "/[^a-z0-9]/", ""))
  environment          =  var.environment
  vnet_name            =  "${var.vnet_name}-${random_string.myrandom.result}"
  vnet_address_space             =  var.vnet_address_space
  web_subnet_name           =  var.web_subnet_name
  web_subnet_address           =   var.web_subnet_address
}
