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
  deafult = "teststorageaccount"
}
variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
  default = "dev"
}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default = "storage-vnet"
}
variable "vnet_id" {
  description = "The ID of the virtual network"
  type = list(string)
  default = ["10.0.0.0/16"]
}
variable "subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
  default = "storage-subnet"
}
variable "subnet_id" {
  description = "The ID of the subnet"
  type = list(string)
  default = ["10.0.1.0/24"]
}

module "finalrg" { 
  source = "./modules"  # Ensure this path is correct
  resource_group_name = "${var.resource_group_name}-${random_string.myrandom.result}"  # Use the random string
  resource_group_location = var.resource_group_location
  name                 = "${var.storage_account_name}-${random_string.myrandom.result}"
  environment          =  var.environment
  vnet_name            =  "${var.vnet_name}-${random_string.myrandom.result}"
  vnet_id              =   var.vnet_id
  subnet_name           =  var.subnet_name
  subnet_id            =   var.subnet_id
}
