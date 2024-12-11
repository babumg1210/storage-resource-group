# variables.tf

# Azure Service Principal Variables
variable "servicePrincipalId" {
  description = "The Client ID of the Azure Service Principal."
  type        = string
}

variable "servicePrincipalKey" {
  description = "The Client Secret of the Azure Service Principal."
  type        = string
}

variable "tenantId" {
  description = "The Tenant ID of the Azure Active Directory."
  type        = string
}

variable "subscriptionId" {
  description = "The Subscription ID for the Azure account."
  type        = string
}

# Resource Group Variables
variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "my-resource-group"  # Optional default value
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = "East US"  # Optional default value
}
}
