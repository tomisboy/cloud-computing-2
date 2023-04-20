# Erzeugen einer Network Security Group
resource "azurerm_network_security_group" "example" {
  # Name der Network Security Group
  name                = "my-nsg"
  # Standort der Network Security Group
  location            = "${azurerm_resource_group.example.location}"
 # Name der Resource Group, in der die Network Security Group erzeugt wird
  resource_group_name = "${azurerm_resource_group.example.name}"

  # Konfiguration der Security Rule
  security_rule {
    name                       = "SSH"
    # Priorität der Security Rule
    priority                   = 1001
    # Richtung der Security Rule
    direction                  = "Inbound"
    # Zugriff auf die Security Rule
    access                     = "Allow"
    # Protokoll der Security Rule
    protocol                   = "Tcp"
    # Portbereich der Quelle
    source_port_range          = "*"
    # Portbereich des Ziels
    destination_port_range     = "22"
    # IP-Adresse der Quelle
    source_address_prefix      = "*"
    # IP-Adresse des Ziels
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "NodeJS"
    # Priorität der Security Rule
    priority                   = 1002
    # Richtung der Security Rule
    direction                  = "Inbound"
    # Zugriff auf die Security Rule
    access                     = "Allow"
    # Protokoll der Security Rule
    protocol                   = "Tcp"
    # Portbereich der Quelle
    source_port_range          = "*"
    # Portbereich des Ziels
    destination_port_range     = "5000"
    # IP-Adresse der Quelle
    source_address_prefix      = "*"
    # IP-Adresse des Ziels
    destination_address_prefix = "*"
  }



  
}

# Zuweisen der Network Security Group zur Network Interface
resource "azurerm_network_interface_security_group_association" "example" {
  # ID der Network Interface
  network_interface_id      = "${azurerm_network_interface.example.id}"
  # ID der Network Security Group
  network_security_group_id = "${azurerm_network_security_group.example.id}"
}
