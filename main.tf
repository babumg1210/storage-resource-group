variable "resource_group_name" {
  description = "provide the resource group name "
  type        = string
  default = "test-rg3"
}
variable "resource_group_location" {
  description = "provide the location of resource group"
  type        = string
  default = "west us"
}



module "finalrg" { 
        source = "./modules/" 
        resource_group_name = var.resource_group_name
        resource_group_location = var.resource_group_location
} 