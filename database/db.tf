resource "azurerm_resource_group" "example" {
  # Name der Resource Group
  name     = var.resource_group_name
  # Standort der Resource Group
  location = var.location
}

# Define resource block for Cosmos DB account
resource "azurerm_cosmosdb_account" "example" {
  name                = var.name
  resource_group_name = var.resource_group_name
  location            = var.location
  offer_type          = "Standard"
  kind                = "MongoDB"
  is_virtual_network_filter_enabled = false
  enable_free_tier    = true
  capacity {
    total_throughput_limit = 1000
  }

  consistency_policy {
    consistency_level = "Session"
  }

  geo_location {
    location          = "${var.location_name}"
    failover_priority = 0
  }

  capabilities {
    name = "EnableMongo"
  }

  capabilities {
    name = "DisableRateLimitingResponses"
  }

  capabilities {
    name = "EnableServerless"
  }


  tags = {
    defaultExperience       = var.default_experience
    "hidden-cosmos-mmspecial" = ""
  }

  enable_automatic_failover = var.is_zone_redundant
}
