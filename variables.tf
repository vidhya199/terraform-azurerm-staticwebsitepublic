#Azure provider variables 
variable "my_subscription_id" {
  description = "Azure subscription ID"
  type        = string
  sensitive   = true
}

# Resource Group variable declaration
variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "resource_group_location" {
  description = "Location of the resource group"
  type        = string
}

variable "tags" {
  description = "Tags to be applied to the resources"
  type        = map(string)
  default     = {}
}

# Storage Account variables
variable "storage_account_name" {
  description = "Name of the storage account"
  type        = string
}

variable "storage_account_tier" {
  description = "Tier of the storage account (e.g., Standard, Premium)"
  type        = string
  default     = "Standard"
}

variable "storage_account_replication_type" {
  description = "Replication type of the storage account (e.g., LRS, GRS)"
  type        = string
  default     = "LRS"
}

variable "index_document" {
  description = "Index document for the static website"
  type        = string
  default     = "index.html"
}

variable "error_404_document" {
  description = "Error document for the static website"
  type        = string
  default     = "error.html"
}