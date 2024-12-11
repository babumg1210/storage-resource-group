## Virtual Network
variable "resource_group_name" {
  description = "provide the resource group name "
  type        = string
  default     = "test-rg"
}
variable "resource_group_location" {
  description = "provide the location of resource group"
  type        = string
  default     = "west us"
}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string
}
variable "storage_account_name" {
  description = "The name of the storage account"
  type = string
}
variable "subnet_id" {
  description = "The ID of the subnet"
  type        = string
}
variable "vnet_id" {
  description = "The ID of the virtual network"
  type        = string
}
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
}
