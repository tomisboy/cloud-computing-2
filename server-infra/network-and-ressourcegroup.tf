# Erzeugen einer Resource Group
resource "azurerm_resource_group" "example" {
  # Name der Resource Group
  name     = var.resource_group_name
  # Standort der Resource Group
  location = var.location
}

# Erzeugen eines Virtual Networks
resource "azurerm_virtual_network" "example" {
  # Name des Virtual Networks
  name                = "my-virtual-network"
  # IP-Adresse des Virtual Networks
  address_space       = ["10.0.0.0/16"]
  # Standort des Virtual Networks
  location            = "${azurerm_resource_group.example.location}"
  # Name der Resource Group, in der das Virtual Network erzeugt wird
  resource_group_name = "${azurerm_resource_group.example.name}"
}

# Erzeugen eines Subnets
resource "azurerm_subnet" "example" {
  # Name des Subnets
  name                 = "my-subnet"
  # IP-Adresse des Subnets
  address_prefixes     = ["10.0.1.0/24"]
  # Name des Virtual Networks, zu dem das Subnet gehört
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  # Name der Resource Group, in der das Subnet erzeugt wird
  resource_group_name  = "${azurerm_resource_group.example.name}"
}

# Erzeugen einer Network Interface
resource "azurerm_network_interface" "example" {
  # Name der Network Interface
  name                = "my-nic"
  # Standort der Network Interface
  location            = "${azurerm_resource_group.example.location}"
  # Name der Resource Group, in der die Network Interface erzeugt wird
  resource_group_name = "${azurerm_resource_group.example.name}"

  # Konfiguration der IP-Adresse
  ip_configuration {
    name                          = "my-ip-configuration"
    # ID des Subnets, zu dem die IP-Adresse gehört
    subnet_id                     = "${azurerm_subnet.example.id}"
    # Zuweisung der privaten IP-Adresse
    private_ip_address_allocation = "Dynamic"
    # ID der öffentlichen IP-Adresse
    public_ip_address_id          = "${azurerm_public_ip.example.id}"
  }
}

# Erzeugen einer öffentlichen IP-Adresse
resource "azurerm_public_ip" "example" {
  # Name der öffentlichen IP-Adresse
  name                = "my-public-ip"
  # Standort der öffentlichen IP-Adresse
  location            = "${azurerm_resource_group.example.location}"
  # Name der Resource Group, in der die öffentliche IP-Adresse erzeugt wird
  resource_group_name = "${azurerm_resource_group.example.name}"
  # Zuweisung der IP-Adresse
  allocation_method   = "Dynamic"
}
