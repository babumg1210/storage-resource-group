## Virtual Network
variable "resource_group_name" {
  description = "provide the resource group name "
  type        = string
  #default     = "test-rg"
}
variable "resource_group_location" {
  description = "provide the location of resource group"
  type        = string
  #default     = "west us"
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type = string
}
## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type = string
  default = "vnet-default"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)
  default = ["10.0.0.0/16"]
}
# Web Subnet Name
variable "web_subnet_name" {
  description = "Virtual Network Web Subnet Name"
  type = string
  default = "websubnet"
}
# Web Subnet Address Space
variable "web_subnet_address" {
  description = "Virtual Network Web Subnet Address Spaces"
  type = list(string)
  default = ["10.0.1.0/24"]
}

