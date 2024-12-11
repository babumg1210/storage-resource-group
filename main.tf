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

module "finalrg" { 
  source = "./modules"  # Ensure this path is correct
  resource_group_name = "${var.resource_group_name}-${random_string.myrandom.result}"  # Use the random string
  resource_group_location = var.resource_group_location
}
