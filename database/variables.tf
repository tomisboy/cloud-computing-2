# Define variables
variable "resource_group_name" {
  type        = string
  description = "The name of the backend storage account resource group"
  default     = "cc-tf-db"
}



variable "name" {
  type    = string
  default = "inf20068db"
}

variable "location" {
  type    = string
  default = "westeurope"
}

variable "location_name" {
  type    = string
  default = "West Europe"
}

variable "default_experience" {
  type    = string
  default = "Azure Cosmos DB for MongoDB API"
}

variable "is_zone_redundant" {
  type    = bool
  default = false
}