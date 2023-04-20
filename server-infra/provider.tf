terraform {
  # Setzen der notwendigen Provider-Informationen
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.46.0"
    }
  }
  backend "azurerm" {
    resource_group_name    = "cc"
    storage_account_name   = "inf20068ccstorage"
    container_name         = "tfstate"
    key                    = "terraform.tfstate"
    subscription_id        = "db895fe7-8c64-430c-94ba-5fbf6a238bf9"
  }
}


provider "azurerm" {
  features {
     resource_group {
     prevent_deletion_if_contains_resources = false
  }
}
}
