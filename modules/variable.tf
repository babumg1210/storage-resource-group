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